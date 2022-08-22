-----------------------------------
-- Area: Chocobo_Circuit
-- NPC: Rodrigo
-- Standard Info NPC
-- !pos -502.384 0.000 -536.281 70
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(347)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
