-----------------------------------
-- ID: 6428
-- Beryllium Bolt Quiver
-- When used, you will obtain one stack of Beryllium Bolts
-----------------------------------
require("scripts/globals/items")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = xi.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

itemObject.onItemUse = function(target)
    target:addItem(xi.items.BERYLLIUM_BOLT, 99)
end

return itemObject
