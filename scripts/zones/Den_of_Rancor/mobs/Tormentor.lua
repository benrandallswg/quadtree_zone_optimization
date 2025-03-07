-----------------------------------
-- Area: Den of Rancor
--  Mob: Tormentor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 802, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 803, 1, xi.regime.type.GROUNDS)
end

return entity
