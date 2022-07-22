-----------------------------------
-- Area: Beaucedine Glacier
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-INT
-- !pos 8.527 -59.729 -104.909 111
-----------------------------------
require("scripts/globals/geomantic_reservoir")
require("scripts/globals/spell_data")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.geomanticReservoir.onTrigger(player, npc, xi.magic.spell.GEO_INT)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.geomanticReservoir.onEventFinish(player, csid, xi.magic.spell.GEO_INT)
end

return entity
