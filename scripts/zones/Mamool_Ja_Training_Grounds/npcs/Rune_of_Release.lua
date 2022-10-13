-----------------------------------
-- Area: Mamool Ja Training Grounds
-----------------------------------
require("scripts/globals/assault")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local instance = npc:getInstance()

    if instance:completed() then
        player:startEvent(100, 1)
    end

    return 1
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.assault.instanceOnEventFinish(player, csid, xi.zone.BHAFLAU_THICKETS)
    xi.assault.runeReleaseFinish(player, csid, option)
end

return entity
