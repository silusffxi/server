-----------------------------------
-- Spell: Sleep II
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local dINT = caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)

    local duration = calculateDuration(90, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = xi.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = xi.effect.SLEEP_II
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then
        if target:addStatusEffect(params.effect, 2, 0, duration * resist) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end

return spellObject
