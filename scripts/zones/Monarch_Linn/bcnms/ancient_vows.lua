-----------------------------------
-- Area: Monarch Linn
-- Name: Ancient Vows
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/titles")
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
        local arg8 = (player:getCurrentMission(xi.mission.log_id.COP) ~= xi.mission.id.cop.ANCIENT_VOWS or
                      xi.mission.getVar(player, xi.mission.log_id.COP, xi.mission.id.cop.ANCIENT_VOWS, 'Status') ~= 2) and 1 or 0

        if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.ANCIENT_VOWS then
            player:setLocalVar("battlefieldWin", battlefield:getID())
        end

        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option)
end

battlefieldObject.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        player:addExp(1000)
        player:addTitle(xi.title.TAVNAZIAN_TRAVELER)
    end
end

return battlefieldObject
