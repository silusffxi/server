-----------------------------------
-- ID: 17826
-- Item: Messhikimaru
-- Enchantment: Arcana Killer
-- Durration: 10 Mins
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)
    if (target:hasStatusEffect(xi.effect.ENCHANTMENT) == false) then
        target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 600, 17826)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ARCANA_KILLER, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ARCANA_KILLER, 20)
end

return itemObject
