-----------------------------------
-- Area: Caedarva Mire
-- Door: Runic Seal
-- !pos -353 -3 -20 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/assault")
require("scripts/globals/instance")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
--[[    if player:hasKeyItem(xi.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT) then
        player:setCharVar("ShadesOfVengeance", 1)
        player:startEvent(143, 79, -6, 0, 99, 3, 0)
    else]]if not xi.instance.onTrigger(player, npc, xi.zone.PERIQIA) then
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventUpdate = function(player, csid, option, target)
    xi.assault.onAssaultUpdate(player, csid, option)
    xi.instance.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, target)
    xi.instance.onEventFinish(player, csid, option)
end

return entity
