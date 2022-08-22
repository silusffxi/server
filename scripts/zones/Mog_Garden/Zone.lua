-----------------------------------
-- Zone: Mog Garden (280)
-----------------------------------
require('scripts/globals/mog_garden')
local ID = require('scripts/zones/Mog_Garden/IDs')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    xi.mog_garden.onInitialize(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-2.517, 0.452, -5.068, 190)
    end

    cs = xi.mog_garden.onZoneIn(player, prevZone)

    return cs
end

zone_object.onRegionEnter = function(player, region)
    xi.mog_garden.onRegionEnter(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
    xi.mog_garden.onRegionEnter(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    xi.mog_garden.onRegionEnter(player, csid, option)
end

return zone_object
