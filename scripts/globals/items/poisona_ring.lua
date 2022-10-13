-----------------------------------
-- ID: 4148
-- Item: Antidote
-- Item Effect: This potion remedies poison.
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)

    if (target:hasStatusEffect(xi.effect.POISON) == true) then
        target:delStatusEffect(xi.effect.POISON)
    end
end

return itemObject
