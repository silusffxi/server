-----------------------------------
-- Ability: Perfect Counter
-- Description: Allows you to counter the next attack directed at you.
-- Obtained: MNK Level 79
-- Recast Time: 00:01:00
-- Duration: 0:00:30
-----------------------------------
require("scripts/globals/job_utils/monk")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.usePerfectCounter(player, target, ability)
end

return ability_object
