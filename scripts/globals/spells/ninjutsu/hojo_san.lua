-----------------------------------
-- Spell: Hojo:San
-- Description: Inflicts Slow on target.
-- Edited from slow.lua
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
    -- local dINT = caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    --Power for Hojo is a flat 30% reduction
    local power = 3000
    --Duration and Resistance calculation
    local duration = 420
    local params = {}
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.NINJUTSU
    params.bonus = 0
    duration = duration * applyResistance(caster, target, spell, params)
    --Calculates the resist chance from Resist Blind trait
    if math.random(0, 100) >= target:getMod(xi.mod.SLOWRES) then
        -- Spell succeeds if a 1 or 1/2 resist check is achieved
        if duration >= 210 then
            if target:addStatusEffect(xi.effect.SLOW, power, 0, duration) then
                spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
            else
                spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
            end

        else
            spell:setMsg(xi.msg.basic.MAGIC_RESIST)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST_2)
    end

    return xi.effect.SLOW
end

return spellObject
