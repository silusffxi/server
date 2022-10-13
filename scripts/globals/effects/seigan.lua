-----------------------------------
-- xi.effect.SEIGAN
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/status")
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.SEIGAN_EFFECT)

    target:addMod(xi.mod.COUNTER, (target:getMod(xi.mod.ZANSHIN)/4))
    target:addMod(xi.mod.DEF, jpValue * 3)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.SEIGAN_EFFECT)

    target:delMod(xi.mod.COUNTER, (target:getMod(xi.mod.ZANSHIN)/4))
    target:delMod(xi.mod.DEF, jpValue * 3)
end

return effectObject
