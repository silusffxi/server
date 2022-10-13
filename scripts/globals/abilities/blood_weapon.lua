-----------------------------------
-- Ability: Blood Weapon
-- Causes all attacks to drain enemy's HP.
-- Obtained: Dark Knight Level 1
-- Recast Time: 1:00:00
-- Duration: 0:00:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST))
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    target:addStatusEffect(xi.effect.BLOOD_WEAPON, 1, 0, 30)
end

return abilityObject
