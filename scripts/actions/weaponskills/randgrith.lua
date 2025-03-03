-----------------------------------
-- Randgrith
-- Club weapon skill
-- Skill level: N/A
-- Lowers target's evasion. Gullintani/Mjollnir: Temporarily improves params.accuracy.
-- Available only when equipped with the Relic Weapons Gullintani (Dynamis use only), Mjollnir, or a Charged Molva Maul.
-- Aftermath: Adds +20 params.accuracy after the weapon skill is used, duration is determined by TP. Only available with Gullintani and Mjollnir.
-- 100% = 20 seconds, 200% = 40 seconds, 300% = 60 seconds.
-- This Relic Weapon is only available to White Mages Scholars must use the Molva Maul to acquire this weapon skill.
-- Shield Break effect : Evasion -32
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:40%  MND:40%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 2.75, 2.75, 2.75 }
    params.str_wsc = 0.4 params.mnd_wsc = 0.4

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    if damage > 0 then
        if not target:hasStatusEffect(xi.effect.EVASION_DOWN) then
            local duration = 120 * applyResistanceAddEffect(player, target, xi.element.ICE, 0)
            target:addStatusEffect(xi.effect.EVASION_DOWN, 32, 0, duration)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
