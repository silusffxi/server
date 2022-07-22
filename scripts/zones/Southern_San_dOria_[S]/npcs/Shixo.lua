-----------------------------------
-- Area: Southern San d'Oria [S]
--  NPC: Shixo
-- Type: Alter Ego Extravaganza
-- !gotoid 17105699
-----------------------------------
require('scripts/globals/extravaganza')

local entity = {}

entity.onTrigger = function(player, npc)
    local notes = player:getCurrency("allied_notes")

    xi.extravaganza.shadowEraTrigger(player, npc, notes)
end

entity.onEventFinish = function(player, csid, option)
    xi.extravaganza.shadowEraFinish(player, csid, option)
end

return entity
