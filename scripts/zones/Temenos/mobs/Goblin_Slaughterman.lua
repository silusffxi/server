-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Slaughterman
-----------------------------------
require("scripts/globals/limbus")
mixins = { require("scripts/mixins/job_special") }
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[1]):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[1] + 1):isDead() then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[1]):setStatus(xi.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[1] + 1):setStatus(xi.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[1] + 2):setStatus(xi.status.NORMAL)
        end
    end
end

return entity
