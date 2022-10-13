-----------------------------------
-- ID: 10812
-- Item: Chocobo Shield +1
-- Dispense: Sakura Biscuit
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getFreeSlotsCount() == 0 then
        return xi.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return 0
end

itemObject.onItemUse = function(target)
    target:addItem(6010, 1)
end

return itemObject
