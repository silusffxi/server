-----------------------------------
-- Spissatus Cell
-- ID 5384
-- Removes MP Down effect
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return salvageUtil.onCellItemCheck(target, xi.effect.DEBILITATION, 0x100)
end

itemObject.onItemUse = function(target)
    return salvageUtil.onCellItemUse(target, xi.effect.DEBILITATION, 0x100, 19)
end

return itemObject
