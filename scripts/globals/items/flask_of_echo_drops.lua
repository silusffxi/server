-----------------------------------
-- ID: 4151
-- Item: Echo Drops
-- Item Effect: This potion remedies silence.
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)

    if (target:hasStatusEffect(xi.effect.SILENCE) == true) then
        target:delStatusEffect(xi.effect.SILENCE)
    end
end

return itemObject
