-----------------------------------
-- Area: Quicksand Caves
--   NM: Sabotender Bailarin
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 433)
end

return entity
