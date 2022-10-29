-----------------------------------
-- Area: Temenos N T
--  Mob: Thrym
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[2]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[2] + 2):updateEnmity(target)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[2] + 2):isDead() then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[2]):setStatus(xi.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[2] + 1):setStatus(xi.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[2] + 2):setStatus(xi.status.NORMAL)
        end
    end
end

return entity
