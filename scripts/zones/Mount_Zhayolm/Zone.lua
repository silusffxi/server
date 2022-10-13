-----------------------------------
-- Zone: Mount_Zhayolm (61)
-----------------------------------
local ID = require('scripts/zones/Mount_Zhayolm/IDs')
require('scripts/globals/helm')
require('scripts/globals/zone')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    GetMobByID(ID.mob.CERBERUS):setRespawnTime(math.random(12, 36) * 3600)

    xi.helm.initZone(zone, xi.helm.type.MINING)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if prevZone == xi.zone.LEBROS_CAVERN then
        player:setPos(681.950, -24.00, 369.936, 40)
    elseif player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-521.016, -6.191, 60.013, 126)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    player:entityVisualPacket("1pb1")
    player:entityVisualPacket("2pb1")
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 208 then
        player:setPos(0, 0, 0, 0, 63)
    end
end

return zoneObject
