-----------------------------------
-- Area: Lower Delkfutt's Tower
-- NPC: Geomantic Reservoir
-- Unlocks: Geo-CHR
-- !pos 340.285 -15.601 19.968 184
-----------------------------------
require("scripts/globals/geomantic_reservoir")
require("scripts/globals/spell_data")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.geomanticReservoir.onTrigger(player, npc, xi.magic.spell.GEO_CHR)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.geomanticReservoir.onEventFinish(player, csid, xi.magic.spell.GEO_CHR)
end

return entity
