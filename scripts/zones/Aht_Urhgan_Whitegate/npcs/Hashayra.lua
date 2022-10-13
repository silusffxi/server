-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Hashayra
-- Standard Info NPC
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local path =
{
    { x = 96.832, y = -6.000, z = -110.566, wait = 1000 },
    { rotation = 146, wait = 1000 },
    { x = 86.308, y = -6.000, z = -105.927, wait = 100 },
    { rotation = 14, wait = 1000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
    npc:pathThrough(path, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(676)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
