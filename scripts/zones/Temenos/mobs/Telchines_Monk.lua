-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Monk
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
mixins = { require("scripts/mixins/job_special") }
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

local flags = xi.path.flag.NONE
local pathNodes =
{
    [4] =
    {
        { 30.000, 80.000, 420.500 },
        { 10.000, 80.000, 420.500 },
    },

    [5] =
    {
        { 70.000, 80.000, 420.500 },
        { 50.000, 80.000, 420.500 },
    },
}

entity.onMobRoam = function(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[3]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2) + 1
        mob:setLocalVar("point", point)
        mob:pathTo(pathNodes[offset][point][1], pathNodes[offset][point][2], pathNodes[offset][point][3], flags)
        mob:setLocalVar("pause", os.time() + 10)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local battlefield = mob:getBattlefield()
        local random = battlefield:getLocalVar("randomF3")
        if (random == 1 and (mob:getID() % 2 == 1)) or (random == 2 and (mob:getID() % 2 == 0)) then
            battlefield:setLocalVar("randomF4", math.random(1, 4))
            xi.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[3])
        end
    end
end

return entity
