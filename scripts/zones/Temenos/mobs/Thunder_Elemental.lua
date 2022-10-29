-----------------------------------
-- Area: Temenos E T
--  Mob: Thunder Elemental
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

local flags = xi.path.flag.WALLHACK
local pathNodes =
{
    [0] =
    {
        { -312.000, 0.000, 128.000 },
        { -312.000, 0.000, 152.000 },
    },

    [1] =
    {
        { -300.000, 0.000, 152.000 },
        { -300.000, 0.000, 128.000 },
    },

    [2] =
    {
        { -248.000, 0.000, 152.000 },
        { -248.000, 0.000, 128.000 },
    },

    [3] =
    {
        { -260.000, 0.000, 128.000 },
        { -260.000, 0.000, 152.000 },
    },
}

entity.onMobRoam = function(mob)
    if mob:getBattlefieldID() == 1300 then
        local offset = mob:getID() - ID.mob.TEMENOS_E_MOB[5]
        local pause = mob:getLocalVar("pause")
        if pause < os.time() then
            local point = (mob:getLocalVar("point") % 2) + 1
            mob:setLocalVar("point", point)
            mob:pathTo(pathNodes[offset][point][1], pathNodes[offset][point][2], pathNodes[offset][point][3], flags)
            mob:setLocalVar("pause", os.time() + 10)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local battlefield = mob:getBattlefield()
        if battlefield:getLocalVar("crateOpenedF5") ~= 1 then
            local mobID = mob:getID()
            if mobID >= ID.mob.TEMENOS_C_MOB[2] then
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(xi.mod.THUNDER_SDT, -5000)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2] + 8):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2] + 8)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2] + 14)
                end
            else
                local mobX = mob:getXPos()
                local mobY = mob:getYPos()
                local mobZ = mob:getZPos()
                local crateID = ID.npc.TEMENOS_E_CRATE[5] + (mobID - ID.mob.TEMENOS_E_MOB[5])
                GetNPCByID(crateID):setPos(mobX, mobY, mobZ)
                xi.limbus.spawnRandomCrate(crateID, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
            end
        end
    end
end

return entity
