﻿#include "common/socket.h"

#include "objective_utility.h"

#include "entities/charentity.h"

CObjectiveUtilityPacket::CObjectiveUtilityPacket()
{
    this->setType(0x75);
    this->setSize(0xAC);

    // ref<uint8>(0x26) = ; // Unknown. Flags value with multiple usages.
}

void CObjectiveUtilityPacket::addCountdown(uint32 duration, uint32 warning /* = 0 */)
{
    ref<uint32>(0x04) = ref<uint32>(0x04) == 0 ? 0x01 : ref<uint32>(0x04);
    ref<uint32>(0x08) = CVanaTime::getInstance()->getVanaTime();
    ref<uint32>(0x0C) = duration;
    ref<uint32>(0x10) = warning; // If 0, defaults to 60.
    ref<uint8>(0x24) |= OBJECTIVEUTILITY_COUNTDOWN;
}

void CObjectiveUtilityPacket::addBars(std::vector<std::pair<std::string, uint32>>&& bars)
{
    ref<uint32>(0x04) = 0xFFFF;
    ref<uint8>(0x24) |= OBJECTIVEUTILITY_PROGRESS;

    uint8 pos = 0x28;
    for (auto bar = bars.begin(); pos < 0xA0 && bar != bars.end(); ++bar)
    {
        ref<uint32>(pos) = bar->second;

        for (size_t i = 0; i < bar->first.size(); ++i)
        {
            ref<char>(pos + 0x04 + i) = bar->first.at(i);
        }
        pos += 0x14;
    }
}

void CObjectiveUtilityPacket::addScoreboard(const std::pair<int32, int32>& score, const std::vector<uint32>& data)
{
    ref<uint32>(0x04) = 0x1000; // Causes the client to show the 'Marshland' and 'Stronghold' scoreboard information.
    ref<uint8>(0x24) |= OBJECTIVEUTILITY_PROGRESS;

    ref<int32>(0x28)  = score.first;  // Marchland Score
    ref<int32>(0x2C)  = score.second; // Stronghold Score
    ref<uint32>(0x30) = data[0];      // Marchland Progress
    ref<uint32>(0x34) = data[1];      // Max Marchland Progress
    ref<uint32>(0x38) = data[2];      // Stronghold Progress
    ref<uint32>(0x3C) = data[3];      // Max Stronghold Progress
    ref<uint32>(0x40) = data[4];      // Marchland Name Override - not used
    ref<uint32>(0x44) = data[5];      // Stronghold Name Override - When non-zero, replace Stronghold name with Balamor's Adumbration.
}

void CObjectiveUtilityPacket::addFence(float x, float y, float radius, float render, bool blue /* = false */)
{
    ref<int32>(0x14)  = static_cast<int32>(x * 1000);
    ref<int32>(0x18)  = static_cast<int32>(y * 1000);
    ref<uint32>(0x1C) = static_cast<uint32>(radius * 1000);
    ref<uint32>(0x20) = static_cast<uint32>(render * 1000);
    ref<uint8>(0x24) |= OBJECTIVEUTILITY_FENCE;
    ref<bool>(0x25) = blue; // Changes the color of the fence from red to blue.
}

void CObjectiveUtilityPacket::addHelpText(uint16 title, uint16 description)
{
    ref<uint8>(0x24) |= OBJECTIVEUTILITY_HELP;

    // These translate to a real table index of 0x1A, which is the mini-game string DAT file.
    //  JP: 55559 - ROM\333\15.DAT
    //  NA: 55679 - ROM\333\16.DAT
    ref<uint16>(0xA8) = title;                                   // String index. (String table 26.)
    ref<uint16>(0xAA) = description > 18 ? description - 19 : 0; // Same as 0xA8. Client adds 19 to this value.
}
