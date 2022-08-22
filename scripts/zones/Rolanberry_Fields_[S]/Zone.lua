-----------------------------------
-- Zone: Rolanberry_Fields_[S] (91)
-----------------------------------
local ID = require('scripts/zones/Rolanberry_Fields_[S]/IDs')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    xi.voidwalker.zoneOnInit(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-376.179, -30.387, -776.159, 220)
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
