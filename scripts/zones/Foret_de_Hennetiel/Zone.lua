-----------------------------------
-- Zone: Foret de Hennetiel
-----------------------------------
local ID = require('scripts/zones/Foret_de_Hennetiel/IDs')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    zone:registerRegion(1, 529.946, 17.69, 157.579, 0, 0, 0) -- Ergon Locus, Circular Region, 17.69 Radius
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(360, 6, 455, 93)
    end

    return cs
end

zoneObject.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
