-----------------------------------
-- Area: Attohwa Chasm
--   NM: Sargas
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 50, 0, 0)
    mob:getStatusEffect(xi.effect.SHOCK_SPIKES):setFlag(xi.effectFlag.DEATH)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN, { chance = 65, duration = math.random(5, 15) })
end

entity.onSpikesDamage = function(mob, target, damage)
    local INT_diff = mob:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)

    if INT_diff > 20 then
        INT_diff = 20 + (INT_diff - 20) * 0.5 -- INT above 20 is half as effective.
    end

    local dmg = (damage + INT_diff) * 0.5 -- INT adjustment and base damage averaged together.
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(mob, xi.magic.ele.THUNDER, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, xi.magic.ele.THUNDER, 0)
    dmg = adjustForTarget(target, dmg, xi.magic.ele.THUNDER)
    dmg = finalMagicNonSpellAdjustments(mob, target, xi.magic.ele.THUNDER, dmg)

    if dmg < 0 then
        dmg = 0
    end

    return xi.subEffect.SHOCK_SPIKES, xi.msg.basic.SPIKES_EFFECT_DMG, dmg
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 279)
end

entity.onMobDespawn = function(mob)
    -- UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 10800)) -- 2 to 3 hrs
end

return entity
