-----------------------------------
-- Ability: Asylum
-- Description: Grants party members a powerful resistance to enfeebling magic and Dispel effects.
-- Obtained: WHM Level 96
-- Recast Time: 01:00:00
-- Duration: 0:00:30
-----------------------------------
require("scripts/globals/job_utils/white_mage")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.white_mage.checkAsylum(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    xi.job_utils.white_mage.useAsylum(player, target, ability)
end

return ability_object
