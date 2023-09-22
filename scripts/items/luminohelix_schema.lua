-----------------------------------
-- ID: 6047
-- Luminohelix Schema
-- Teaches the black magic Luminohelix
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return target:canLearnSpell(xi.magic.spell.LUMINOHELIX)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.LUMINOHELIX)
end

return itemObject
