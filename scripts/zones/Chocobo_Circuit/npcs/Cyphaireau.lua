-----------------------------------
-- Area: Chocobo_Circuit
-- NPC: Cyphaireau
-- Standard Info NPC
-- !pos -369.391 -4.000 -495.073 70
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(240)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
