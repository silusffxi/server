-----------------------------------
-- ID: 15958
-- Combat Caster's Quiver
-- When used, you will obtain one Combat Caster's Arrow
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
    target:addItem(18740)
end

return itemObject
