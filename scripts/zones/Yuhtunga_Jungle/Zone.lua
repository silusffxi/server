-----------------------------------
-- Zone: Yuhtunga_Jungle (123)
-----------------------------------
local ID = zones[xi.zone.YUHTUNGA_JUNGLE]
require('scripts/quests/i_can_hear_a_rainbow')
require('scripts/missions/amk/helpers')
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.conq.setRegionalConquestOverseers(zone:getRegionID())

    xi.helm.initZone(zone, xi.helmType.HARVESTING)
    xi.helm.initZone(zone, xi.helmType.LOGGING)

    xi.bmt.updatePeddlestox(xi.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)

    GetMobByID(ID.mob.PYUU_THE_SPATEMAKER):setRespawnTime(math.random(5400, 7200))
end

zoneObject.onGameDay = function()
    xi.bmt.updatePeddlestox(xi.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conq.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(116.825, 6.613, 100, 140)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 11
    end

    -- AMK06/AMK07
    if xi.settings.main.ENABLE_AMK == 1 then
        xi.amk.helpers.tryRandomlyPlaceDiggingLocation(player)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 11 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

return zoneObject
