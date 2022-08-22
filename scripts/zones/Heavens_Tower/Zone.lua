-----------------------------------
-- Zone: Heavens_Tower
-----------------------------------
local ID = require('scripts/zones/Heavens_Tower/IDs')
require('scripts/globals/conquest')
require('scripts/globals/missions')
require('scripts/globals/zone')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    zone:registerRegion(1, -1, -1, -35, 1, 1, -33)
    zone:registerRegion(2, 6, -46, -30, 8, -44, -28)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(0, 0, 22, 192)
    end

    return cs
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onRegionEnter = function(player, region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Heaven's Tower exit portal
            player:startEvent(41)
        end,

        [2] = function (x)  -- Warp directly back to the first floor.
            player:startEvent(83)
        end,
    }
end

zone_object.onRegionLeave = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 41 then
        player:setPos(0, -17, 135, 60, 239)
    end
end

return zone_object
