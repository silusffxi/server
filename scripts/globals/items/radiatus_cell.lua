-----------------------------------
-- Radiatus Cell
-- ID 5368
-- Unlocks hand equipment
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return salvageUtil.onCellItemCheck(target, xi.effect.ENCUMBRANCE_I, 0x0040)
end

itemObject.onItemUse = function(target)
    return salvageUtil.onCellItemUse(target, xi.effect.ENCUMBRANCE_I, 0x0040, 3)
end

return itemObject
