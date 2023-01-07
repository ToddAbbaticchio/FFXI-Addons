vars = {}
vars.BLU = {
    autoBuffs = {},
    afReact = {
        --['Impulse Drive'] = {actor='any', response='/ws "Expiacion" <t>'},
        --['Darkness'] = {actor='any', response='preserveBurstWindow'}
        --['Expiacion'] = {actor='self', response='preserveBurstWindow'}
    },
    ws = "Expiacion",
    maintainAftermath = true,
    --ws = "Savage Blade",
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
    afReact = {},
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
        --['Dark Arts'] = "Dark Arts",
    },
    afReact = {
        ['Darkness'] = {actor='any', response='/ma "Blizzard V" <t>', response2='/ma "Blizzard V" <t>'},
        ['Distortion'] = {actor='any', response='/ma "Blizzard V" <t>', response2='/ma "Blizzard V" <t>'},
        ['Bubble Curtain'] = {actor='enemy', response='/ma "Dispel" <t>'},
        ['Scissor Guard'] = {actor='enemy', response='/ma "Dispel" <t>'},
    },
    ws = "Myrkr",
    targetTp = 9999,
    pullCommand = '/ma "Frazzle" '
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
    afReact = {},
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
    pullDistance = 225
}

vars.SMN = {
    autoBuffs = {},
    afReact = {
        ['Darkness'] = {actor='any', response='/pet "Heavenly Strike" <t>'},
        ['Distortion'] = {actor='any', response='/pet "Heavenly Strike" <t>'},
        --['Bubble Curtain'] = {actor='enemy', response='/ma "Dispel" <t>'},
        --['Scissor Guard'] = {actor='enemy', response='/ma "Dispel" <t>'},
    },
    ws = "Myrkr",
    targetTp = 2000,
    pullCommand = '/ma "Stone" '
}

vars.RDM = {
    autoBuffs = {},
    afReact = {},
    ws = "Savage Blade",
    targetTp = 1000,
    pullCommand = '/ma "Dia III" '
}

vars.BRD = {
    autoBuffs = {},
    afReact = {},
    maintainAftermath = true,
    ws = "Mordant Rime",
    targetTp = 1500,
    pullCommand = '/ma "Carnage Elegy" ',
    meleeDistance = 999
}


vars.DEMO = {
    autoBuffs = {
        ["Swordplay"] = "Swordplay",
        ["Last Resort"] = "Last Resort",
        ["Battuta"] = "Battuta",
    },
    maintainAftermath = true,
    ws = "Dimidiation",
    targetTp = 1000,
    pullCommand = '/ma "Flash" '
}