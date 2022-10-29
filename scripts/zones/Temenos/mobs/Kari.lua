-----------------------------------
-- Area: Temenos N T
--  Mob: Kari
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
mixins = { require("scripts/mixins/job_special") }
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

local flags = xi.path.flag.WALLHACK
local pathNodes =
{
    { 185.000, -82.000, 465.000 },
    { 215.000, -82.000, 465.000 },
    { 215.000, -82.000, 495.500 },
    { 185.000, -82.000, 495.000 },
}

entity.onMobRoam = function(mob)
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 4) + 1
        mob:setLocalVar("point", point)
        mob:pathTo(pathNodes[point][1], pathNodes[point][2], pathNodes[point][3], flags)
        mob:setLocalVar("pause", os.time() + 15)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local battlefield = mob:getBattlefield()
        battlefield:setLocalVar("randomF3", math.random(1, 3))
        xi.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[2])
    end
end

return entity
