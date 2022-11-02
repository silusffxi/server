-----------------------------------
-- Area: Western Adoulin
--  NPC: Barenngo
-- Type: Standard NPC and Quest NPC
-- Involved with Quests: 'Dont Ever Leaf Me'
-- !pos -101 3 14 256
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local DELM = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.DONT_EVER_LEAF_ME)
    if DELM == QUEST_ACCEPTED and player:getCharVar("DELM_Barenngo_Branch") < 1 then
        -- Progresses Quest: 'Dont Ever Leaf Me'
        player:startEvent(5015)
    elseif DELM == QUEST_ACCEPTED and player:getCharVar("DELM_Barenngo_Branch") < 2 then
        -- Reminds player of hint for Quest: 'Dont Ever Leaf Me'
        player:startEvent(5016)
    else
        -- Standard dialogue
        player:startEvent(5018)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 5015 then
        -- Progresses Quest: 'Dont Ever Leaf Me'
        player:setCharVar("DELM_Barenngo_Branch", 1)
    end
end

return entity
