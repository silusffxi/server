-----------------------------------
-- Area: Cloister of Tides
-- BCNM: Trial-size Trial by Water
-----------------------------------
local ID = require("scripts/zones/Cloister_of_Tides/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/quests")
-----------------------------------
local battlefieldObject = {}

battlefieldObject.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefieldObject.onBattlefieldRegister = function(player, battlefield)
end

battlefieldObject.onBattlefieldEnter = function(player, battlefield)
end

battlefieldObject.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER) == QUEST_COMPLETED) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option)
end

battlefieldObject.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        if not player:hasSpell(300) then
            player:addSpell(300)
            player:messageSpecial(ID.text.LEVIATHAN_UNLOCKED, 0, 0, 2)
        end
        if not player:hasItem(4181) then
            player:addItem(4181) -- Scroll of instant warp
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4181)
        end
        player:addFame(xi.quest.fame_area.NORG, 30)
        player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER)
    end
end

return battlefieldObject
