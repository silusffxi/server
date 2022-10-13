-----------------------------------
-- Incus Cell
-- ID 5365
-- Unlocks weapons and shields
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return salvageUtil.onCellItemCheck(target, xi.effect.ENCUMBRANCE_I, 0x0003)
end

itemObject.onItemUse = function(target)
    return salvageUtil.onCellItemUse(target, xi.effect.ENCUMBRANCE_I, 0x0003, 0)
end

return itemObject
