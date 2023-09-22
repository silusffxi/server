-----------------------------------
-- Zone: Open_sea_route_to_Al_Zahbi (46)
-----------------------------------
local ID = zones[xi.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI]
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        local position = math.random(-2, 2) + 0.150
        player:setPos(position, -2.100, 3.250, 64)
    end

    return cs
end

zoneObject.onTransportEvent = function(player, transport)
    player:startEvent(1028)
    player:messageSpecial(ID.text.DOCKING_IN_AL_ZAHBI)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 1028 then
        player:setPos(0, 0, 0, 0, 50)
    end
end

return zoneObject
