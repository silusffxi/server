﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include <cstring>

#include "../ai/ai_container.h"
#include "../ai/controllers/pet_controller.h"
#include "../ai/helpers/pathfind.h"
#include "../ai/helpers/targetfind.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/petskill_state.h"
#include "../mob_modifier.h"
#include "../mob_spell_container.h"
#include "../mob_spell_list.h"
#include "../packets/entity_update.h"
#include "../packets/pet_sync.h"
#include "../status_effect_container.h"
#include "../utils/battleutils.h"
#include "../utils/mobutils.h"
#include "../utils/petutils.h"

#include "common/utils.h"
#include "petentity.h"

CPetEntity::CPetEntity(PET_TYPE petType)
: CMobEntity()
, m_PetType(petType)
{
    objtype        = TYPE_PET;
    m_EcoSystem    = ECOSYSTEM::UNCLASSIFIED;
    allegiance     = ALLEGIANCE_TYPE::PLAYER;
    m_MobSkillList = 0;
    m_PetID        = 0;
    m_IsClaimable  = false;

    PAI = std::make_unique<CAIContainer>(this, std::make_unique<CPathFind>(this), std::make_unique<CPetController>(this), std::make_unique<CTargetFind>(this));
}

CPetEntity::~CPetEntity() = default;

PET_TYPE CPetEntity::getPetType()
{
    return m_PetType;
}

bool CPetEntity::isBstPet()
{
    return getPetType() == PET_TYPE::JUG_PET || objtype == TYPE_MOB;
}

std::string CPetEntity::GetScriptName()
{
    switch (getPetType())
    {
        case PET_TYPE::AVATAR:
            return "avatar";
            break;
        case PET_TYPE::WYVERN:
            return "wyvern";
            break;
        case PET_TYPE::JUG_PET:
            return "jug";
            break;
        case PET_TYPE::CHARMED_MOB:
            return "charmed";
            break;
        case PET_TYPE::AUTOMATON:
            return "automaton";
            break;
        case PET_TYPE::ADVENTURING_FELLOW:
            return "fellow";
            break;
        case PET_TYPE::CHOCOBO:
            return "chocobo";
            break;
        case PET_TYPE::LUOPAN:
            return "luopan";
            break;
        default:
            return "";
            break;
    }
}

WYVERN_TYPE CPetEntity::getWyvernType()
{
    XI_DEBUG_BREAK_IF(PMaster == nullptr);

    switch (PMaster->GetSJob())
    {
        case JOB_BLM:
        case JOB_BLU:
        case JOB_SMN:
        case JOB_WHM:
        case JOB_RDM:
        case JOB_SCH:
        case JOB_GEO:
            return WYVERN_TYPE::DEFENSIVE;
        case JOB_DRK:
        case JOB_PLD:
        case JOB_NIN:
        case JOB_BRD:
        case JOB_RUN:
            return WYVERN_TYPE::MULTIPURPOSE;
        case JOB_WAR:
        case JOB_SAM:
        case JOB_THF:
        case JOB_BST:
        case JOB_RNG:
        case JOB_COR:
        case JOB_DNC:
            return WYVERN_TYPE::OFFENSIVE;

        default:
            return WYVERN_TYPE::OFFENSIVE;
    };
}

void CPetEntity::PostTick()
{
    CBattleEntity::PostTick();
    std::chrono::steady_clock::time_point now = std::chrono::steady_clock::now();
    if (loc.zone && updatemask && status != STATUS_TYPE::DISAPPEAR && now > m_nextUpdateTimer)
    {
        m_nextUpdateTimer = now + 250ms;
        loc.zone->UpdateEntityPacket(this, ENTITY_UPDATE, updatemask);

        if (PMaster && PMaster->PPet == this)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)PMaster));
        }

        updatemask = 0;
    }
}

void CPetEntity::FadeOut()
{
    CMobEntity::FadeOut();
    loc.zone->UpdateEntityPacket(this, ENTITY_DESPAWN, UPDATE_NONE);
}

void CPetEntity::Die()
{
    PAI->ClearStateStack();
    PAI->Internal_Die(0s);
    luautils::OnMobDeath(this, nullptr);

    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::Die();
    if (PMaster && PMaster->PPet == this && PMaster->objtype == TYPE_PC)
    {
        petutils::DetachPet(PMaster);
    }
}

void CPetEntity::Spawn()
{
    // we need to skip CMobEntity's spawn because it calculates stats (and our stats are already calculated)
    if (PMaster && PMaster->objtype == TYPE_PC && m_EcoSystem == ECOSYSTEM::ELEMENTAL)
    {
        this->defaultMobMod(MOBMOD_MAGIC_DELAY, 12);
        this->defaultMobMod(MOBMOD_MAGIC_COOL, 48);
        mobutils::GetAvailableSpells(this);
    }

    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overridden function is bad
    CBattleEntity::Spawn();
    luautils::OnMobSpawn(this);
}

void CPetEntity::OnAbility(CAbilityState& state, action_t& action)
{
    auto* PAbility = state.GetAbility();
    auto* PTarget  = static_cast<CBattleEntity*>(state.GetTarget());

    std::unique_ptr<CBasicPacket> errMsg;
    if (IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (this != PTarget && distance(this->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            return;
        }

        if (battleutils::IsParalyzed(this))
        {
            setActionInterrupted(action, PTarget, MSGBASIC_IS_PARALYZED_2, 0);
            return;
        }

        action.id                    = this->id;
        action.actiontype            = PAbility->getActionType();
        action.actionid              = PAbility->getID();
        actionList_t& actionList     = action.getNewActionList();
        actionList.ActionTargetID    = PTarget->id;
        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.reaction        = REACTION::NONE;
        actionTarget.speceffect      = SPECEFFECT::RECOIL;
        actionTarget.animation       = PAbility->getAnimationID();
        actionTarget.param           = 0;
        auto prevMsg                 = actionTarget.messageID;

        int32 value = luautils::OnUseAbility(this, PTarget, PAbility, &action);
        if (prevMsg == actionTarget.messageID)
        {
            actionTarget.messageID = PAbility->getMessage();
        }
        if (actionTarget.messageID == 0)
        {
            actionTarget.messageID = MSGBASIC_USES_JA;
        }
        actionTarget.param = value;

        if (value < 0)
        {
            actionTarget.messageID = ability::GetAbsorbMessage(actionTarget.messageID);
            actionTarget.param     = -value;
        }
    }
}

bool CPetEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (targetFlags & TARGET_PLAYER && PInitiator->allegiance == allegiance)
    {
        return false;
    }
    return CMobEntity::ValidTarget(PInitiator, targetFlags);
}

void CPetEntity::OnPetSkillFinished(CPetSkillState& state, action_t& action)
{
    TracyZoneScoped;
    auto* PSkill  = state.GetPetSkill();
    auto* PTarget = dynamic_cast<CBattleEntity*>(state.GetTarget());

    if (PTarget == nullptr)
    {
        ShowWarning("CMobEntity::OnMobSkillFinished: PTarget is null");
        return;
    }

    PAI->TargetFind->reset();

    float distance  = PSkill->getDistance();
    uint8 findFlags = 0;

    /* // TODO: do pet skills need this?
    if (PSkill->getFlag() & SKILLFLAG_HIT_ALL)
    {
        findFlags |= FINDFLAGS_HIT_ALL;
    }
    */

    // Mob buff abilities also hit monster's pets
    if (PSkill->getValidTargets() == TARGET_SELF)
    {
        findFlags |= FINDFLAGS_PET;
    }

    action.id         = id;
    action.actiontype = (ACTIONTYPE)PSkill->getSkillFinishCategory();
    action.actionid   = PSkill->getID();

    if (PAI->TargetFind->isWithinRange(&PTarget->loc.p, distance))
    {
        if (PSkill->isAoE())
        {
            PAI->TargetFind->findWithinArea(PTarget, static_cast<AOE_RADIUS>(PSkill->getAoe()), PSkill->getRadius(), findFlags);
        }
        else if (PSkill->isConal())
        {
            float angle = 45.0f;
            PAI->TargetFind->findWithinCone(PTarget, distance, angle, findFlags);
        }
        else
        {
            if (this->objtype == TYPE_MOB && PTarget->objtype == TYPE_PC)
            {
                CBattleEntity* PCoverAbilityUser = battleutils::GetCoverAbilityUser(PTarget, this);
                if (PCoverAbilityUser != nullptr)
                {
                    PTarget = PCoverAbilityUser;
                }
            }

            PAI->TargetFind->findSingleTarget(PTarget, findFlags);
        }
    }
    else // Out of range
    {
        action.actiontype         = ACTION_MOBABILITY_INTERRUPT;
        actionList_t& actionList  = action.getNewActionList();
        actionList.ActionTargetID = PTarget->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation       = 0x1FC; // Hardcoded magic sent from the server
        actionTarget.messageID       = MSGBASIC_TOO_FAR_AWAY;
        actionTarget.speceffect      = SPECEFFECT::BLOOD;
        return;
    }

    uint16 targets = (uint16)PAI->TargetFind->m_targets.size();

    // No targets, perhaps something like Super Jump or otherwise untargetable
    if (targets == 0)
    {
        action.actiontype         = ACTION_MOBABILITY_INTERRUPT;
        action.actionid           = 28787; // Some hardcoded magic for interrupts
        actionList_t& actionList  = action.getNewActionList();
        actionList.ActionTargetID = id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation       = 0x1FC;
        actionTarget.messageID       = 0;
        actionTarget.reaction        = REACTION::ABILITY | REACTION::HIT;

        return;
    }

    PSkill->setTotalTargets(targets);
    PSkill->setTP(state.GetSpentTP());
    PSkill->setHPP(GetHPP());

    uint16 msg            = 0;
    uint16 defaultMessage = PSkill->getMsg();

    bool first{ true };
    for (auto&& PTargetFound : PAI->TargetFind->m_targets)
    {
        actionList_t& list = action.getNewActionList();

        list.ActionTargetID = PTargetFound->id;

        actionTarget_t& target = list.getNewActionTarget();

        list.ActionTargetID = PTargetFound->id;
        target.reaction     = REACTION::HIT;
        target.speceffect   = SPECEFFECT::HIT;
        target.animation    = PSkill->getAnimationID();
        target.messageID    = PSkill->getMsg();

        // reset the skill's message back to default
        PSkill->setMsg(defaultMessage);
        int32 damage = 0;

        target.animation = PSkill->getAnimationID();

        /* if (petType == PET_TYPE::AUTOMATON) // TODO: figure out Automaton
        {
            damage = luautils::OnAutomatonAbility(PTarget, this, PSkill, PMaster, &action);
        }
        else*/
        {
            damage = luautils::OnPetAbility(PTargetFound, this, PSkill, PMaster, &action);
        }

        if (msg == 0)
        {
            if (PSkill->getMsg() == 185) // TODO: remove when we rip out the original SMN implementation, this is xi.msg.basic.DAMAGE (not in .h)
            {
                msg = defaultMessage;
            }
            else
            {
                msg = PSkill->getMsg();
            }
        }
        else
        {
            msg = PSkill->getAoEMsg();
        }

        if (damage < 0)
        {
            msg          = MSGBASIC_SKILL_RECOVERS_HP; // TODO: verify this message does/does not vary depending on mob/avatar/automaton use
            target.param = std::clamp(-damage, 0, PTargetFound->GetMaxHP() - PTargetFound->health.hp);
        }
        else
        {
            target.param = damage;
        }

        target.messageID = msg;

        if (PSkill->hasMissMsg())
        {
            target.reaction   = REACTION::MISS;
            target.speceffect = SPECEFFECT::NONE;
            if (msg == PSkill->getAoEMsg())
            {
                msg = 282;
            }
        }
        else
        {
            target.reaction   = REACTION::HIT;
            target.speceffect = SPECEFFECT::HIT;
        }

        // TODO: Should this be reaction and not speceffect?
        if (target.speceffect == SPECEFFECT::HIT) // Formerly bitwise and, though nothing in this function adds additional bits to the field
        {
            target.speceffect = SPECEFFECT::RECOIL;
            target.knockback  = PSkill->getKnockback();
            if (first && (PSkill->getPrimarySkillchain() != 0))
            {
                SUBEFFECT effect = battleutils::GetSkillChainEffect(PTargetFound, PSkill->getPrimarySkillchain(), PSkill->getSecondarySkillchain(),
                                                                    PSkill->getTertiarySkillchain());
                if (effect != SUBEFFECT_NONE)
                {
                    int32 skillChainDamage = battleutils::TakeSkillchainDamage(this, PTargetFound, target.param, nullptr);
                    if (skillChainDamage < 0)
                    {
                        target.addEffectParam   = -skillChainDamage;
                        target.addEffectMessage = 384 + effect;
                    }
                    else
                    {
                        target.addEffectParam   = skillChainDamage;
                        target.addEffectMessage = 287 + effect;
                    }
                    target.additionalEffect = effect;
                }

                first = false;
            }
        }
        PTargetFound->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
        if (PTargetFound->isDead())
        {
            battleutils::ClaimMob(PTargetFound, this);
        }
        battleutils::DirtyExp(PTargetFound, this);
    }

    PTarget = dynamic_cast<CBattleEntity*>(state.GetTarget()); // TODO: why is this recast here? can state change between now and the original cast?

    if (PTarget)
    {
        if (PTarget->objtype == TYPE_MOB && (PTarget->isDead() || (this->getPetType() == PET_TYPE::AVATAR)))
        {
            battleutils::ClaimMob(PTarget, this);
        }
        battleutils::DirtyExp(PTarget, this);
    }
}
