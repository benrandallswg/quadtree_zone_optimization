-----------------------------------
-- Area: Port San d'Oria
--  NPC: Habitox
-- Gobbie Mystery Box
-----------------------------------
---@type TNpcEntity
local entity = {}

local events =
{
    INTRO                   = 797,
    DEFAULT                 = 798,
    HOLDING_ITEM            = 799,
    TRADE                   = 800,
    BAD_TRADE               = 801,
    DAILY_COOLDOWN          = 802,
    HIT_MAX                 = 803,
    RESULT                  = 811,
    KEY_TRADE               = 812,
    NO_THANKS               = 813,
    FULL_INV                = 814,
    OTHER_BAD_TRADE         = 815
}

entity.onTrade = function(player, npc, trade)
    xi.gobbieMysteryBox.onTrade(player, npc, trade, events)
end

entity.onTrigger = function(player, npc)
    xi.gobbieMysteryBox.onTrigger(player, npc, events)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.gobbieMysteryBox.onEventUpdate(player, csid, option, events)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.gobbieMysteryBox.onEventFinish(player, csid, option, events)
end

return entity
