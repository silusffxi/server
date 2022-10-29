-----------------------------------
-- Symphonic Curator (Moghouse)
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/utils")
-----------------------------------
-- NOTE: You can force the Symphonic Curator to appear
--       by using !cs 30034 and exiting the menu
-----------------------------------

-- See documentation/songdata.txt for extracted table of data.

xi = xi or {}
xi.symphonic_curator = xi.symphonic_curator or {}

xi.symphonic_curator.onTrigger = function(player, npc)

    -- The first time you click, you'll always already be listening to Mog House
    if player:getLocalVar("Symphonic_Curator_Music") == 0 then
        player:setLocalVar("Symphonic_Curator_Music", 126)
    end

    -- All music type 6 (Moghouse)
    local song_packs = 0

    -- Default: Mog House (126), Vana'diel March (108)
    song_packs = utils.mask.setBit(song_packs, 0, 1)

    song_packs = utils.mask.setBit(song_packs, 1, player:hasKeyItem(xi.ki.SHEET_OF_SAN_DORIAN_TUNES))   -- The Kingdom of San d'Oria (107), Chateau d'Oraguille (156), Ronfaure (109)
    song_packs = utils.mask.setBit(song_packs, 2, player:hasKeyItem(xi.ki.SHEET_OF_BASTOKAN_TUNES))     -- The Republic of Bastok (152), Metalworks (154), Gustaberg (116)
    song_packs = utils.mask.setBit(song_packs, 3, player:hasKeyItem(xi.ki.SHEET_OF_WINDURSTIAN_TUNES))  -- The Federation of Windurst (151), Heavens Tower (162), Sarutabaruta (113)
    song_packs = utils.mask.setBit(song_packs, 4, player:hasKeyItem(xi.ki.SHEET_OF_E_ADOULINIAN_TUNES)) -- The Sacred City of Adoulin (63)
    song_packs = utils.mask.setBit(song_packs, 5, player:hasKeyItem(xi.ki.SHEET_OF_W_ADOULINIAN_TUNES)) -- The Pioneers (59)
    song_packs = utils.mask.setBit(song_packs, 6, player:hasKeyItem(xi.ki.SHEET_OF_ZILART_TUNES))       -- Kazham (135), The Sanctuary of Zi'Tah (190), Tu'Lia (210)
    -- Next page
    song_packs = utils.mask.setBit(song_packs, 7, player:hasKeyItem(xi.ki.SHEET_OF_CONFLICT_TUNES))     -- Awakening (119), Belief (195), A Realm of Emptiness (137)
    song_packs = utils.mask.setBit(song_packs, 8, player:hasKeyItem(xi.ki.SHEET_OF_PROMATHIA_TUNES))    -- Distant Worlds (900)
    song_packs = utils.mask.setBit(song_packs, 9, player:hasKeyItem(xi.ki.SHEET_OF_ADOULINIAN_TUNES))   -- Forever Today (76)
    song_packs = utils.mask.setBit(song_packs, 10, false)                                                -- Unknown Item: Rhapsodies of Vana'diel (83)
    song_packs = utils.mask.setBit(song_packs, 11, player:hasKeyItem(xi.ki.SHEET_OF_SHADOW_LORD_TUNES)) -- Awakening (The Shadow Lord Battle) (FFRK Ver.) (119)
    song_packs = utils.mask.setBit(song_packs, 12, player:hasKeyItem(xi.ki.SHEET_OF_MAPITOTO_TUNES))    -- Full Speed Ahead! (84)
    song_packs = utils.mask.setBit(song_packs, 13, player:hasKeyItem(xi.ki.SHEET_OF_ALTAIEU_TUNES))     -- The Celestial Capital - Al'Taieu (233)
    song_packs = utils.mask.setBit(song_packs, 14, player:hasKeyItem(xi.ki.SHEET_OF_JEUNO_TUNES))       -- The Grand Duchy of Jeuno (110), Ru'Lude Gardens (117)
    song_packs = utils.mask.setBit(song_packs, 15, player:hasKeyItem(xi.ki.SHEET_OF_HARVEST_TUNES))     -- Devils' Delight (29)

    -- 0000 = all instruments shown
    -- 1111 = all instruments hidden
    local instruments_available = 15

    local orchestrion    = player:findItem(426)
    local spinet         = player:findItem(3677)
    local nanaa_statue_1 = player:findItem(286)
    local nanaa_statue_2 = player:findItem(287)

    local has_orchestrion    = orchestrion and orchestrion:isInstalled()
    local has_spinet         = spinet and spinet:isInstalled()
    local has_nanaa_statue_1 = nanaa_statue_1 and nanaa_statue_1:isInstalled()
    local has_nanaa_statue_2 = nanaa_statue_2 and nanaa_statue_1:isInstalled()

    instruments_available = utils.mask.setBit(instruments_available, 0, not has_orchestrion)    -- Orchestrion
    instruments_available = utils.mask.setBit(instruments_available, 1, not has_spinet)         -- Spinet
    instruments_available = utils.mask.setBit(instruments_available, 2, not has_nanaa_statue_1) -- Nanaa Statue I
    instruments_available = utils.mask.setBit(instruments_available, 3, not has_nanaa_statue_2) -- Nanaa Statue II

    -- GMs get access to all music
    if player:getGMLevel() > 0 then
        song_packs = 65535
        instruments_available = 0
    end

    player:startEvent(30034, 0, 4095, song_packs, instruments_available)
end

-- The options that comes through the event doesn't line up with the song request packet,
-- so link them using this table
-- TODO: There is some relationship between the instrument and the index, based around multiples of 16
-- The relationship (for Orchestrion) is: index = ((option - 2) / 16) + 1
-- One of the arguments from caps with the orchetron is -2
local optionToSongLookup =
{
    [1]   = 112, -- Selbina
    [2]   = 126, -- Mog House
    [3]   = 126, -- Mog House
    [4]   = 126, -- Mog House
    [17]  = 196, -- Fighters of the Crystal
    [18]  = 108, -- Vana'diel March
    [19]  = 69,  -- Distant Worlds (Nanaa Mihgo Version)
    [20]  = 59,  -- The Pioneers
    [33]  = 230, -- A New Horizon
    [34]  = 107, -- The Kingdom of San d'Oria
    [49]  = 187, -- Ragnarok
    [50]  = 156, -- Chateau d'Oraguille
    [65]  = 215, -- Clash of Standards
    [66]  = 109, -- Ronfaure
    [81]  = 47,  -- Echoes of Creation
    [82]  = 152, -- The Republic of Bastok
    [97]  = 49,  -- Luck of the Mog
    [98]  = 154, -- Metalworks
    [113] = 50,  -- Feast of the Ladies
    [114] = 116, -- Gustaberg
    [129] = 51,  -- Abyssea
    [130] = 151, -- The Federation of Windurst
    [145] = 52,  -- Melodies Errant
    [146] = 162, -- Heavens Tower
    [161] = 109, -- Ronfaure
    [162] = 113, -- Sarutabaruta
    [177] = 251, -- Autumn Footfalls
    [178] = 63,  -- The Sacred City of Adoulin
    [193] = 48,  -- Main Theme
    [194] = 59,  -- The Pioneers
    [209] = 126, -- Mog House
    [210] = 135, -- Kazham
    [226] = 190, -- The Sanctuary of Zi'Tah
    [242] = 210, -- Tu'Lia
    -- Next Page
    [258] = 119, -- Awakening
    [274] = 195, -- Belief
    [290] = 137, -- A Realm of Emptiness
    [306] = 77,  -- Distant Worlds (Instrumental)
    [322] = 76,  -- Forever Today
    [338] = 83,  -- Unknown Item: Rhapsodies of Vana'diel
    [354] = 119, -- Awakening (The Shadow Lord Battle) (FFRK Ver.)
    [370] = 84,  -- Full Speed Ahead!
    [386] = 233, -- The Celestial Capital - Al'Taieu
    [402] = 110, -- The Grand Duchy of Jeuno
    [418] = 117, -- Ru'Lude Gardens
    [434] = 29,  -- Devils' Delight
}

xi.symphonic_curator.onEventUpdate = function(player, csid, option)
    player:ChangeMusic(6, optionToSongLookup[option])
end

xi.symphonic_curator.onEventFinish = function(player, csid, option)
    if option == 0 then
        -- Reset
        player:ChangeMusic(6, player:getLocalVar("Symphonic_Curator_Music"))
    else
        -- Confirmed, set
        player:setLocalVar("Symphonic_Curator_Music", optionToSongLookup[option])
        player:ChangeMusic(6, optionToSongLookup[option])
    end
end
