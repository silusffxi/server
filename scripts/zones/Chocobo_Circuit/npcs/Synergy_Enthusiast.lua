-----------------------------------
-- Area: Chocobo_Circuit
-- NPC: Synergy_Enthusiast
-- Standard Info NPC
-- !pos -324.546 0.000 -524.753 70
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(12001)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
