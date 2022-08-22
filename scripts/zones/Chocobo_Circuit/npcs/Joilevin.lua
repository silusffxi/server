-----------------------------------
-- Area: Chocobo_Circuit
-- NPC: Joilevin
-- Standard Info NPC
-- !pos -319.937 0.000 -467.799 70
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(236)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
