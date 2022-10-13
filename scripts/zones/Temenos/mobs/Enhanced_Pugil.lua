-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Pugil
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local spawn = math.random(3) == 1
        local battlefield = mob:getBattlefield()

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[6]):getAnimation() == xi.animation.CLOSE_DOOR then
            xi.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_W_GATE[6])
        end

        if spawn then
            for i = 0, 2 do
                if GetNPCByID(ID.npc.TEMENOS_W_CRATE[6]+i):getStatus() == xi.status.DISAPPEAR then
                    local mobX = mob:getXPos()
                    local mobY = mob:getYPos()
                    local mobZ = mob:getZPos()
                    GetNPCByID(ID.npc.TEMENOS_W_CRATE[6]+i):setPos(mobX, mobY, mobZ)
                    xi.limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[6]+i, battlefield, "crateMaskF6", battlefield:getLocalVar("crateMaskF6"))
                    break
                end
            end
        end
    end
end

return entity
