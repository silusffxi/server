-----------------------------------
-- xi.effect.AGI_BOOST
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    -- the effect loses agility of 1 every 3 ticks depending on the source of the agi boost
    local boostAGI_effect_size = effect:getPower()
    if (boostAGI_effect_size > 0) then
        effect:setPower(boostAGI_effect_size - 1)
        target:delMod(xi.mod.AGI, 1)
    end
end

effectObject.onEffectLose = function(target, effect)
    local boostAGI_effect_size = effect:getPower()
    if (boostAGI_effect_size > 0) then
        target:delMod(xi.mod.AGI, boostAGI_effect_size)
    end
end

return effectObject
