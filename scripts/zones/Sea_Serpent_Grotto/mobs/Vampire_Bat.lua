-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Vampire Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 806, 2, xi.regime.type.GROUNDS)
end

return entity
