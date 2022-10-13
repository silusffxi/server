-----------------------------------
-- Area: Windurst Woods
--  NPC: Dhahah
-----------------------------------
local entity = {}

local path =
{
    { x = 18.947, y = 0.000, z = 86.480 },
    { x = 16.665, z = 78.920 },
    { x = 12.472, z = 70.061 },
    { x = 16.665, z = 78.920 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
