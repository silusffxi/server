-----------------------------------
-- Spell: Bad Breath
-- Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster
-- Spell cost: 212 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 5
-- Stat Bonus: INT+2, MND+2
-- Level: 61
-- Casting Time: 8.75 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
-- Combos: Fast Cast
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    local multi = 2.08
    if (caster:hasStatusEffect(xi.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end
    params.attackType = xi.attackType.BREATH
    params.damageType = xi.damageType.EARTH
    params.multiplier = multi
    params.tMultiplier = 1.5
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    local damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    params.diff = caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)

    if (damage > 0 and resist > 0.3) then
        local typeEffect = xi.effect.PARALYSIS
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 25, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end

    if (damage > 0 and resist > 0.3) then
    local typeEffect = xi.effect.WEIGHT
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 25, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end

    if (damage > 0 and resist > 0.3) then
    local typeEffect = xi.effect.POISON
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 4, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end

    if (damage > 0 and resist > 0.3) then
    local typeEffect = xi.effect.SLOW
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 2000, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end

    if (damage > 0 and resist > 0.3) then
    local typeEffect = xi.effect.SILENCE
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 25, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end

    if (damage > 0 and resist > 0.3) then
    local typeEffect = xi.effect.BIND
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 1, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end
        if (damage > 0 and resist > 0.3) then
    local typeEffect = xi.effect.BLINDNESS
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 25, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end

    return damage

end

return spellObject
