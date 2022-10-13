-----------------------------------
-- Area: Attohwa Chasm
--   NM: Alastor Antlion
-----------------------------------
mixins = { require("scripts/mixins/families/antlion_ambush_noaggro") }
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.GA_CHANCE, 50)
    mob:setMobMod(xi.mobMod.MUG_GIL, 10000)
    mob:addMod(xi.mod.FASTCAST, 10)
    mob:addMod(xi.mod.BINDRES, 40)
    mob:addMod(xi.mod.SILENCERES, 40)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PETRIFY)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
