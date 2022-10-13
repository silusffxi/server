-----------------------------------
-- Zone: Promyvion-Dem (18)
-----------------------------------
local ID = require('scripts/zones/Promyvion-Dem/IDs')
require('scripts/globals/promyvion')
require('scripts/globals/settings')
require('scripts/globals/status')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
--    UpdateNMSpawnPoint(ID.mob.SATIATOR)
--    GetMobByID(ID.mob.SATIATOR):setRespawnTime(math.random(3600, 21600))
    xi.promyvion.initZone(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(185.891, 0, -52.331, 128)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    if xi.settings.main.ENABLE_COP_ZONE_CAP == 1 then
        player:addStatusEffect(xi.effect.LEVEL_RESTRICTION, 30, 0, 0)
    end
end

zoneObject.onRegionEnter = function(player, region)
    xi.promyvion.onRegionEnter(player, region)
end

zoneObject.onRegionLeave = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 46 and option == 1 then
        player:setPos(-226.193, -46.459, -280.046, 127, 14) -- To Hall of Transference (R)
    end
end

return zoneObject
