-----------------------------------
-- Area: Beadeaux (254)
--   NM: Bi'Gho Headtaker
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 239)
end

return entity
