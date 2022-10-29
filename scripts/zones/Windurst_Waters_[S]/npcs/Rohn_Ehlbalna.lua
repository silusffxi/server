-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Rohn Ehlbalna
-- Type: Standard NPC
-- !pos -43.473 -4.5 46.496 94
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.quest.log_id.CRYSTAL_WAR, xi.quest.id.crystalWar.REDEEMING_ROCKS) == QUEST_ACCEPTED and
        player:getCharVar("RedeemingRocksProg") == 1
    then
        player:startEvent(114) -- 2nd CS quest "Redeeming Rocks"
    else
        player:startEvent(440)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 114 then -- Finish "Redeeming Rocks" second CS
        player:setCharVar("RedeemingRocksProg", 2)
    end
end

return entity
