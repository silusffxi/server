-----------------------------------
-- Zone: RuAun_Gardens (130)
-----------------------------------
local ID = require('scripts/zones/RuAun_Gardens/IDs')
require('scripts/globals/missions')
require('scripts/globals/conquest')
require('scripts/globals/treasure')
require('scripts/globals/status')
require('scripts/globals/titles')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    for k, v in pairs(ID.npc.PORTALS) do
        zone:registerRegion(k, unpack(v["coords"]))
    end

    xi.treasure.initZone(zone)
    xi.conq.setRegionalConquestOverseers(zone:getRegionID())
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(333.017, -44.896, -458.35, 164)
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
    local p = ID.npc.PORTALS[region:GetRegionID()]

    -- Disable yellow teleporters to God Islands when Gods are spawned. https://www.bg-wiki.com/ffxi/Ru%27Aun_Gardens
    if p["genbu"] ~= nil and GetMobByID(ID.mob.GENBU):isAlive() then
        return
    end

    if p["seiryu"] ~= nil and GetMobByID(ID.mob.SEIRYU):isAlive() then
        return
    end

    if p["byakko"] ~= nil and GetMobByID(ID.mob.BYAKKO):isAlive() then
        return
    end

    if p["suzaku"] ~= nil and GetMobByID(ID.mob.SUZAKU):isAlive() then
        return
    end

    if p["green"] ~= nil then -- green portal
        if player:getCharVar("skyShortcut") == 1 then
            player:startEvent(42)
        else
            local title = player:getTitle()

            if title == xi.title.WARRIOR_OF_THE_CRYSTAL then
                player:startEvent(41, title)
            else
                player:startEvent(43, title)
            end
        end

    elseif p["portal"] ~= nil then -- blue portal
        if GetNPCByID(p["portal"]):getAnimation() == xi.anim.OPEN_DOOR then
            player:startOptionalCutscene(p["event"])
        end

    elseif type(p["event"]) == "table" then -- portal with random destination
        local events = p["event"]
        player:startOptionalCutscene(events[math.random(#events)])

    else -- portal with static destination
        player:startOptionalCutscene(p["event"])
    end
end

zone_object.onRegionLeave = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 41 and option ~= 0 then
        player:setCharVar("skyShortcut", 1)
    end
end

return zone_object
