-----------------------------------
-- Area: Windurst Woods
--  NPC: Orahi-Karapahi
-----------------------------------
local entity = {}

local path =
{
    { x = 63.612, y = -4.250, z = 102.695, wait = 4000 },
    { x = 60.000, y = -4.250, z = 103.188 },
    { x = 58.772, y = -4.250, z = 103.357, wait = 4000 },
    { x = 60.000, y = -4.250, z = 103.188 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(413)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
