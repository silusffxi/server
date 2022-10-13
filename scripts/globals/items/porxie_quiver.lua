-----------------------------------
-- ID: 6414
-- Porxie Quiver
-- When used, you will obtain one stack of Porxie Arrows
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
    target:addItem(xi.items.PORXIE_ARROW, 99)
end

return itemObject
