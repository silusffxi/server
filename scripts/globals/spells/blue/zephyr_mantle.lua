-----------------------------------
-- Spell: Zephyr Mantle
-- Creates shadow images that each absorb a single attack directed at you
-- Spell cost: 31 MP
-- Monster Type: Dragons
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+2
-- Level: 65
-- Casting Time: 7 seconds
-- Recast Time: 60 seconds
-- Duration: 5 minutes
-----------------------------------
-- Combos: Conserve MP
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local typeEffect = xi.effect.BLINK
    local power = 4
    local duration = 300

    if (caster:hasStatusEffect(xi.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end

    if (target:addStatusEffect(typeEffect, power, 0, duration) == false) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end

return spellObject
