-----------------------------------
-- Area: Phomiuna_Aqueducts
--  NPC: Oil Lamp - Thunder (West)
-- !pos -63 -26 67
-----------------------------------
local ID = require("scripts/zones/Phomiuna_Aqueducts/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    local doorOffset = npc:getID()

    player:messageSpecial(ID.text.LAMP_OFFSET + 5) -- Thunder lamp
    npc:openDoor(7) -- Lamp animation

    local day = VanadielDayOfTheWeek()

    if day == xi.day.LIGHTNINGDAY then
        if GetNPCByID(doorOffset + 3):getAnimation() == 8 then -- Is the Water lamp open?
            GetNPCByID(doorOffset - 4):openDoor(15) -- Open Door _0rk
        end
    elseif day == xi.day.EARTHSDAY then
        if GetNPCByID(doorOffset + 4):getAnimation() == 8 then -- Is the Earth lamp open?
            GetNPCByID(doorOffset - 4):openDoor(15) -- Open Door _0rk
        end
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
