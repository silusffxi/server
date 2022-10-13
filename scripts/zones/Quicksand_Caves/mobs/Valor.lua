-----------------------------------
-- Area: Quicksand Caves
--  Mob: Valor
-- Coming of Age (San dOria Mission 8-1)
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    DespawnMob(mob:getID(), 180)
    mob:addMod(xi.mod.SLEEPRES, 50)
    mob:addMod(xi.mod.LULLABYRES, 50)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
