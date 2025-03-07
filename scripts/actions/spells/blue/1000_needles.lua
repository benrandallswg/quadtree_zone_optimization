-----------------------------------
-- Spell: 1000 Needles
-- Shoots multiple needles at enemies within range
-- Spell cost: 350 MP
-- Monster Type: Plantoid
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: VIT+3, AGI+3
-- Level: 62
-- Casting Time: 12 seconds
-- Recast Time: 120 seconds
-- Bursts on Light affects accuracy only
-- Combos: Beast Killer
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.PLANTOID
    params.tpmod = xi.spells.blue.tpMod.DAMAGE
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
    params.skillType = xi.skill.BLUE_MAGIC
    params.scattr = xi.skillchainType.COMPRESSION
    params.diff = 0
    params.bonus = -50 -- 50 magic accuracy penalty
    params.numhits = 1
    params.multiplier = 1.5
    params.tp150 = 1.5
    params.tp300 = 1.5
    params.azuretp = 1.5
    params.duppercap = 49
    params.str_wsc = 1.0
    params.dex_wsc = 1.5
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 2.0
    params.mnd_wsc = 1.0
    params.chr_wsc = 1.0

    local damage = 1000
    local resist = applyResistanceEffect(caster, target, spell, params)
    if resist == 1 then
        local targets = spell:getTotalTargets()
        damage = damage / targets
        damage = xi.spells.blue.applySpellDamage(caster, target, spell, damage, params)
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return damage
end

return spellObject
