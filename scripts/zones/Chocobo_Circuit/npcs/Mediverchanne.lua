-----------------------------------
-- Area: Chocobo_Circuit
-- NPC: Mediverchanne
-- Standard Info NPC
-- !pos -266.977 3.999 -524.848 70
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(242)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
