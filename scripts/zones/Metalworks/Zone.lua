-----------------------------------
-- Zone: Metalworks (237)
-----------------------------------
local ID = require('scripts/zones/Metalworks/IDs')
require('scripts/globals/conquest')
require('scripts/globals/keyitems')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-9.168, 0, 0.001, 128)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    if player:hasKeyItem(xi.ki.MESSAGE_TO_JEUNO_BASTOK) then
        player:ChangeMusic(0, 161)   --  Despair
        player:ChangeMusic(1, 161)   --  Despair
    end
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
