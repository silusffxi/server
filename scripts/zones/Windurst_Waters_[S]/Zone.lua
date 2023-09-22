-----------------------------------
-- Zone: Windurst_Waters_[S] (94)
-----------------------------------
local ID = zones[xi.zone.WINDURST_WATERS_S]
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.chocobo.initZone(zone)
    xi.extravaganza.shadowEraHide(ID.npc.SHUVO)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    -- MOG HOUSE EXIT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(157 + math.random(1, 5), -5, -62, 192)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
