-----------------------------------
-- func: setmoblevel
-- desc: Sets the target monsters level.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

local function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!setmoblevel <level>')
end

commandObj.onTrigger = function(player, lv)
    local target = player:getCursorTarget()

    -- set level
    if target and target:isMob() then
        player:PrintToPlayer(string.format('Old MainJob(jID: %s) LV: %i / SubJob(jID: %s) LV: %i ',
            target:getMainJob(), target:getMainLvl(), target:getSubJob(), target:getSubLvl()), xi.msg.channel.SYSTEM_3
        )

        target:setMobLevel(lv)

        player:PrintToPlayer(string.format('New MainJob(jID: %s) LV: %i / SubJob(jID: %s) LV: %i ',
            target:getMainJob(), target:getMainLvl(), target:getSubJob(), target:getSubLvl()), xi.msg.channel.SYSTEM_3
        )
    else
        error('must target a monster first!')
    end
end

return commandObj
