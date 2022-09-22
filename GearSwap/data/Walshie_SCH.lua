-------------------------------------------------------------------------------------------------------------------
-- Handle imports
-------------------------------------------------------------------------------------------------------------------
include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific Variables
-------------------------------------------------------------------------------------------------------------------
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    state.HelixMode = M{['description']='Helix Mode', 'Potency', 'Duration'}
    state.RegenMode = M{['description']='Regen Mode', 'Duration', 'Potency'}

    update_active_strategems()

    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}

    lockstyleset = 2
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.WeaponLock = M(false, 'Weapon Lock')
    state.MagicBurst = M(false, 'Magic Burst')
    state.StormSurge = M(false, 'Stormsurge')
   
    select_default_macro_book()
    set_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = {} --Upgrade to {legs="Peda. Pants +3"}
    sets.precast.JA['Enlightenment'] =  {} --Upgrade to {body="Peda. Gown +3"}
    sets.precast.JA['Sublimation'] = {
    }

    -- Fast cast sets for spells
    sets.precast.FC = {
        -- Caps at 80%
        ammo="Incantor Stone",  -- 2
        ear1="Malignance Earring", -- 4
        ear2="Etiolation Earring", -- 1
        ring1="Kishar Ring", -- 4
        waist="Embla Sash", -- 5
        -- Current: 16
        
        --[[ BiS ToDo:
            Back	Lugh's Cape (FC) -- 10
            Body	Pinga Tunic +1 -- 15
            Ear2	Loquacious Earring -- 2
            Feet	Academic's Loafers +3  -- 12% (non-FC)
            Hands	Academic's Bracers +3 -- 9
            Head	Pedagogy Mortarboard +3 -- 13% (non-FC)
            Legs	Pinga Pants +1 -- 13
            Main	Musa -- 10
            Neck	Orunmila's Torque -- 5
        ]]--
    }

    sets.precast.FC.Grimoire = {} --Upgrade to {head="Peda. M.Board +3", feet="Acad. Loafers +3"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        --Upgrade to feet="Kaykaus Boots +1", --7
        --Upgrade to ear1="Mendi. Earring", --5
        --Upgrade to ring1="Lebeche Ring", --(2)
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak"})--Upgrade to waist="Shinjutsu-no-Obi +1"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak"}) --Upgrade to sub="Ammurapi Shield"
    sets.precast.Storm = set_combine(sets.precast.FC, {}) --Upgrade to {ring2={name="Stikini Ring +1", bag="wardrobe4"},})


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
        --Upgrade to ring1="Epaminondas's Ring",
        --Upgrade to ring2="Rufescent Ring",
        --Upgrade to back="Relucent Cape",
        waist="Fotia Belt",
    }

    sets.precast.WS['Omniscience'] = set_combine(sets.precast.WS, {
        --Upgrade to ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
        --Upgrade to body="Peda. Gown +3",
        --Upgrade to legs="Peda. Pants +3",
        --Upgrade to feet="Merlinic Crackows",
        ear1="Malignance Earring",
        --Upgrade to ear2="Regal Earring",
        --Upgrade to ring2="Archon Ring",
        --Upgrade to back=gear.SCH_MAB_Cape,
        --Upgrade to waist="Sacro Cord",
    })


    sets.precast.WS['Myrkr'] = {
        --Upgrade to ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
        --Upgrade to body="Amalric Doublet +1",
        --Upgrade to hands="Kaykaus Cuffs +1",
        --Upgrade to legs="Amalric Slops +1",
        --Upgrade to feet="Kaykaus Boots +1",
        --Upgrade to neck="Orunmila's Torque",
        --Upgrade to ear1="Loquacious Earring",
        --Upgrade to ear2="Etiolation Earring",
        --Upgrade to ring1={name="Fenrir Ring +1", bag="wardrobe3"},
        --Upgrade to ring2="Metamor. Ring +1",
        --Upgrade to back="Fi Follet Cape +1",
        --Upgrade to waist="Shinjutsu-no-Obi +1",
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {
        main="Daybreak",
        waist="Bishop's Sash",

        --[[ BiS ToDo:
            Ammo	Esper Stone +1
            Back	Fi Follet Cape +1
            Body	Kaykaus Bliaut +1
            Ear1	Mendicant's Earring
            Ear2	Magnetic Earring
            Feet	Kaykaus Boots +1
            Hands	Pedagogy Bracers +3
            Head	Kaykaus Mitra +1
            Legs	Kaykaus Tights +1
            Main	Daybreak
            Neck	Incanter's Torque
            Ring1	Lebeche Ring
            Ring2	Janniston Ring +1
            Sub	Sors Shield
            Waist	Hachirin-no-obi
        ]]--
    }

    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {
        main="Chatoyant Staff",
        sub="Enki Strap", --Upgrade to sub="Khonsu",        
        waist="Hachirin-no-Obi",
    })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        --Upgrade to neck="Nuna Gorget +1",
        --Upgrade to ring1={name="Stikini Ring +1", bag="wardrobe3"},
        --Upgrade to ring2="Metamor. Ring +1",
        --Upgrade to waist="Luminary Sash",
    })

    sets.midcast.StatusRemoval = {
        --Upgrade to main="Musa",
        --Upgrade to sub="Khonsu",
        --Upgrade to head="Vanya Hood",
        --Upgrade to body="Vanya Robe",
        --Upgrade to hands="Peda. Bracers +3",
        --Upgrade to legs="Acad. Pants +3",
        --Upgrade to feet="Vanya Clogs",
        --Upgrade to neck="Incanter's Torque",
        --Upgrade to ear2="Meili Earring",
        --Upgrade to ring1="Haoma's Ring",
        --Upgrade to ring2="Menelaus's Ring",
        waist="Bishop's Sash",
    }

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        --[[ BiS ToDo:
            Back	Oretania's Cape +1
            Body	Pedagogy Gown +3
            Ear1	Meili Earring
            Ear2	Beatific Earring
            Feet	Vanya Clogs
            Hands	Hieros Mittens
            Head	Vanya Hood
            Legs	Academic's Pants +3
            Main	Gada
            Neck	Debilis Medallion
            Ring1	Haoma's Ring
            Ring2	Menelaus's Ring
        ]]--
    })

    sets.midcast['Enhancing Magic'] = {
        waist="Olympus Sash",
        
        --[[ BiS: 
            Back	Fi Follet Cape +1
            Body	Pedagogy Gown +3
            Ear1	Mimir Earring
            Ear2	Andoaa Earring
            Feet	Telchine Pigaches (Enhancing)
            Hands	Arbatel Bracers +1
            Head	Telchine Cap (Enhancing)
            Legs	Telchine Braconi (Enhancing)
            Main	Musa
            Neck	Incanter's Torque
            Ring1	Stikini Ring +1
            Ring2	Stikini Ring +1
            Waist	Embla Sash
        ]]--        
    }

    sets.midcast.EnhancingDuration = {
        --Upgrade to main="Musa",
        --Upgrade to sub="Khonsu",
        --Upgrade to head=gear.Telchine_ENH_head,
        --Upgrade to body="Peda. Gown +3",
        --Upgrade to hands=gear.Telchine_ENH_hands,
        --Upgrade to legs=gear.Telchine_ENH_legs,
        --Upgrade to feet=gear.Telchine_ENH_feet,
        --Upgrade to waist="Embla Sash",
    }

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        --[[ BiS Todo:
            Ammo	Pemphredo Tathlum
            Back	Bookworm's Cape (Regen)
            Body	Telchine Chasuble (Regen)
            Ear1	Magnetic Earring
            Ear2	Calamitous Earring
            Feet	Telchine Pigaches (Regen)
            Hands	Telchine Gloves (Regen)
            Head	Arbatel Bonnet +1
            Legs	Telchine Braconi (Regen)
            Main	Musa (C)
            Neck	Reti Pendant
            Ring1	Mephitas's Ring +1
            Sub	Giuoco Grip
            Waist	Embla Sash
        ]]--
    })

    sets.midcast.RegenDuration = set_combine(sets.midcast.EnhancingDuration, {
        --Upgrade to head=gear.Telchine_ENH_head,
        --Upgrade to back=gear.SCH_FC_Cape,
    })

    sets.midcast.Haste = sets.midcast.EnhancingDuration

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        --Upgrade to head="Amalric Coif +1",
        --Upgrade to waist="Gishdubar Sash",
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
        ear2="Malignance Earring",
        --[[ BiS: 
            Ammo	Pemphredo Tathlum
            Back	Lugh's Cape
            Body	Cohort Cloak +1 (Macc/Matk/All)
            Ear1	Regal Earring
            Ear2	Malignance Earring
            Feet	Academic's Loafers +3
            Hands	Kaykaus Cuffs +1 (A)
            Legs	Academic's Pants +3
            Main	Daybreak
            Neck	Argute Stole +2
            Ring1	Stikini Ring +1
            Ring2	Stikini Ring +1
            Sub	Ammurapi Shield
            Waist	Luminary Sash
        ]]--
    }

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        ear2="Malignance Earring",
        --[[ BiS:
            Ammo	Pemphredo Tathlum
            Back	Lugh's Cape
            Body	Academic's Gown +3
            Ear1	Regal Earring
            Ear2	Malignance Earring
            Feet	Academic's Loafers +3
            Hands	Kaykaus Cuffs +1 (A)
            Head	Academic's Mortarboard +3
            Legs	Academic's Pants +3
            Main	Daybreak
            Neck	Argute Stole +2
            Ring1	Stikini Ring +1
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
        --Upgrade to ammo="Pemphredo Tathlum",
        --Upgrade to head="Acad. Mortar. +3",
        --Upgrade to body="Acad. Gown +3",
        --Upgrade to hands="Acad. Bracers +3",
        --Upgrade to legs="Peda. Pants +3",
        --Upgrade to feet="Acad. Loafers +3",
        --Upgrade to neck="Argute Stole +2",
        ear1="Malignance Earring",
        --Upgrade to ear2="Mani Earring",
        --Upgrade to ring1={name="Stikini Ring +1", bag="wardrobe3"},
        --Upgrade to ring2={name="Stikini Ring +1", bag="wardrobe4"},
        --Upgrade to back="Aurist's Cape +1",
        --Upgrade to waist="Acuity Belt +1",
    }

    sets.midcast.Kaustra = {
        --Upgrade to main="Akademos", --10
        --Upgrade to sub="Enki Strap",
        --Upgrade to ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
        body="Agwu's robe",
        --Upgrade to hands="Amalric Gages +1", --(5)
        --Upgrade to legs="Mallquis Trews +2", --6
        feet="Jhakri Pigaches +1", -- Upgrade to +2
        --Upgrade to neck="Argute Stole +2", --10
        ear1="Malignance Earring",
        --Upgrade to ear2="Regal Earring",
        --Upgrade to ring1="Freke Ring",
        --Upgrade to ring2="Archon Ring",
        --Upgrade to back="Aurist's Cape +1",
        --Upgrade to waist="Acuity Belt +1",

        --[[ BiS ToDo:
            Ammo	Pemphredo Tathlum
            Back	Lugh's Cape (INT/MAB/Macc/Mdmg)
            Ear1	Regal Earring
            Hands	Amalric Gages +1
            Legs	Amalric Slops +1
            Main	Bunzi's Rod
            Neck	Argute Stole +2
            Ring1	Freke Ring
            Ring2	Archon Ring
            Sub	Ammurapi Shield
            Waist	Hachirin-no-obi
        ]]--
    }

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1",
        waist="Fucho-no-obi",
        feet="Agwu's Pigaches",

        --[[ BiS: 
            Ammo	Staunch Tathlum +1
            Back	Bookworm's Cape
            Body	Merlinic Jubbah
            Ear1	Hirudinea Earring
            Ear2	Mani Earring
            Feet	Agwu's Pigaches
            Hands	Merlinic Dastanas
            Head	Pixie Hairpin +1
            Legs	Pedagogy Pants +3
            Main	Rubicundity
            Neck	Erra Pendant
            Ring1	Evanescence Ring
            Ring2	Archon Ring
            Sub	Ammurapi Shield
            Waist	Fucho-no-obi
        ]]--
    })

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        --Upgrade to back=gear.SCH_MAB_Cape,
    })

    -- Elemental Magic
    sets.midcast['Elemental Magic'] = {
        sub="Enki Strap",
        --Upgrade to ammo="Ghastly Tathlum +1",
        --Upgrade to head="Peda. M.Board +3",
        body="Agwu's Robe",
        --Upgrade to hands="Amalric Gages +1",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        --Upgrade to feet="Amalric Nails +1",
        --Upgrade to neck="Baetyl Pendant",
        ear1="Malignance Earring",
        --Upgrade to ear2="Regal Earring",
        --Upgrade to ring1="Freke Ring",
        --Upgrade to ring2="Metamor. Ring +1",
        --Upgrade to back=gear.SCH_MAB_Cape,
        waist="Eschan Stone",

        --[[ BiS ToDo:
            Ammo	Ghastly Tathlum +1
            Back	Lugh's Cape (INT/MAB/Macc/Mdmg)
            Ear1	Regal Earring
            Hands	Amalric Gages +1
            Head	Pedagogy Mortarboard +3
            Main	Mpaca's Staff
            Neck	Argute Stole +2
            Ring1	Freke Ring
            Ring2	Mujin Band
        ]]--
    }

    sets.midcast['Elemental Magic'].Seidr = set_combine(sets.midcast['Elemental Magic'], {
        --Upgrade to ammo="Pemphredo Tathlum",
        --Upgrade to head="Merlinic Hood",
        --Upgrade to body="Seidr Cotehardie",
        --Upgrade to legs="Peda. Pants +3",
        --Upgrade to feet="Merlinic Crackows",
        --Upgrade to neck="Erra Pendant",
        --Upgrade to waist="Acuity Belt +1",
    })

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
        --Upgrade to ammo="Pemphredo Tathlum",
        --Upgrade to head="Merlinic Hood",
        --Upgrade to legs="Merlinic Shalwar",
        --Upgrade to neck="Erra Pendant",
        --Upgrade to waist="Sacro Cord",
    })

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        --Upgrade to main="Akademos",
        --Upgrade to sub="Khonsu",
        head=empty,
        body="Twilight Cloak",
        --Upgrade to ring2="Archon Ring",
        --Upgrade to waist="Shinjutsu-no-Obi +1",
    })

    sets.midcast.Helix = {

        sub="Enki Strap",
        head="Agwu's Cap",
        body="Agwu's Robe",
        ear2="Malignance Earring",
        legs="Agwu's Slops",

        --[[ BiS ToDo:
            Ammo	Ghastly Tathlum +1
            Back	Lugh's Cape (INT/MAB/Macc/Mdmg)
            Ear1	Regal Earring
            Feet	Amalric Nails +1
            Hands	Amalric Gages +1
            Main	Bunzi's Rod
            Neck	Argute Stole +2
            Ring1	Freke Ring
            Ring1	Mujin Band
            Ring2	Mallquis Fing
            Sub	Culminus
            Waist	Acuity Belt +1
        ]]--
    }

    sets.midcast.DarkHelix = set_combine(sets.midcast.Helix, {
        head="Pixie Hairpin +1",
        --Upgrade to ring2="Archon Ring",
    })

    sets.midcast.LightHelix = set_combine(sets.midcast.Helix, {
        main="Daybreak",
        --Upgrade to sub="Ammurapi Shield",
        --Upgrade to ring2="Weather. Ring +1"
    })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        --main="Daybreak",
        --Upgrade to sub="Genmei Shield",
        main="Malignance Pole",
        sub="Enki Strap",
        ammo="Homiliary",
        --Upgrade to head="Volte Beret",
        --Upgrade to body="Acad. Gown +3",
        --Upgrade to hands="Raetic Bangles +1",
        --Upgrade to legs="Volte Brais",
        --Upgrade to feet="Volte Gaiters",
        --Upgrade to neck="Bathy Choker +1",
        --Upgrade to ear1="Sanare Earring",
        --Upgrade to ear2="Lugalbanda Earring",
        --Upgrade to ring1={name="Stikini Ring +1", bag="wardrobe3"},
        --Upgrade to ring2={name="Stikini Ring +1", bag="wardrobe4"},
        --Upgrade to back=gear.SCH_FC_Cape,
        --Upgrade to waist="Carrier's Sash",
        head="Agwu's Cap",
        body="Agwu's Robe",
        hands="Serpentes Cuffs",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches",
        neck="Sibyl Scarf", 
        waist="Embla Sash",
        back="Shadow Mantle",
        ring1="Roller's Ring",
        ring2="Defending Ring",
        ear1="Savant's Earring",
        ear2="Novia Earring",
    }

    sets.idle.DT = set_combine(sets.idle, {
        main="Malignance Pole",
        --Upgrade to sub="Genmei Shield", --10/0
        --Upgrade to ammo="Staunch Tathlum +1", --3/3
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Twilight Torque", --Upgrade to neck="Loricate Torque +1", --6/6
        --Upgrade to ear1="Sanare Earring",
        --Upgrade to ring1="Gelatinous Ring +1", --7/(-1)
        --Upgrade to ring2="Defending Ring", --10/10
        back="Shadow Mantle",
        --Upgrade to back="Moonlight Cape", --6/6
        --Upgrade to waist="Carrier's Sash",        
    })

    sets.idle.Vagary = sets.midcast['Elemental Magic']

    sets.idle.Town = set_combine(sets.idle, {
        feet="Herald's Gaiters",
    })

    sets.resting = set_combine(sets.idle, {
        main="Chatoyant Staff",
        --Upgrade to waist="Shinjutsu-no-Obi +1",
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT
    sets.moveSpeed = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}

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
        waist="Grunfeld Rope", --Upgrade to waist="Windbuffet Belt +1",
        --Upgrade to head="Volte Cap", feet="Volte Boots", waist="Chaac Belt" --TH
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.magic_burst = {
        -- Akademos 10
        --Upgrade to head="Peda. M.Board +3", --(4)
        --Upgrade to body=gear.Merl_MB_body, --10
        --Upgrade to hands="Amalric Gages +1", --(6)
        --Upgrade to feet="Merlinic Crackows", --11
        --Upgrade to neck="Argute Stole +2", --10
        --Upgrade to ring2="Mujin Band", --(5)
    }

    --sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {} --Upgrade to {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {} --Upgrade to {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {} --Upgrade to {hands="Arbatel Bracers +1", "Lugh's Cape"}
    sets.buff['Penury'] = {} --Upgrade to {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {} --Upgrade to {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {} --Upgrade to {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {} --Upgrade to {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {} --Upgrade to {feet="Arbatel Loafers +1"}

    sets.buff.FullSublimation = {
       --Upgrade to main="Siriti", --1
       --Upgrade to sub="Genmei Shield", --10/0
       --Upgrade to head="Acad. Mortar. +3", --4
       --Upgrade to body="Peda. Gown +3", --5
       ear1="Savant's Earring",
       --Upgrade to waist="Embla Sash", --5
    }

    sets.buff.Doom = {
        --Upgrade to neck="Nicander's Necklace", --20
        --Upgrade to ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        --Upgrade to ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        --Upgrade to waist="Gishdubar Sash", --10
    }

    sets.LightArts = {} --Upgrade to {legs="Acad. Pants +3", feet="Acad. Loafers +3"}
    sets.DarkArts = {} --Upgrade to {body="Acad. Gown +3", feet="Acad. Loafers +3"}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.Bookworm = {} --Upgrade to {back="Bookworm's Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)

end

function job_post_precast(spell, action, spellMap, eventArgs)
    if (spell.type == "WhiteMagic" and (buffactive["Light Arts"] or buffactive["Addendum: White"])) or
        (spell.type == "BlackMagic" and (buffactive["Dark Arts"] or buffactive["Addendum: Black"])) then
        equip(sets.precast.FC.Grimoire)
    elseif spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spellMap == "Helix" then
            equip(sets.midcast['Elemental Magic'])
            if spell.english:startswith('Lumino') then
                equip(sets.midcast.LightHelix)
            elseif spell.english:startswith('Nocto') then
                equip(sets.midcast.DarkHelix)
            else
                equip(sets.midcast.Helix)
            end
            if state.HelixMode.value == 'Duration' then
                equip(sets.Bookworm)
            end
        end
        if buffactive['Klimaform'] and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
    if spell.skill == 'Enfeebling Magic' then
        if spell.type == "WhiteMagic" and (buffactive["Light Arts"] or buffactive["Addendum: White"]) then
            equip(sets.LightArts)
        elseif spell.type == "BlackMagic" and (buffactive["Dark Arts"] or buffactive["Addendum: Black"]) then
            equip(sets.DarkArts)
        end
    end
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
        if spell.english == "Impact" then
            equip(sets.midcast.Impact)
        end
    end
    if spell.skill == 'Elemental Magic' or spell.english == "Kaustra" then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.Obi)
        end
    end
    if spell.skill == 'Enhancing Magic' then
        if classes.NoSkillSpells:contains(spell.english) then
            equip(sets.midcast.EnhancingDuration)
            if spellMap == 'Refresh' then
                equip(sets.midcast.Refresh)
            end
        end
        if spellMap == "Regen" and state.RegenMode.value == 'Duration' then
            equip(sets.midcast.RegenDuration)
        end
        if state.Buff.Perpetuance then
            equip(sets.buff['Perpetuance'])
        end
        if spellMap == "Storm" and state.StormSurge.value then
            equip (sets.midcast.Stormsurge)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == "Sleep II" then
            send_command('@timers c "Sleep II ['..spell.target.name..']" 90 down spells/00259.png')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('@timers c "Sleep ['..spell.target.name..']" 60 down spells/00253.png')
        elseif spell.english == "Break" then
            send_command('@timers c "Break ['..spell.target.name..']" 30 down spells/00255.png')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end

    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
             disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end

end

function init_modetables()
    --Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="Regular", idle=sets.baseIdle, engaged=sets.engaged}
	}

    	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Malignance Pole", set={main="Malignance Pole", sub="Enki Strap"}},
	}

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
		}		
	}
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_handle_equipping_gear(playerStatus, eventArgs)
    check_rings()
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
    update_active_strategems()
    update_sublimation()
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if (world.weather_element == 'Light' or world.day_element == 'Light') then
                return 'CureWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        idleSet = set_combine(idleSet, sets.buff.FullSublimation)
    end
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)

    local c_msg = state.CastingMode.value

    local h_msg = state.HelixMode.value

    local r_msg = state.RegenMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.MagicBurst.value then
        msg = ' Burst: On |'
    end

    add_to_chat(060, '| Magic: ' ..string.char(31,001)..c_msg.. string.char(31,002)..  ' |'
        ..string.char(31,060).. ' Helix: ' ..string.char(31,001)..h_msg.. string.char(31,002)..  ' |'
        ..string.char(31,060).. ' Regen: ' ..string.char(31,001)..r_msg.. string.char(31,002)..  ' |'
        ..string.char(31,004).. ' Defense: ' ..string.char(31,001)..d_msg.. string.char(31,002)..  ' |'
        ..string.char(31,008).. ' Idle: ' ..string.char(31,001)..i_msg.. string.char(31,002)..  ' |'
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'nuke' then
        handle_nuking(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false
    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- Generalizes Light/Dark Arts stratagem terms into the format "gs c scholar <stratagem>"
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    -- Options: cost, speed, aoe, potency, duration, accuracy, enmity, skillchain, addendum
    if buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'potency' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'potency' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end


-- Gets the current number of available strategems based on the recast remaining and SCH level
function get_current_strategem_count()
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]
    local maxStrategems = (player.main_job_level + 10) / 20
    local fullRechargeTime = 4*60
    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
    return currentCharges
end

function check_rings()
    rings = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}

    if rings:contains(player.equipment.left_ring) then
        disable("left_ring")
    else
        enable("left_ring")
    end

    if rings:contains(player.equipment.right_ring) then
        disable("right_ring")
    else
        enable("right_ring")
    end
end

windower.register_event('zone change',
    function()
        if no_swap_gear:contains(player.equipment.left_ring) then
            enable("ring1")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.right_ring) then
            enable("ring2")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.waist) then
            enable("waist")
            equip(sets.idle)
        end
    end
)

function select_default_macro_book()
    set_macro_page(1, 9)
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end

function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()   
    local master = windower.ffxi.get_player()
    local subRecast = abilRecast[234]

    -- AutoActions we only take when autoFite mode is on
    if auto.fite[auto.fite.index] == 'On' then
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
            if get_current_strategem_count() > 1 then
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
            if get_current_strategem_count() > 1 then
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
            if get_current_strategem_count() > 1 then
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
            if get_current_strategem_count() > 1 then
                send_command('/accession')
                send_command:schedule(1, '/perpetuance')
                send_command:schedule(2, '/adloquium')
                return
            else
                -- Prevent further commands until stratagems are up
                return
            end
        end
        --[[
        if not buffactive['Ice Spikes'] then
            if get_current_strategem_count() > 1 then
                send_command('/accession')
                send_command:schedule(1, '/perpetuance')
                send_command:schedule(2, '/icespikes')
                return
            else
                -- Prevent further commands until stratagems are up
                return
            end
        end
        ]]--
        --[[
        if not buffactive['Aurorastorm'] then
            send_command('/aurorastorm2')
            return
        end
        ]]--
        -- Sublimation not active -> start it
        if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and subRecast == 0 then
            send_command('input /ja "Sublimation" <me>')
        end

        -- Sublimation done charging and MP below 40% -> consume it
        if buffactive['sublimation: complete'] and player.mpp < 40 then
            add_to_chat(122,'-- MP below 40% - Popping Sublimation! --')
        	send_command('input /ja "Sublimation" <me>')
        end
    end
end
