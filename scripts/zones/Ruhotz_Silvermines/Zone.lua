-----------------------------------
-- Zone: Ruhotz_Silvermines
-----------------------------------
local ID = require('scripts/zones/Ruhotz_Silvermines/IDs')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
end

zoneObject.onInstanceZoneIn = function(player, instance)
    local cs = -1

    if player:getInstance() == nil then
        player:setPos(0, 0, 0, 0, 90)
        return cs
    end

    local pos = player:getPos()
    if pos.x == 0 and pos.y == 0 and pos.z == 0 then
        local entrypos = instance:getEntryPos()
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot)
    end

    return cs
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 10000 then
        player:setPos(-385.602, 21.970, 456.359, 0, 90)
    end
end

zoneObject.onInstanceLoadFailed = function()
    return 90
end

return zoneObject
