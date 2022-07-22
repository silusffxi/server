-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_adamastor (???)
-- Spawns Adamastor
-- !pos -716 15 639 132
-----------------------------------
local ID = require('scripts/zones/Abyssea-La_Theine/IDs')
require('scripts/globals/abyssea')
require('scripts/globals/items')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.ADAMASTOR, { xi.items.TROPHY_SHIELD })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.TROPHY_SHIELD })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
