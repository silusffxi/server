-----------------------------------
-- Area: Foret de Hennetiel
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-Gravity
-- !pos 232.687 -0.500 152.658 262
-----------------------------------
require("scripts/globals/geomantic_reservoir")
require("scripts/globals/spell_data")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.geomanticReservoir.onTrigger(player, npc, xi.magic.spell.GEO_GRAVITY)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.geomanticReservoir.onEventFinish(player, csid, xi.magic.spell.GEO_GRAVITY)
end

return entity
