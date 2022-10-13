-----------------------------------
-- Zone: Stellar_Fulcrum
-----------------------------------
local ID = require('scripts/zones/Stellar_Fulcrum/IDs')
require('scripts/globals/conquest')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    zone:registerRegion(1, -522, -2, -49,  -517, -1, -43) -- To Upper Delkfutt's Tower
    zone:registerRegion(2, 318, -3, 2,  322, 1, 6) -- Exit BCNM to ?
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1
    return cs
end

zoneObject.onRegionEnter = function(player, region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            player:startEvent(8)
        end,

        [2] = function (x)
            player:startEvent(8)
        end,
    }
end

zoneObject.onRegionLeave = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 8 and option == 1 then
        player:setPos(-370, -178, -40, 243, 158)
    end
end

return zoneObject
