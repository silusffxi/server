-----------------------------------
-- Area: Apollyon
--  NPC: Armoury Crate
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/limbus")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

local loot =
{
    [1292] =
    {
        -- NE_Apollyon floor 1
        [1] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1953, droprate = 304 }, -- SAM
                { itemid = 1943, droprate =  18 }, -- PLD
                { itemid = 1941, droprate = 200 }, -- THF
                { itemid = 2715, droprate = 200 }, -- DNC
                { itemid = 2661, droprate =  36 }, -- PUP
                { itemid = 1933, droprate =  18 }, -- MNK
                { itemid = 1939, droprate =  36 }, -- RDM
                { itemid = 1935, droprate = 411 }, -- WHM
                { itemid = 2717, droprate = 482 }, -- SCH
                { itemid = 1947, droprate =  18 }, -- BST
            },

            {
                { itemid =    0, droprate = 1000 }, -- SAM
                { itemid = 1953, droprate =  304 }, -- SAM
                { itemid = 1943, droprate =   18 }, -- PLD
                { itemid = 1941, droprate =  200 }, -- THF
                { itemid = 2715, droprate =  200 }, -- DNC
                { itemid = 2661, droprate =   36 }, -- PUP
                { itemid = 1933, droprate =   18 }, -- MNK
                { itemid = 1939, droprate =   36 }, -- RDM
                { itemid = 1935, droprate =  411 }, -- WHM
                { itemid = 2717, droprate =  482 }, -- SCH
                { itemid = 1947, droprate =   18 }, -- BST
            },
        },

        -- NE_Apollyon floor 2
        [2] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1947, droprate =  26 }, -- BST
                { itemid = 1933, droprate =  53 }, -- MNK
                { itemid = 1943, droprate =  26 }, -- PLD
                { itemid = 2661, droprate =  26 }, -- PUP
                { itemid = 1937, droprate = 395 }, -- BLM
                { itemid = 1957, droprate = 289 }, -- DRG
                { itemid = 1941, droprate =  53 }, -- THF
                { itemid = 1939, droprate = 112 }, -- RDM
                { itemid = 2657, droprate = 477 }, -- BLU
            },

            {
                { itemid =    0, droprate =  1000 }, -- Nothing
                { itemid = 1947, droprate =    26 }, -- BST
                { itemid = 1933, droprate =    53 }, -- MNK
                { itemid = 1943, droprate =    26 }, -- PLD
                { itemid = 2661, droprate =    26 }, -- PUP
                { itemid = 1937, droprate =   395 }, -- BLM
                { itemid = 1957, droprate =   289 }, -- DRG
                { itemid = 1941, droprate =    53 }, -- THF
                { itemid = 1939, droprate =   112 }, -- RDM
                { itemid = 2657, droprate =   477 }, -- BLU
            },
        },

        -- NE_Apollyon floor 3
        [3] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1931, droprate =  788 }, -- WAR
                { itemid = 1939, droprate =   30 }, -- RDM
                { itemid = 1953, droprate =  130 }, -- SAM
                { itemid = 1957, droprate =  100 }, -- DRG
                { itemid = 1947, droprate =   90 }, -- BST
                { itemid = 1933, droprate =   30 }, -- MNK
                { itemid = 1941, droprate =   99 }, -- THF
                { itemid = 2661, droprate =   61 }, -- PUP
                { itemid = 2715, droprate =   30 }, -- DNC
                { itemid = 1943, droprate =  160 }, -- PLD
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1931, droprate =  788 }, -- WAR
                { itemid = 1939, droprate =   30 }, -- RDM
                { itemid = 1953, droprate =  130 }, -- SAM
                { itemid = 1957, droprate =  100 }, -- DRG
                { itemid = 1947, droprate =   90 }, -- BST
                { itemid = 1933, droprate =   30 }, -- MNK
                { itemid = 1941, droprate =   99 }, -- THF
                { itemid = 2661, droprate =   61 }, -- PUP
                { itemid = 2715, droprate =   30 }, -- DNC
                { itemid = 1943, droprate =  160 }, -- PLD
            },

            {
                { itemid =    0, droprate = 180 }, -- Nothing
                { itemid = 1633, droprate =  30 }, -- Clot Plasma
                { itemid =  821, droprate =  40 }, -- Rainbow Thread
                { itemid = 1311, droprate =  50 }, -- Oxblood
                { itemid = 1883, droprate =  40 }, -- Shell Powder
                { itemid = 2004, droprate =  20 }, -- Carapace Powder
            },

            {
                { itemid =    0, droprate = 180 }, -- Nothing
                { itemid = 1633, droprate =  30 }, -- Clot Plasma
                { itemid =  821, droprate =  40 }, -- Rainbow Thread
                { itemid = 1311, droprate =  50 }, -- Oxblood
                { itemid = 1883, droprate =  40 }, -- Shell Powder
                { itemid = 2004, droprate =  20 }, -- Carapace Powder
            },
        },

        -- NE_Apollyon floor 4
        [4] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1949, droprate = 326 }, -- BRD
                { itemid = 1945, droprate = 256 }, -- DRK
                { itemid = 1951, droprate = 395 }, -- RNG
                { itemid = 1959, droprate = 279 }, -- SMN
                { itemid = 1955, droprate = 256 }, -- NIN
                { itemid = 2659, droprate = 326 }, -- COR
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1949, droprate =  326 }, -- BRD
                { itemid = 1945, droprate =  256 }, -- DRK
                { itemid = 1951, droprate =  395 }, -- RNG
                { itemid = 1959, droprate =  279 }, -- SMN
                { itemid = 1955, droprate =  256 }, -- NIN
                { itemid = 2659, droprate =  326 }, -- COR
            },
        },

        -- NE_Apollyon floor 5
        [5] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1910, droprate = 1000 }, -- Smoky Chip
            },

            {
                { itemid =    0, droprate = 100 }, -- Nothing
                { itemid = 2127, droprate =  59 }, -- Metal Chip
            },
        },
    },

    -- Apollyon: NW
    [1290] =
    {
        -- NW_Apollyon floor 1
        [1] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 100 }, -- Nothing
                { itemid = 1937, droprate =  25 }, -- BLM
                { itemid = 2657, droprate = 175 }, -- BLU
                { itemid = 1957, droprate = 100 }, -- DRG
                { itemid = 1943, droprate =  25 }, -- PLD
                { itemid = 1953, droprate = 250 }, -- SAM
                { itemid = 2717, droprate =  75 }, -- SCH
                { itemid = 1931, droprate = 225 }, -- WAR
                { itemid = 1935, droprate =  50 }, -- WHM
            },
        },

        -- NW_Apollyon floor 2
        [2] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 100 }, -- Nothing
                { itemid = 1943, droprate = 235 }, -- PLD
                { itemid = 2659, droprate =  59 }, -- COR
                { itemid = 1945, droprate = 235 }, -- DRK
                { itemid = 1955, droprate = 147 }, -- NIN
                { itemid = 1951, droprate = 118 }, -- RNG
                { itemid = 1959, droprate = 176 }, -- SMN
                { itemid = 1935, droprate = 110 }, -- WHM
            },
        },

        -- NW_Apollyon floor 3
        [3] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
                { itemid =    0, droprate = 1000 }, -- Nothing
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
                { itemid =    0, droprate = 1000 }, -- Nothing
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
                { itemid =    0, droprate = 1000 }, -- Nothing
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
                { itemid =    0, droprate = 1000 }, -- Nothing
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
                { itemid =    0, droprate = 1000 }, -- Nothing
            },

            {
                { itemid = 1947, droprate = 133 }, -- BST
                { itemid = 1933, droprate = 133 }, -- MNK
                { itemid = 1943, droprate = 133 }, -- PLD
                { itemid = 2661, droprate = 133 }, -- PUP
                { itemid = 1939, droprate = 110 }, -- RDM
                { itemid = 1941, droprate = 400 }, -- THF
            },

            {
                { itemid =    0, droprate = 400 }, -- Nothing
                { itemid =  646, droprate =  50 }, -- Adaman Ore
                { itemid = 1633, droprate =  50 }, -- Clot Plasma
                { itemid =  664, droprate =  50 }, -- Darksteel Sheet
                { itemid =  645, droprate =  50 }, -- Darksteel Ore
                { itemid = 1311, droprate =  50 }, -- Oxblood
                { itemid = 1681, droprate =  50 }, -- Light Steel
                { itemid =  821, droprate =  50 }, -- Rainbow Thread
                { itemid = 1883, droprate =  50 }, -- Shell Powder
            },

            {
                { itemid =    0, droprate = 400 }, -- Nothing
                { itemid =  646, droprate =  50 }, -- Adaman Ore
                { itemid = 1633, droprate =  50 }, -- Clot Plasma
                { itemid =  664, droprate =  50 }, -- Darksteel Sheet
                { itemid =  645, droprate =  50 }, -- Darksteel Ore
                { itemid = 1311, droprate =  50 }, -- Oxblood
                { itemid = 1681, droprate =  50 }, -- Light Steel
                { itemid =  821, droprate =  50 }, -- Rainbow Thread
                { itemid = 1883, droprate =  50 }, -- Shell Powder
            },
        },

        -- NW_Apollyon floor 4
        [4] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
                { itemid =    0, droprate = 1000 }, -- Nothing
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
                { itemid =    0, droprate = 1000 }, -- Nothing
            },

            {
                { itemid =    0, droprate = 100 }, -- Nothing
                { itemid = 1937, droprate =  80 }, -- BLM
                { itemid = 2657, droprate =  70 }, -- BLU
                { itemid = 1949, droprate =  48 }, -- BRD
                { itemid = 1947, droprate =  30 }, -- BST
                { itemid = 2659, droprate =  25 }, -- COR
                { itemid = 1957, droprate =  19 }, -- DRG
                { itemid = 1945, droprate =  48 }, -- DRK
                { itemid = 1933, droprate =  90 }, -- MNK
                { itemid = 1955, droprate = 100 }, -- NIN
                { itemid = 2661, droprate =  48 }, -- PUP
                { itemid = 1939, droprate = 136 }, -- RDM
                { itemid = 1951, droprate =  80 }, -- RNG
                { itemid = 1953, droprate = 110 }, -- SAM
                { itemid = 1959, droprate =  95 }, -- SMN
                { itemid = 2715, droprate = 123 }, -- DNC
                { itemid = 1935, droprate =  48 }, -- WHM
            },
        },

        -- NW_Apollyon floor 5
        [5] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1937, droprate = 109 }, -- BLM
                { itemid = 2657, droprate = 152 }, -- BLU
                { itemid = 1949, droprate = 283 }, -- BRD
                { itemid = 1947, droprate = 109 }, -- BST
                { itemid = 2659, droprate =  65 }, -- COR
                { itemid = 2715, droprate = 130 }, -- DNC
                { itemid = 1957, droprate =  65 }, -- DRG
                { itemid = 1945, droprate = 174 }, -- DRK
                { itemid = 1933, droprate = 130 }, -- MNK
                { itemid = 1955, droprate = 196 }, -- NIN
                { itemid = 1943, droprate = 174 }, -- PLD
                { itemid = 2661, droprate = 174 }, -- PUP
                { itemid = 1939, droprate = 109 }, -- RDM
                { itemid = 1951, droprate = 130 }, -- RNG
                { itemid = 1953, droprate = 304 }, -- SAM
                { itemid = 2717, droprate =  87 }, -- SCH
                { itemid = 1959, droprate = 217 }, -- SMN
                { itemid = 1941, droprate = 174 }, -- THF
                { itemid = 1931, droprate = 130 }, -- WAR
                { itemid = 1935, droprate = 109 }, -- WHM
            },

            {
                { itemid = 1937, droprate = 109 }, -- BLM
                { itemid = 2657, droprate = 152 }, -- BLU
                { itemid = 1949, droprate = 283 }, -- BRD
                { itemid = 1947, droprate = 109 }, -- BST
                { itemid = 2659, droprate =  65 }, -- COR
                { itemid = 2715, droprate = 130 }, -- DNC
                { itemid = 1957, droprate =  65 }, -- DRG
                { itemid = 1945, droprate = 174 }, -- DRK
                { itemid = 1933, droprate = 130 }, -- MNK
                { itemid = 1955, droprate = 196 }, -- NIN
                { itemid = 1943, droprate = 174 }, -- PLD
                { itemid = 2661, droprate = 174 }, -- PUP
                { itemid = 1939, droprate = 109 }, -- RDM
                { itemid = 1951, droprate = 130 }, -- RNG
                { itemid = 1953, droprate = 304 }, -- SAM
                { itemid = 2717, droprate =  87 }, -- SCH
                { itemid = 1959, droprate = 217 }, -- SMN
                { itemid = 1941, droprate = 174 }, -- THF
                { itemid = 1931, droprate = 130 }, -- WAR
                { itemid = 1935, droprate = 109 }, -- WHM
            },

            {
                { itemid =    0, droprate = 300 }, -- Nothing
                { itemid = 1937, droprate = 109 }, -- BLM
                { itemid = 2657, droprate = 152 }, -- BLU
                { itemid = 1949, droprate = 283 }, -- BRD
                { itemid = 1947, droprate = 109 }, -- BST
                { itemid = 2659, droprate =  65 }, -- COR
                { itemid = 2715, droprate = 130 }, -- DNC
                { itemid = 1957, droprate =  65 }, -- DRG
                { itemid = 1945, droprate = 174 }, -- DRK
                { itemid = 1933, droprate = 130 }, -- MNK
                { itemid = 1955, droprate = 196 }, -- NIN
                { itemid = 1943, droprate = 174 }, -- PLD
                { itemid = 2661, droprate = 174 }, -- PUP
                { itemid = 1939, droprate = 109 }, -- RDM
                { itemid = 1951, droprate = 130 }, -- RNG
                { itemid = 1953, droprate = 304 }, -- SAM
                { itemid = 2717, droprate =  87 }, -- SCH
                { itemid = 1959, droprate = 217 }, -- SMN
                { itemid = 1941, droprate = 174 }, -- THF
                { itemid = 1931, droprate = 130 }, -- WAR
                { itemid = 1935, droprate = 109 }, -- WHM
            },

            {
                { itemid = 1988, droprate = 1000 }, -- Magenta Chip
            },

            {
                { itemid = 2127, droprate =  59 }, -- Metal Chip
                { itemid =    0, droprate = 100 }, -- Nothing
            },
        },
    },

    -- CS Apollyon
    [1294] =
    {
        [1] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 2127, droprate =  59 }, -- Metal Chip
                { itemid =    0, droprate = 100 }, -- Nothing
            },
        },
    },

    -- Central Apollyon
    [1296] =
    {
        -- Proto-Omega
        [1] =
        {
            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid =    0, droprate = 1000 }, -- Nothing
                { itemid = 1875, droprate = 1000 }, -- Ancient Beastcoin
            },

            {
                { itemid = 1925, droprate = 659 }, -- Omega's Eye
                { itemid = 1927, droprate = 394 }, -- Omega's Foreleg
                { itemid = 1928, droprate = 388 }, -- Omega's Hinf Leg
                { itemid = 1929, droprate = 404 }, -- Omega's Tail
            },

            {
                { itemid = 1928, droprate = 394 }, -- Omega's Hind Leg
                { itemid = 1929, droprate = 402 }, -- Omega's Tail
                { itemid = 1925, droprate = 659 }, -- Omega's Eye
                { itemid = 1927, droprate = 383 }, -- Omega's Foreleg
            },

            {
                { itemid =    0, droprate = 735 }, -- Nothing
                { itemid = 1926, droprate = 265 }, -- Omega's Heart
            },
        },
    },
}

entity.onTrade = function(player,npc,trade)
end

entity.onTrigger = function(player, npc)
    local battlefield = player:getBattlefield()

    if not battlefield then
        return
    end

    local crateID = npc:getID()
    local model   = npc:getModelId()
    local bfid    = battlefield:getID()
    local hold    = false

    if npc:getLocalVar("open") == 0 then
        switch (bfid): caseof
        {
            -- NW Apollyon Crate Handling
            [1290] = function()
                if crateID ~= ID.npc.APOLLYON_NW_CRATE[5] then
                    for i = 1, 4 do
                        for j = 1, 5 do
                            if crateID == ID.npc.APOLLYON_NW_CRATE[i][j] then
                                if model == 960 then
                                    xi.battlefield.HealPlayers(battlefield) -- HP/MP Chest.
                                elseif model == 961 then
                                    xi.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc) -- Item Chest.
                                elseif model == 962 then
                                    xi.limbus.extendTimeLimit(battlefield, 5, xi.zone.APOLLYON) -- Time chest.
                                end
                            end
                        end
                    end
                else
                    xi.limbus.handleLootRolls(battlefield, loot[bfid][5], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,

            -- NE Apollyon Crate Handling
            [1292] = function()
                -- Floors 1 to 4
                if crateID ~= ID.npc.APOLLYON_NE_CRATE[5] then
                    for i = 1, 4 do
                        for j = 1, 5 do
                            if crateID == ID.npc.APOLLYON_NE_CRATE[i][j] then
                                if model == 960 then
                                    xi.battlefield.HealPlayers(battlefield) -- HP/MP Chest.
                                elseif model == 961 then
                                    xi.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc) -- Item Chest.
                                elseif model == 962 then
                                    xi.limbus.extendTimeLimit(battlefield, 5, xi.zone.APOLLYON) -- Time chest.
                                end
                            end
                        end
                    end
                -- Floor 5 (Last)
                else
                    xi.limbus.handleLootRolls(battlefield, loot[bfid][5], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,

            -- CS Apollyon Crate Handling
            [1294] = function()
                if crateID ~= ID.npc.APOLLYON_CS_CRATE then
                    xi.limbus.extendTimeLimit(battlefield, 5, xi.zone.APOLLYON)
                else
                    xi.limbus.handleLootRolls(battlefield, loot[bfid][1], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,

            -- Central Apollyon Crate Handling
            [1296] = function()
                xi.limbus.handleLootRolls(battlefield, loot[bfid][1], nil, npc)
                battlefield:setLocalVar("cutsceneTimer", 10)
                battlefield:setLocalVar("lootSeen", 1)
            end,
        }

        if not hold then
            npc:entityAnimationPacket("open")
            npc:setLocalVar("open", 1)
            npc:timer(15000, function(npcArg)
                npcArg:entityAnimationPacket("kesu")
            end)
            npc:timer(16000, function(npcArg)
                npcArg:setStatus(xi.status.DISAPPEAR)
                npcArg:timer(500, function(mobArg)
                    mobArg:setLocalVar("open", 0)
                end)
            end)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
