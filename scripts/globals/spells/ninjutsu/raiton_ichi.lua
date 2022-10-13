-----------------------------------
-- Spell: Raiton: Ichi
-----------------------------------
require("scripts/globals/spells/damage_spell")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 15 + caster:getMerit(xi.merit.RAITON_EFFECT) -- T1 bonus debuff duration
    handleNinjutsuDebuff(caster, target, spell, 30, duration, xi.mod.EARTH_MEVA)

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
