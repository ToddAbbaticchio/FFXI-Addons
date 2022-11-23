include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    gear.offenseCape = {name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+6','"Mag.Atk.Bns."+10',}}
	gear.defenseCape = {name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Mag. Evasion+15',}}
    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = {} --Upgrade to {legs="Peda. Pants +3"}
    sets.precast.JA['Enlightenment'] =  {} --Upgrade to {body="Peda. Gown +3"}

    -- Fast cast sets for spells
    sets.precast.FC = {
        -- Caps at 80%
        main="Musa",
        ammo="Incantor Stone",
        head="Pedagogy Mortarboard +2", -- +3
        ear1="Malignance Earring",
        ear2="Etiolation Earring",
        hands="Academic's Bracers +2", -- +3
        ring1="Kishar Ring",
        waist="Embla Sash",
        back=gear.defenseCape,
        feet="Academic's Loafers +2", -- +3
        
        --[[ BiS ToDo:
            Body	Pinga Tunic +1 -- 15
            Ear2	Loquacious Earring -- 2
            Legs	Pinga Pants +1 -- 13
            Neck	Orunmila's Torque -- 5
        ]]--
    }

    sets.precast.FC.Grimoire = {head="Pedagogy Mortarboard +2", feet="Academic's Loafers +2"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        --Upgrade to feet="Kaykaus Boots +1", --7
        --Upgrade to ear1="Mendi. Earring", --5
        --Upgrade to ring1="Lebeche Ring", --(2)
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {}) --{head=empty, body="Twilight Cloak"})--Upgrade to waist="Shinjutsu-no-Obi +1"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak"}) --Upgrade to sub="Ammurapi Shield"
    sets.precast.Storm = set_combine(sets.precast.FC, {ring2="Stikini Ring +1"})

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield",
        ammo="Esper Stone +1",
        waist="Bishop's Sash",

        --[[ BiS ToDo:
            Back	Fi Follet Cape +1
            Body	Kaykaus Bliaut +1
            Ear1	Mendicant's Earring
            Ear2	Magnetic Earring
            Feet	Kaykaus Boots +1
            Hands	Pedagogy Bracers +3
            Head	Kaykaus Mitra +1
            Legs	Kaykaus Tights +1
            Neck	Incanter's Torque
            Ring1	Lebeche Ring
            Ring2	Janniston Ring +1
        ]]--
    }

    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff",
        sub="Enki Strap", --Upgrade to sub="Khonsu",        
        waist="Hachirin-no-Obi",
    })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        --Upgrade to neck="Nuna Gorget +1",
        ring1="Stikini Ring +1",
        ring2="Metamor. Ring +1",
        --Upgrade to waist="Luminary Sash",
    })

    sets.midcast.StatusRemoval = {
        main="Musa",
        --Upgrade to sub="Khonsu",
        --Upgrade to head="Vanya Hood",
        --Upgrade to body="Vanya Robe",
        --Upgrade to hands="Peda. Bracers +3",
        legs="Academic's Pants +2",
        --Upgrade to feet="Vanya Clogs",
        --Upgrade to neck="Incanter's Torque",
        ear2="Meili Earring",
        ring1="Haoma's Ring",
        ring2="Menelaus's Ring",
        waist="Bishop's Sash",
    }

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        --[[ BiS ToDo:
            Back	Oretania's Cape +1
            Body	Pedagogy Gown +3
            Ear1	Beatific Earring
            Hands	Hieros Mittens
            Main	Gada
            Neck	Debilis Medallion
        ]]--
    })

    sets.midcast['Enhancing Magic'] = {
        main="Musa",
        head="Telchine Cap",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",        
        waist="Embla Sash",        
        ear1="Mimir Earring",
        ring1="Stikini Ring +1",
        
        --[[ BiS: 
            Back	Fi Follet Cape +1
            Body	Pedagogy Gown +3
            Ear2	Andoaa Earring
            Neck	Incanter's Torque
            Ring2	Stikini Ring +1
        ]]--        
    }

    sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
        main="Musa",
        --Upgrade to sub="Khonsu",
        head="Telchine Cap",
        --Upgrade to body="Peda. Gown +3",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        waist="Embla Sash",
    })

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main="Musa",
        --sub="Giuoco Grip",
        ammo="Pemphredo Tathlum",
        body="Telchine Chasuble",
        waist="Embla Sash",
        head="Arbatel Bonnet +3",

        --[[ BiS Todo:
            Back	Bookworm's Cape (Regen)
            Ear1	Magnetic Earring
            Ear2	Calamitous Earring
            Neck	Reti Pendant
            Ring1	Mephitas's Ring +1
        ]]--
    })

    sets.midcast.RegenDuration = set_combine(sets.midcast.EnhancingDuration, {
        --Upgrade to back=gear.SCH_FC_Cape,
    })

    sets.midcast.Haste = sets.midcast.EnhancingDuration

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        --Upgrade to head="Amalric Coif +1",
        waist="Gishdubar Sash",
        --Upgrade to back="Grapevine Cape",
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        --Upgrade to neck="Nodens Gorget",
        waist="Siegel Sash",
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        --[[ BiS:
            Head	Amalric Coif +1
            Waist	Emphatikos Rope
            Hands	Regal Cuffs
            Legs	Shedir Seraweels
            Main	Vadose Rod
        ]]--
    })

    sets.midcast.Storm = sets.midcast.EnhancingDuration

    sets.midcast.Stormsurge = set_combine(sets.midcast.Storm, {})--Upgrade to {feet="Peda. Loafers +3"})

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {}) --Upgrade to {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
        main="Daybreak",
        sub="Culminus",
        ammo="Pemphredo Tathlum",
        legs="Academic's Pants +2",
        feet="Academic's Loafers +2",
        neck="Argute Stole +2",
        ear2="Malignance Earring",
        ring2="Stikini Ring +1",
        back=gear.offenseCape,
        --[[ BiS: 
            Body	Cohort Cloak +1 (Macc/Matk/All)
            Ear1	Regal Earring
            Hands	Kaykaus Cuffs +1 (A)
            Ring1	Stikini Ring +1
            Sub	Ammurapi Shield
            Waist	Luminary Sash
        ]]--
    }

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        main="Daybreak",
        ammo="Pemphredo Tathlum",
        head="Academic's Mortarboard +2",
        body="Academic's Gown +2",
        legs="Academic's Pants +2",
        feet="Academic's Loafers +2",
        ring1="Stikini Ring +1",
        ear2="Malignance Earring",
        neck="Argute Stole +2",
        back=gear.offenseCape,
        --[[ BiS:
            Ear1	Regal Earring
            Hands	Kaykaus Cuffs +1 (A)
            Ring2	Stikini Ring +1
            Sub	Ammurapi Shield
            Waist	Luminary Sash
        ]]--
    })

    sets.midcast.ElementalEnfeeble = sets.midcast.Enfeebles
    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {main="Daybreak", }) --Upgrade to sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    sets.midcast['Dark Magic'] = {
        --Upgrade to main="Rubicundity",
        --Upgrade to sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Academic's Mortarboard +2",
        body="Academic's Gown +2",
        hands="Academic's Bracers +2",
        --Upgrade to legs="Peda. Pants +3",
        feet="Academic's Loafers +2",
        neck="Argute Stole +2",
        ear1="Malignance Earring",
        --Upgrade to ear2="Mani Earring",
        --Upgrade to ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2="Stikini Ring +1",
        --Upgrade to back="Aurist's Cape +1",
        --Upgrade to waist="Acuity Belt +1",
    }

    sets.midcast.Kaustra = {
        main="Akademos",
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Agwu's robe",
        --Upgrade to hands="Amalric Gages +1", --(5)
        --Upgrade to legs="Mallquis Trews +2", --6
        feet="Jhakri Pigaches +1", -- Upgrade to +2
        neck="Argute Stole +2",
        ear1="Malignance Earring",
        --Upgrade to ear2="Regal Earring",
        ring1="Freke Ring",
        ring2="Archon Ring",
        back=gear.offenseCape,
        --Upgrade to waist="Acuity Belt +1",

        --[[ BiS ToDo:
            Ear1	Regal Earring
            Hands	Amalric Gages +1
            Legs	Amalric Slops +1
            Main	Bunzi's Rod
            Sub	Ammurapi Shield
        ]]--
    }

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        neck="Erra Pendant",
        waist="Fucho-no-obi",
        feet="Agwu's Pigaches",
        ring2="Archon Ring",

        --[[ BiS: 
            Ammo	Staunch Tathlum +1
            Back	Bookworm's Cape
            Body	Merlinic Jubbah
            Ear1	Hirudinea Earring
            Ear2	Mani Earring
            Hands	Merlinic Dastanas
            Legs	Pedagogy Pants +3
            Main	Rubicundity
            Ring1	Evanescence Ring
            Sub	Ammurapi Shield
        ]]--
    })

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        --Upgrade to back=gear.SCH_MAB_Cape,
    })

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        main="Akademos",
        --Upgrade to sub="Khonsu",
        head=empty,
        --body="Twilight Cloak",
        ring2="Archon Ring",
        --Upgrade to waist="Shinjutsu-no-Obi +1",
    })

    sets.midcast.Helix = {
        sub="Enki Strap",
        ammo="Ghastly Tathlum +1",
        neck="Argute Stole +2",
        head="Agwu's Cap",
        body="Agwu's Robe",
        ear2="Malignance Earring",
        legs="Agwu's Slops",
        ring1="Freke Ring",
        ring2="Mujin Band",
        back=gear.offenseCape,

        --[[ BiS ToDo:
            Ear1	Regal Earring
            Feet	Amalric Nails +1
            Hands	Amalric Gages +1
            Main	Bunzi's Rod
            Ring2	Mallquis Fing
            Sub	Culminus
            Waist	Acuity Belt +1
        ]]--
    }

    sets.midcast.DarkHelix = set_combine(sets.midcast.Helix, {
        head="Pixie Hairpin +1",
        ring2="Archon Ring",
    })

    sets.midcast.LightHelix = set_combine(sets.midcast.Helix, {
        main="Daybreak",
        --Upgrade to sub="Ammurapi Shield",
    })
    
    sets.FreeNuke = { 
        main="Akademos", -- Bunzi's Rod
        sub="Enki Strap", -- Ammurapi Shield
        ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",
        neck="Argute Stole +2",
        ear1="Arbatel Earring", -- Regal Earring,
        ear2="Malignance Earring",             
        body="Agwu's Robe", -- Amalric Doublet +1 
        hands="Agwu's Gages", -- Amalric Gages +1,
        ring1="Freke Ring",
        ring2="Metamor. Ring +1",
        back=gear.offenseCape,
        waist="Eschan Stone",
        legs="Agwu's Slops", -- Amalric Slops +1
        feet="Agwu's Pigaches", -- Amalric Nails +1
    }
    sets.MagicBurst = set_combine(sets.FreeNuke, {
        head="Peda. Mortarboard +1", -- Swaps to Arbatel in Ebullience        
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Arbatel Loafers +3",
        ring2="Mujin Band",
    })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.baseIdle = {
        main="Akademos",
        sub="Alber Strap",
        ammo="Homiliary",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck="Sibyl Scarf", 
        waist="Embla Sash",
        back=gear.defenseCape,
        ring1="Roller's Ring",
        ring2="Defending Ring",
        ear1="Savant's Earring",
        ear2="Novia Earring",
    }
    
    sets.maxSublimation = set_combine(sets.baseIdle, {
        --Upgrade to main="Siriti", --1
        --Upgrade to sub="Genmei Shield", --10/0
        head="Academic's Mortarboard +2", --4
        --Upgrade to body="Peda. Gown +3", --5
        ear1="Savant's Earring",
        waist="Embla Sash",
     })
 

    sets.resting = set_combine(sets.idle, {
        main="Chatoyant Staff",
        --Upgrade to waist="Shinjutsu-no-Obi +1",
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        head="Agwu's Cap", --Upgrade to head="Blistering Sallet +1",
        body="Agwu's Robe", --Upgrade to body="Jhakri Robe +2",
        hands="Agwu's Gages",--Upgrade to hands="Gazu Bracelet +1",
        legs="Agwu's Slops", --Upgrade to legs="Peda. Pants +3",
        feet="Agwu's Pigaches", --Upgrade to feet=gear.Telchine_STP_feet,
        neck="Clotharius Torque", --Upgrade to neck="Combatant's Torque",
        ear1="Brutal Earring",--Upgrade to ear1="Cessance Earring",
        ear2="Telos Earring",
        ring1="Apate Ring", --Upgrade to ring1="Hetairoi Ring",
        ring2="Petrov Ring", --Upgrade to ring2={name="Chirich Ring +1", bag="wardrobe4"},    
        --Upgrade to back="Relucent Cape",
        waist="Windbuffet Belt +1",
        --Upgrade to head="Volte Cap", feet="Volte Boots", waist="Chaac Belt" --TH
    }

    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.precast.WS = {
        --ammo="Floestone",
        head="Jhakri Coronal +1", --Upgrade to head="Jhakri Coronal +2",
        body="Jhakri Robe +1",--Upgrade to body="Jhakri Robe +2",
        hands="Jhakri Cuffs +1", --Upgrade to hands="Jhakri Cuffs +2",
        legs="Jhakri Slops +1",--Upgrade to legs=gear.Telchine_ENH_legs,
        feet="Jhakri Pigaches +1", --Upgrade to feet="Jhakri Pigaches +2",
        neck="Fotia Gorget",
        ear1="Moonshade Earring",
        ear2="Telos Earring",
        ring1="Epaminondas's Ring",
        --Upgrade to ring2="Rufescent Ring",
        --Upgrade to back="Relucent Cape",
        waist="Fotia Belt",
    }

    sets.precast.WS['Omniscience'] = set_combine(sets.precast.WS, {
        ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
        --Upgrade to body="Peda. Gown +3",
        --Upgrade to legs="Peda. Pants +3",
        --Upgrade to feet="Merlinic Crackows",
        ear1="Malignance Earring",
        --Upgrade to ear2="Regal Earring",
        ring2="Archon Ring",
        back=gear.offenseCape,
        --Upgrade to waist="Sacro Cord",
    })


    sets.precast.WS['Myrkr'] = {
        ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
        --Upgrade to body="Amalric Doublet +1",
        --Upgrade to hands="Kaykaus Cuffs +1",
        --Upgrade to legs="Amalric Slops +1",
        --Upgrade to feet="Kaykaus Boots +1",
        --Upgrade to neck="Orunmila's Torque",
        --Upgrade to ear1="Loquacious Earring",
        ear2="Etiolation Earring",
        --Upgrade to ring1={name="Fenrir Ring +1", bag="wardrobe3"},
        ring2="Metamor. Ring +1",
        --Upgrade to back="Fi Follet Cape +1",
        --Upgrade to waist="Shinjutsu-no-Obi +1",
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.buff['Ebullience'] = {head="Arbatel Bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {} --Upgrade to {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {} --Upgrade to {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {} --Upgrade to {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {} --Upgrade to {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}

    sets.buff.Doom = {
        --Upgrade to neck="Nicander's Necklace", --20
        --Upgrade to ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        --Upgrade to ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        --Upgrade to waist="Gishdubar Sash", --10
    }

    sets.moveSpeed = {feet="Herald's Gaiters"}
    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.TH = {head="Wh. Rarab Cap +1", waist='Chaac Belt', ammo='Per. Lucky Egg', feet="Merlinic Crackows"}
end

function init_modetables()
    --Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="Regular", idle=sets.baseIdle, engaged=sets.engaged},
	}

    --Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Regular", set={main="Akademos", sub="Alber Strap"}},
	}

	--Setup autoBuff
	auto = {
		["buff"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
		["fite"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
	}

	--[[ SCH Specific ]]--
    -- Nuke mode changes gear during elemental magic to prioritize +MB gear when in MB mode
	nukeMode = {
		["index"] = 0,
		[0] = {name="Magic Burst", msg="Nuke Mode: Magic Burst", color="\\cs(238,130,238)"}, -- violet
        [1] = {name="Free", msg="Nuke Mode: Free", color="\\cs(218,165,32)"}, -- goldenrod
	}

	-- Ele Mode includes all elements even though Light/Dark are not always relevant
	-- Add macro with /console gs c useXYZ
	-- Requires shortcuts addon
    -- Assumes T1 Helixes are never used
    -- Assumes T1 Weather is never used
    -- Assumes no -aga/-aja spells available
    -- Order follows days of week (FEWWILLD)
    eleMode = {
        ["index"] = 0,
        [0] = {ele="Fire", st="/fire", helix="/pyrohelix2", weather="/firestorm2", msg="Ele Mode: Fire (Burst: Liquefaction, Fusion, Light, Radiance)", color="\\cs(250,128,114)"}, -- salmon
        [1] = {ele="Earth", st="/stone", helix="/geohelix2", weather="/sandstorm2", msg="Ele Mode: Earth (Burst: Scission, Gravitation, Darkness, Umbra)", color="\\cs(218,165,32)"}, -- goldenrod    
        [2] = {ele="Water", st="/water", helix="/hydrohelix2", weather="/rainstorm2", msg="Ele Mode: Water (Burst: Reverberation, Distortion, Darkness, Umbra)", color="\\cs(0,191,255)"}, -- deepskyblue
        [3] = {ele="Wind", st="/aero", helix="/anemohelix2", weather="/windstorm2", msg="Ele Mode: Wind (Burst: Detonation, Fragmentation, Light, Radiance)", color="\\cs(50,205,50)"}, -- lime 
        [4] = {ele="Ice", st="/blizzard", helix="/cryohelix2", weather="/hailstorm2", msg="Ele Mode: Ice (Burst: Induration, Distortion, Darkness, Umbra)", color="\\cs(224,255,255)"}, -- lightcyan 
        [5] = {ele="Thunder", st="/thunder", helix="/ionohelix2", weather="/thunderstorm2", msg="Ele Mode: Thunder (Burst: Impaction, Fragmentation, Light, Radiance)", color="\\cs(238,130,238)"}, -- violet
        [6] = {ele="Light", st="", helix="/luminohelix2", weather="/aurorastorm2", msg="Ele Mode: Light (Burst: Light, Radiance)", color="\\cs(255,255,240)"}, -- ivory  
        [7] = {ele="Dark", st="", helix="/noctohelix2", weather="/voidstorm2", msg="Ele Mode: Dark (Burst: Darkness, Umbra)", color="\\cs(148,0,211)"}, -- darkviolet         
    }

    -- SC Mode allows for the four different Level 2 skillchains
    scMode = {
        ["index"] = 0,
        [0] = {sc="Gravitation", msg="SC Mode: Gravitation (Aero->Noctohelix, Earth & Darkness)", partyChat="Starting Gravitation (Earth/Dark) Skillchain!", part1="Gravi", part2="tation", color1="\\cs(218,165,32)", color2="\\cs(148,0,211)"},
        [1] = {sc="Distortion", msg="SC Mode: Distortion (Luminohelix->Stone, Water & Ice)", partyChat="Starting Distortion (Water/Ice) Skillchain!", part1="Disto", part2="rtion", color1="\\cs(0,191,255)", color2="\\cs(224,255,255)"},
        [2] = {sc="Fusion", msg="SC Mode: Fusion (Fire->Thunder, Fire & Light)", partyChat="Starting Fusion (Fire/Light) Skillchain!", part1="Fus", part2="ion", color1="\\cs(250,128,114)", color2="\\cs(255,255,240)"},
        [3] = {sc="Fragmentation", msg="SC Mode: Fragmentation (Blizzard->Water, Wind & Lightning)", partyChat="Starting Fragmentation (Wind/Lightning) Skillchain!", part1="Fragmen", part2="tation", color1="\\cs(50,205,50)", color2="\\cs(238,130,238)"},
        [4] = {sc="4-Step", msg="SC Mode: 4-Step SC (Water->Blizzard->Thunder->Wind)", partyChat="Starting 4-Step SC! (Water -> Blizzard -> Thunder -> Wind)", part1="4-step", part2="", color1="\\cs(255,255,240)", color2="\\cs(255,255,240)"},
        [5] = {sc="6-Step", msg="SC Mode: 6-Step SC (Water->Blizzard->Thunder->Wind->Fire->Thunder)", partyChat="Starting 6-Step SC! (Water>Blizzard>Thunder>Aero>Fire>Thunder)", part1="6-step", part2="", color1="\\cs(255,255,240)", color2="\\cs(255,255,240)"},
    }

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
end

function extendedUserSetup()
	-- Setup my binds
    send_command('bind @q gs c cycleEle')	
    send_command('bind @w gs c cycleNuke')	
    send_command('bind @e gs c cycleSC')	

	-- Set default macro book / page
    set_macro_page(1, 1)
	
	-- Load addons

	-- Set style lock
	windower.send_command:schedule(4, 'input /lockstyleset 14')	
end

function extendedUserUnload()
    send_command('unbind @q')
    send_command('unbind @w')
    send_command('unbind @e')
end

function extendedJobSelfCommand(cmdParams, eventArgs)	
    --[[ Cycle SCH-specific modes ]]--
    if cmdParams[1] == 'cycleEle' then
        eleMode.index = eleMode.index + 1
        if eleMode.index > #eleMode then
            eleMode.index = 0
        end
        windower.add_to_chat(122,'['..eleMode[eleMode.index].msg..']')
    elseif cmdParams[1] == 'cycleNuke' then
        nukeMode.index = nukeMode.index + 1
        if nukeMode.index > #nukeMode then
            nukeMode.index = 0
        end
        windower.add_to_chat(122,'['..nukeMode[nukeMode.index].msg..']')
    elseif cmdParams[1] == 'cycleSC' then
        scMode.index = scMode.index + 1
        if scMode.index > #scMode then
            scMode.index = 0
        end
        windower.add_to_chat(122,'['..scMode[scMode.index].msg..']')
    --[[ Use SCH-specific ele-based spells ]]--
    -- Add macro with /console gs c useXYZ
    elseif cmdParams[1] == 'useEleT1' then
        windower.send_command(eleMode[eleMode.index].st..'1')
    elseif cmdParams[1] == 'useEleT2' then
        windower.send_command(eleMode[eleMode.index].st..'2')
    elseif cmdParams[1] == 'useEleT3' then
        windower.send_command(eleMode[eleMode.index].st..'3')
    elseif cmdParams[1] == 'useEleT4' then
        windower.send_command(eleMode[eleMode.index].st..'4')
    elseif cmdParams[1] == 'useEleT5' then
        windower.send_command(eleMode[eleMode.index].st..'5')
    elseif cmdParams[1] == 'useHelix' then
        windower.send_command(eleMode[eleMode.index].helix)
    elseif cmdParams[1] == 'useWeather' then
        windower.send_command(eleMode[eleMode.index].weather)
    elseif cmdParams[1] == 'buffUp' then
        if strategemCount() >= 5 then
            send_command('/accession')
            send_command:schedule(1, '/perpetuance')
            send_command:schedule(2, '/adloquium') -- 5 sec cast time
            send_command:schedule(9, '/accession')
            send_command:schedule(10, '/protect5') -- 2 sec cast time
            send_command:schedule(14, '/accession')
            send_command:schedule(15, '/shell5')  -- 3 sec cast time
            send_command:schedule(19, '/accession')
            send_command:schedule(20, '/perpetuance')
            send_command:schedule(21, '/regen5') -- 2.5 sec cast time
        else
            windower.add_to_chat(122,'Not enough stratagems')
        end
    elseif cmdParams[1] == 'Tabula' then
        send_command('/tabularasa')
        send_command:schedule(1, '/accession')
        send_command:schedule(2, '/perpetuance')
        send_command:schedule(3, '/embrava') -- 3 sec cast time
        send_command:schedule(7, '/accession')
        send_command:schedule(8, '/perpetuance')
        send_command:schedule(9, '/regen5') -- 2.5 sec cast time
        send_command:schedule(19, '/reraise3')
        send_command:schedule(33, '/accession')
        send_command:schedule(34, '/perpetuance')
        send_command:schedule(35, '/regen5')    
    --[[ Handle SCH Skillchaining ]]--
    -- Add macro with /console gs c useSC
    elseif cmdParams[1]=='useSC' then
        if scMode[scMode.index].sc == "Gravitation" and strategemCount() >= 2 then
            send_command('input /p '..scMode[scMode.index].partyChat)
            send_command:schedule(0.5, '/immanence')
            send_command:schedule(1.5, '/aero')
            send_command:schedule(5.5, '/immanence')
            send_command:schedule(6.5, '/noctohelix')
        elseif scMode[scMode.index].sc == "Distortion" and strategemCount() >= 2 then
            send_command('input /p '..scMode[scMode.index].partyChat)
            send_command:schedule(0.5, '/immanence')
            send_command:schedule(1.5, '/luminohelix')
            send_command:schedule(8.5, '/immanence')
            send_command:schedule(9.5, '/stone')
        elseif scMode[scMode.index].sc == "Fusion" and strategemCount() >= 2 then
            send_command('input /p '..scMode[scMode.index].partyChat)
            send_command:schedule(0.5, '/immanence')
            send_command:schedule(1.5, '/fire')
            send_command:schedule(5.5, '/immanence')
            send_command:schedule(6.5, '/thunder')
        elseif scMode[scMode.index].sc == "Fragmentation" and strategemCount() >= 2 then
            send_command('input /p '..scMode[scMode.index].partyChat)
            send_command:schedule(0.5, '/immanence')
            send_command:schedule(1.5, '/blizzard')
            send_command:schedule(5.5, '/immanence')
            send_command:schedule(6.5, '/water')
        elseif scMode[scMode.index].sc == "4-Step" and strategemCount() >= 5 then
            send_command('input /p '..scMode[scMode.index].partyChat)
            send_command:schedule(0.5, '/immanence')
            send_command:schedule(1.0, '/water')
            send_command:schedule(5.5, '/immanence')
            send_command:schedule(6.0, '/blizzard')
            send_command:schedule(10.5, '/immanence')
            send_command:schedule(11.0, '/thunder')
            send_command:schedule(15.5, '/immanence')
            send_command:schedule(16.0, '/aero')
            send_command:schedule(20.5, '/immanence')
            send_command:schedule(21.0, '/stone')
        elseif scMode[scMode.index].sc == "6-Step" and buffactive['Tabula Rasa'] then
            send_command('input /p '..scMode[scMode.index].partyChat)
            send_command:schedule(0.5, '/immanence')
            send_command:schedule(1.0, '/water')
            send_command:schedule(5.5, '/immanence')
            send_command:schedule(6.0, '/blizzard')
            send_command:schedule(10.5, '/immanence')
            send_command:schedule(11.0, '/thunder')
            send_command:schedule(15.5, '/immanence')
            send_command:schedule(16.0, '/aero')
            send_command:schedule(20.5, '/immanence')
            send_command:schedule(21.0, '/stone')
            send_command:schedule(25.5, '/immanence')
            send_command:schedule(26.0, '/fire')
            send_command:schedule(30.5, '/immanence')
            send_command:schedule(31.0, '/thunder')
        else
            windower.add_to_chat(122,'Not enough stratagems (have: '..stratagemCount()..', need: 2)')
        end    
    --[[ Handle SCH Stratagems for neutral Light/Dark Macros ]]--
    -- Add macro with /console gs c stratXYZ
    elseif cmdParams[1]:startswith('strat') then
        if strategemCount() == 0 then
            windower.add_to_chat(122,'Not enough stratagems (have: 0, need: 1)')
        else
            if cmdParams[1] == 'stratMP' then
                if buffactive['Light Arts'] or buffactive['Addendum: White'] then
                    send_command('/penury')
                elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
                    send_command('/parsimony')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            elseif cmdParams[1] == 'stratCast' then
                if buffactive['Light Arts'] or buffactive['Addendum: White'] then
                    send_command('/celerity')
                elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
                    send_command('/alacrity')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            elseif cmdParams[1] == 'stratAoE' then
                if buffactive['Light Arts'] or buffactive['Addendum: White'] then
                    send_command('/accession')
                elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
                    send_command('/manifestation')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            elseif cmdParams[1] == 'stratPotency' then
                if buffactive['Light Arts'] or buffactive['Addendum: White'] then
                    send_command('/rapture')
                elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
                    send_command('/ebullience')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            elseif cmdParams[1] == 'stratMAcc' then
                if buffactive['Light Arts'] or buffactive['Addendum: White'] then
                    send_command('/altruism')
                elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
                    send_command('/focalization')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            elseif cmdParams[1] == 'stratEnmity' then
                if buffactive['Light Arts'] or buffactive['Addendum: White'] then
                    send_command('/tranquility')
                elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
                    send_command('/equanamity')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            elseif cmdParams[1] == 'stratSpecial' then
                if buffactive['Light Arts'] or buffactive['Addendum: White'] then
                    send_command('/perpetuance')
                elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
                    send_command('/immanence')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            elseif cmdParams[1] == 'stratAdd' then
                if buffactive['Light Arts'] then
                    send_command('/addendumwhite')
                elseif buffactive['Dark Arts'] then
                    send_command('/addendumblack')
                else
                    windower.add_to_chat(122,'Not in arts')
                end
            end
        end
    end

    modeHud('update')
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
	--[[ Show SCH-Specific modes on HUD ]]--
    hudText:append(white..'Ele Mode [Q]: '..eleMode[eleMode.index].color..eleMode[eleMode.index].ele..white)   
    hudText:append(white..'Nuke Mode [W]: '..nukeMode[nukeMode.index].color..nukeMode[nukeMode.index].name..white)  
    hudText:append(white..'SC Mode [E]: '..scMode[scMode.index].color1..scMode[scMode.index].part1..scMode[scMode.index].color2..scMode[scMode.index].part2..white)  
	return hudText
end

function extendedJobPrecast(spell, action, spellMap, eventArgs)

end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
    --[[ Hands all SCH-specific gear swapping ]]--
	-- Handle appropriate Helix and adjust Elemental Magic based on Nuke Mode
	if spell.skill == 'Elemental Magic' then
        if spell.english:startswith('Lumino') then
            equip(sets.midcast.LightHelix)
        elseif spell.english:startswith('Nocto') then
            equip(sets.midcast.DarkHelix)
        elseif spell.english:contains('helix') then
            equip(sets.midcast.Helix)
        elseif nukeMode[nukeMode.index].name == "Magic Burst" then
            equip(sets.MagicBurst)
        else
            equip(sets.FreeNuke)
        end
    -- Switch between White/MND and Dark/INT Enfeeble sets
    elseif spell.skill == 'Enfeebling Magic' then
        if spell.type == "WhiteMagic" then
            equip(sets.midcast.MndEnfeebles)
        elseif spell.type == "BlackMagic" then
            equip(sets.midcast.IntEnfeebles)
        end    
    -- Use Chatoyant Staff for cure if weather is appropriate
    elseif string.find(spell.english,'Cur') then 
		equip(sets.midcast_Cure)
		if spell.element == world.weather_element or spell_element == world.day_element then
			equip({main="Chatoyant Staff"},sets.Obi[spell.element])
		end
    end
end

function job_buff_change(buff, active)
    if state.Buff[buff] == nil and active then
        state.Buff[buff] = true
    else
        state.Buff[buff] = nil
    end

    if buff == 'sublimation: activated' and active then
        sets.gearmode.index = 37
        modeHud('update')
    end
    if buff == 'sublimation: activated' and not active then
        sets.gearmode.index = 39
        modeHud('update')
    end
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
    -- Equip any gear in the form of sets.buff (such as sets.buff['Ebullience'])
    for buff,active in pairs(state.Buff) do
		if active and sets.buff[buff] then
			equip(sets.buff[buff])
        end
    end

    if(dayWeatherIntensity(spell.element)) > 0 then
        equip({waist="Hachirin-no-Obi"})
    end
    --[[
    if buffactive['Perpetuance'] then
        equip({hands="Arbatel Bracers +3"})
    end
    ]]--
end

function extendedJobAftercast(spell, action, spellMap, eventArgs)

end

function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()   
    local master = windower.ffxi.get_player()
    local subRecast = abilRecast[234]

    -- Auto Buff (Sublimation)
    if auto.buff[auto.buff.index] == 'On' and not actionInProgress then
        if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and subRecast == 0 then
            send_command('input /ja "Sublimation" <me>')
            return
        end

        if buffactive['sublimation: complete'] and player.mpp < 40 and subRecast == 0 then
            add_to_chat(122,'-- MP below 40% - Popping Sublimation! --')
            send_command('input /ja "Sublimation" <me>')
            return
        end
    end

    -- Auto Fite (Light Arts, Regen, Protect, Shell, Adloquium)
    
    -- AutoActions we only take when autoFite mode is on
    if auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving then

        if player.mpp < 15 and abil_recasts[49] == 0 and player.sub_job == 'RDM' then
			send_command('input /ja Convert <me>')
			return
		end

        if not buffactive['Addendum: White'] then
            if buffactive['Light Arts'] then
                send_command('/addendumwhite')
                return
            else
                send_command('/lightarts')
                return
            end
        end
        
        if not buffactive['Regen'] then
            if strategemCount() > 1 then
                send_command('/accession')
                send_command:schedule(1, '/perpetuance')
                send_command:schedule(2, '/regen5')
                return
            else
                -- Prevent further commands until stratagems are up
                return
            end
        end

        if not buffactive['Protect'] then
            if strategemCount() > 1 then
                send_command('/accession')
                send_command:schedule(1, '/perpetuance')
                send_command:schedule(2, '/protect5')
                return
            else
                -- Prevent further commands until stratagems are up
                return
            end
        end

        if not buffactive['Shell'] then
            if strategemCount() > 1 then
                send_command('/accession')
                send_command:schedule(1, '/perpetuance')
                send_command:schedule(2, '/shell5')
                return
            else
                -- Prevent further commands until stratagems are up
                return
            end
        end

        if not buffactive['Regain'] then
            if strategemCount() > 1 then
                send_command('/accession')
                send_command:schedule(1, '/perpetuance')
                send_command:schedule(2, '/adloquium')
                return
            else
                -- Prevent further commands until stratagems are up
                return
            end
        end
    end
end
