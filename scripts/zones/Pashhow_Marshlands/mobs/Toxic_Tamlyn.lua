-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Toxic Tamlyn
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 213)
end

return entity
