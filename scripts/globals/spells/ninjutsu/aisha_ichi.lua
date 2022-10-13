-----------------------------------
-- Spell: Aisha: Ichi
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local effect = xi.effect.ATTACK_DOWN
    -- Base Stats
    -- local dINT = (caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT))
    --Duration Calculation
    local params = {}
    params.diff = nil
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.NINJUTSU
    params.bonus = 0
    params.effect = nil
    local resist = applyResistance(caster, target, spell, params)
    --Base power is 15 and is not affected by resistaces.
    local power = 15

    --Calculates Resist Chance
    if (resist >= 0.125) then
        local duration = 120 * resist

        if (duration >= 50) then
            -- Erases a weaker attack down and applies the stronger one
            local attackdown = target:getStatusEffect(effect)
            if (attackdown ~= nil) then
                if (attackdown:getPower() < power) then
                    target:delStatusEffect(effect)
                    target:addStatusEffect(effect, power, 0, duration)
                    spell:setMsg(xi.msg.basic.MAGIC_ENFEEB)
                else
                    -- no effect
                    spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
                end
            else
                target:addStatusEffect(effect, power, 0, duration)
                spell:setMsg(xi.msg.basic.MAGIC_ENFEEB)
            end
        else
            spell:setMsg(xi.msg.basic.MAGIC_RESIST)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST_2)
    end

    return effect
end

return spellObject
