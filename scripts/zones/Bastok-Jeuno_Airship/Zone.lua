-----------------------------------
-- Zone: Bastok-Jeuno_Airship
-----------------------------------
local ID = require('scripts/zones/Bastok-Jeuno_Airship/IDs')
require('scripts/globals/zone')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0 then
        player:setPos(math.random(-4, 4), 1, math.random(-23, -12))
    end

    return cs
end

zone_object.onTransportEvent = function(player, transport)
    player:startEvent(100)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 100 then
        local prevzone = player:getPreviousZone()

        if prevzone == xi.zone.PORT_JEUNO then
            player:setPos(0, 0, 0, 0, xi.zone.PORT_BASTOK)
        elseif prevzone == xi.zone.PORT_BASTOK then
            player:setPos(0, 0, 0, 0, xi.zone.PORT_JEUNO)
        end
    end
end

return zone_object
