-----------------------------------
-- Area: Chocobo_Circuit
-- NPC: Chaquoillons
-- Standard Info NPC
-- !pos -270.716 -4.000 -465.199 70
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(238)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
