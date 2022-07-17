---------------------------------------------------------------------------------------------------
-- func: announcement <message>
-- desc: Sends a server-wide announcement
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!announcement <message>")
end

function onTrigger(player, arg1)
    if (arg1 == nil) then
        error(player, "A message must be provided.")
        return
    end

    PostServerMessage(arg1)
end