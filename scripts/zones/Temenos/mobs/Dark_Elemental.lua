-----------------------------------
-- Area: Temenos E T
--  Mob: Dark Elemental
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        switch (mob:getID()): caseof
        {
            [ID.mob.TEMENOS_E_MOB[7]] = function ()
                if GetMobByID(ID.mob.TEMENOS_E_MOB[7]+1):isDead() then
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[7]):setStatus(xi.status.NORMAL)
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[7]+1):setStatus(xi.status.NORMAL)
                end
            end,
            [ID.mob.TEMENOS_E_MOB[7]+1] = function ()
                if GetMobByID(ID.mob.TEMENOS_E_MOB[7]):isDead() then
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[7]):setStatus(xi.status.NORMAL)
                    GetNPCByID(ID.npc.TEMENOS_E_CRATE[7]+1):setStatus(xi.status.NORMAL)
                end
            end,
        }
    end
end

return entity
