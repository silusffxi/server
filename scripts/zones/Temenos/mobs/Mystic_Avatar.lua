-----------------------------------
-- Area: Temenos E T
--  Mob: Mystic Avatar
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        mob:setMod(xi.mod.FIRE_SDT, 10000)    -- No damage.
        mob:setMod(xi.mod.ICE_SDT, 10000)     -- No damage.
        mob:setMod(xi.mod.WIND_SDT, 10000)    -- No damage.
        mob:setMod(xi.mod.EARTH_SDT, 10000)   -- No damage.
        mob:setMod(xi.mod.THUNDER_SDT, 10000) -- No damage.
        mob:setMod(xi.mod.WATER_SDT, 10000)   -- No damage.
        mob:setMod(xi.mod.LIGHT_SDT, 10000)   -- No damage.
        mob:setMod(xi.mod.DARK_SDT, -5000)    -- 50% more damage.
    end
end

entity.onMobEngaged = function(mob, target)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2] then --Carbuncle (Central Temenos 2nd Floor)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2] + 2):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2] + 1):updateEnmity(target)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local mobID = mob:getID()
        local battlefield = mob:getBattlefield()
        if mobID <= ID.mob.TEMENOS_E_MOB[6] + 4 then
            local floor = ((mobID - (ID.mob.TEMENOS_E_MOB[1] + 4)) / 9) + 1
            local crateMask = battlefield:getLocalVar("crateMaskF" .. floor)
            if crateMask == 0 then
                xi.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_E_GATE[floor])
            end
        elseif mobID >= ID.mob.TEMENOS_C_MOB[2] + 9 then
            local element_offset = mobID - ID.mob.TEMENOS_C_MOB[2] + 8
            local partner_offset = element_offset % 6 -- Levithan's partner starts at 0
            GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(xi.mod.FIRE_SDT - 1 + element_offset, -5000) -- ? IDK
            if GetMobByID(ID.mob.TEMENOS_C_MOB[2] + 3 + partner_offset):isAlive() then
                DespawnMob(ID.mob.TEMENOS_C_MOB[2] + 3 + partner_offset)
                SpawnMob(ID.mob.TEMENOS_C_MOB[2] + 9 + partner_offset)
            end
        end

    end
end

return entity
