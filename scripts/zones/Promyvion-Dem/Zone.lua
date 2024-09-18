-----------------------------------
-- Zone: Promyvion-Dem (18)
-----------------------------------
local ID = zones[xi.zone.PROMYVION_DEM]
-----------------------------------
---@type TZone
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- Define portal trigger areas.
    zone:registerTriggerArea(1,   160, 3,  -80, 0, 0, 0) -- Floor 1: Exit Promyvion
    zone:registerTriggerArea(2,  -280, 3,    0, 0, 0, 0) -- Floor 2: Return to floor 1
    zone:registerTriggerArea(3,  -160, 3,  440, 0, 0, 0) -- Floor 3 (North): Return to floor 2
    zone:registerTriggerArea(4,     0, 3, -320, 0, 0, 0) -- Floor 3 (South): Return to floor 2
    zone:registerTriggerArea(5,   360, 3,  240, 0, 0, 0) -- Floor 4: Return to floor 3
    zone:registerTriggerArea(6,   120, 3, -280, 0, 0, 0) -- Floor 1: Portal
    zone:registerTriggerArea(7,   -80, 3,  -80, 0, 0, 0) -- Floor 2: Portal SE - Destination: North
    zone:registerTriggerArea(8,   -80, 3,   80, 0, 0, 0) -- Floor 2: Portal NE - Destination: South
    zone:registerTriggerArea(9,  -280, 3, -200, 0, 0, 0) -- Floor 2: Portal SW - Destination: South
    zone:registerTriggerArea(10, -360, 3,   40, 0, 0, 0) -- Floor 2: Portal NW - Destination: North
    zone:registerTriggerArea(11,   40, 3, -200, 0, 0, 0) -- Floor 3 (South): Portal NE
    zone:registerTriggerArea(12, -120, 3, -240, 0, 0, 0) -- Floor 3 (South): Portal NW
    zone:registerTriggerArea(13, -120, 3, -400, 0, 0, 0) -- Floor 3 (South): Portal SW
    zone:registerTriggerArea(14, -320, 3,  160, 0, 0, 0) -- Floor 3 (North): Portal SW
    zone:registerTriggerArea(15,  -40, 3,  320, 0, 0, 0) -- Floor 3 (North): Portal NE
    zone:registerTriggerArea(16, -120, 3,  160, 0, 0, 0) -- Floor 3 (North): Portal SE

    -- Select portals.
    xi.promyvion.setupInitialPortals(zone)

    -- Update NM between Floor 3 islands.
    UpdateNMSpawnPoint(ID.mob.SATIATOR)
    GetMobByID(ID.mob.SATIATOR):setRespawnTime(math.random(3600, 21600))
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(185.891, 0, -52.331, 128)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
    local triggerAreaID = triggerArea:GetTriggerAreaID()

    switch (triggerAreaID) : caseof {
        [1] = function() -- Floor 1: Exit Promyvion
            player:startOptionalCutscene(46)
        end,

        [2] = function() -- Floor 2: Return to floor 1
            player:startOptionalCutscene(41)
        end,

        [3] = function() -- Floor 3 (North): Return to floor 2
            player:startOptionalCutscene(43)
        end,

        [4] = function() -- Floor 3 (South): Return to floor 2
            player:startOptionalCutscene(42)
        end,

        [5] = function() -- Floor 4: Return to floor 3
            -- Event 44 -> Return to floor 3 South
            -- Event 45 -> Return to floor 3 North
            player:startOptionalCutscene(44 + player:getCharVar('[Dem]ReturnNorth'))
        end,

        [6] = function() -- Floor 1: Portal
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET, 30)
        end,

        [7] = function() -- Floor 2: Portal SE - Destination: North
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 4, 36)
        end,

        [8] = function() -- Floor 2: Portal NE - Destination: South
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 5, 37)
        end,

        [9] = function() -- Floor 2: Portal SW - Destination: South
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 6, 34)
        end,

        [10] = function() -- Floor 2: Portal NW - Destination: North
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 7, 35)
        end,

        [11] = function() -- Floor 3 (South): Portal NE
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 1, 31)
        end,

        [12] = function() -- Floor 3 (South): Portal NW
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 2, 32)
        end,

        [13] = function() -- Floor 3 (South): Portal SW
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 3, 33)
        end,

        [14] = function() -- Floor 3 (North): Portal SW
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 8, 38)
        end,

        [15] = function() -- Floor 3 (North): Portal NE
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 9, 39)
        end,

        [16] = function() -- Floor 3 (North): Portal SE
            xi.promyvion.handlePortal(player, ID.npc.MEMORY_STREAM_OFFSET + 10, 40)
        end,
    }
end

zoneObject.onTriggerAreaLeave = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    switch (csid) : caseof {
        [31] = function() -- Floor 3 (South) to floor 4
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 0)
            end
        end,

        [32] = function() -- Floor 3 (South) to floor 4
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 0)
            end
        end,

        [33] = function() -- Floor 3 (South) to floor 4
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 0)
            end
        end,

        [38] = function() -- Floor 3 (North) to floor 4
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 1)
            end
        end,

        [39] = function() -- Floor 3 (North) to floor 4
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 1)
            end
        end,

        [40] = function() -- Floor 3 (North) to floor 4
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 1)
            end
        end,

        [44] = function() -- Floor 4: Return to floor 3 (South)
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 0)
            end
        end,

        [45] = function() --  Floor 4: Return to floor 3 (North)
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 0)
            end
        end,

        [46] = function() -- Floor 1: Exit promyvion
            if option == 1 then
                player:setCharVar('[Dem]ReturnNorth', 0)
                player:setPos(-226.193, -46.459, -280.046, 127, 14) -- To Hall of Transference (R)
            end
        end,
    }
end

return zoneObject
