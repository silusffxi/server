#!/bin/bash

# Requires the following packages:
# Package manager: luarocks
# luarocks install luacheck --local
# luarocks install lanes --local

target=${1:-scripts}

global_funcs=`python3 << EOF
import re
file = open('src/map/lua/luautils.cpp', 'r')
data = file.read()
file.close()
# Find all bound global functions
matches = re.findall(r'(?<=set_function\(\")(.*)(?=\",)', data)
# Make sure they're capitalized
matches = map(lambda s: s[:1].upper() + s[1:] if s else '', matches)
# Print space-delimited for piping back to bash
print(*matches)
EOF`

global_objects=(
    xi
    ai
    os
    _
    _G

    Module
    Override
    super

    common
    zones
    quests
    utils
    npcUtil

    mixins
    g_mixins
    applyMixins
    mixinOptions

    set
    printf
    switch
    getVanaMidnight
    getMidnight

    Mission
    Quest
    HiddenQuest
    InteractionGlobal
    InteractionLookup
    Action
    actionUtil
    interactionUtil
    KeyItemAction
    LambdaAction
    Message
    NoAction
    Sequence
    Container
    Event
    Battlefield
    BattlefieldMission
    BattlefieldQuest
    Limbus
    SeasonalEvent

    QUEST_AVAILABLE
    QUEST_ACCEPTED
    QUEST_COMPLETED

    onBattlefieldHandlerInitialise
    applyResistanceAddEffect

    addBonuses
    addBonusesAbility
    applyResistance
    applyResistanceAbility
    applyResistanceEffect
    adjustForTarget
    calculateDuration
    calculateMagicDamage
    canOverwrite
    doEnspell
    finalMagicAdjustments
    finalMagicNonSpellAdjustments
    getBaseCure
    getCurePower
    getCurePowerOld
    getCureFinal
    getBaseCureOld
    getElementalDamageReduction
    getElementalDebuffDOT
    getHelixDuration
    getMagicHitRate
    getMagicResist
    getStepAnimation
    getElementalDebuffStatDownFromDOT
    handleAfflatusMisery
    handleNinjutsuDebuff
    handleThrenody
    isValidHealTarget

    TPMOD_NONE
    TPMOD_CHANCE
    TPMOD_CRITICAL
    TPMOD_DAMAGE
    TPMOD_ACC
    TPMOD_ATTACK
    TPMOD_DURATION

    ForceCrash
    BuildString

    GetFirstID
)

ignores=(
)

ignore_rules=(
    311 # value assigned to variable <> is unused
    542 # empty if branch
)

~/.luarocks/bin/luacheck ${target} \
--quiet --jobs 4 --no-config --codes \
--no-unused-args \
--no-max-line-length \
--max-cyclomatic-complexity 30 \
--globals ${global_funcs[@]} ${global_objects[@]} \
--ignore ${ignores[@]} ${ignore_rules[@]} | grep -v "Total:"

python3 ./tools/ci/lua_stylecheck.py ${target}
