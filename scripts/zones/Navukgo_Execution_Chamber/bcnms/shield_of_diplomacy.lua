-----------------------------------
-- Area: Navukgo Execution Chamber
-- BCNM: TOAU-22 Shield of Diplomacy
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
-----------------------------------
local battlefieldObject = {}

battlefieldObject.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefieldObject.onBattlefieldInitialise = function(battlefield)
    local karababa  = battlefield:insertEntity(8, true, true)

    karababa:setSpawn(360.937, -116.5, 376.937, 0)
    karababa:spawn()
end

battlefieldObject.onBattlefieldRegister = function(player, battlefield)
end

battlefieldObject.onBattlefieldEnter = function(player, battlefield)
end

battlefieldObject.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        local arg8 = player:hasCompletedMission(xi.mission.log_id.TOAU, xi.mission.id.toau.SHIELD_OF_DIPLOMACY) and 1 or 0

        player:setLocalVar("battlefieldWin", battlefield:getID())

        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option)
end

battlefieldObject.onEventFinish = function(player, csid, option)
end

return battlefieldObject
