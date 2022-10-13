-----------------------------------
-- Area: Giddeus (145)
--   NM: Juu Duzu the Whirlwind
-----------------------------------
require("scripts/globals/hunts")
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 280)
end

return entity
