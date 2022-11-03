vars = {}
vars.BLU = {
    autoBuffs = {
        ["Warcry"] = "Warcry",
        ["Berserk"] = "Berserk",
    },
    ws = "Savage Blade",
    --targetTp = 1750,
    targetTp = 1000,
    pullCommand = '/ma "Glutinous Dart" '
}

vars.RUN = {
    autoBuffs = {
        -- ["Aquaveil"] = "Aquaveil",
        -- ["Crusade"] = "Enmity Boost",
        -- ["Phalanx"] = "Phalanx",
        -- ["Temper"] = "Multi Strikes",
        ["Swordplay"] = "Swordplay",
        ["Last Resort"] = "Last Resort",
        --["Barwater"] = "Barwater",
        ["Battuta"] = "Battuta",
        --["Valiance"] = "Valiance,One for All",
        --["One for All"] = "Valiance,One for All"
    },
    maintainAftermath = false,
    ws = "Resolution",
    targetTp = 1000,
    --[[ maintainAftermath = true,
    ws = "Dimidiation",
    targetTp = 1500, ]]
    pullCommand = '/ma "Flash" '
}

vars.SCH = {
    autoBuffs = {
        -- ["Dark Arts"] = "Addendum: Black"
        ["Light Arts"] = "Addendum: White"
    },
    -- ws = "Myrkr",
    ws = "Starlight",
    targetTp = 3000,
    pullCommand = '/ma "Dia II" '
}

vars.PUP = {
    autoBuffs = {
        ["Light Maneuver"] = "Light Maneuver",
        ["Dark Maneuver"] = "Dark Maneuver",
        ["Ice Maneuver"] = "Ice Maneuver",
        -- ["Berserk"] = "Berserk",
        -- ["Warcry"] = "Warcry,Blood Rage",
        -- ["Aggressor"] = "Aggressor",
        ["Swordplay"] = "Swordplay",
        ["Valiance"] = "Valiance",
        ["Vallation"] = "Valiance,Vallation"
    },
    -- ws = "Stringing Pummel",
    ws = "Howling Fist",
    -- ws = "Shijin Spiral",
    targetTp = 1750,
    pullCommand = '/ma "Flash" '
    -- pullDistance = 369,
}

vars.COR = {
    autoBuffs = {
        ["Haste Samba"] = "Haste Samba"
    },
    ws = "Savage Blade",
    targetTp = 1000,
    pullCommand = '/ra '
}

vars.WAR = {
    autoBuffs = {
        ["Berserk"] = "Berserk",
        ["Warcry"] = "Warcry,Blood Rage",
        ["Blood Rage"] = "Warcry,Blood Rage",
        ["Aggressor"] = "Aggressor"
    },
    ws = "Upheaval",
    targetTp = 1500,
    pullCommand = '/ja "Provoke" ',
    pullDistance = 369,
    target = {
        ["pull"] = "Part of monster name"
    }
}

vars.SMN = {
    autoBuffs = {},
    ws = "Myrkr",
    targetTp = 3000,
    meleeDistance = 12,
    pullCommand = '/ma "Stone" '
}

vars.RDM = {
    autoBuffs = {},
    ws = "Savage Blade",
    targetTp = 1000,
    pullCommand = '/ma "Dia III" '
}

vars.BRD = {
    autoBuffs = {},
    maintainAftermath = true,
    ws = "Mordant Rime",
    targetTp = 1500,
    pullCommand = '/ma "Carnage Elegy" ',
    meleeDistance = 999
}