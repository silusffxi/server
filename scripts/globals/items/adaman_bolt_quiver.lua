-----------------------------------
-- ID: 5913
-- Adaman Bolt Quiver
-- When used, you will obtain one stack of Adaman Bolts
-----------------------------------
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
    target:addItem(19801, 99)
end

return itemObject
