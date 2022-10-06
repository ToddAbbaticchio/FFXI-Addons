include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
	gear.meleeTPCape = {name="Intarabus's Cape", augments={'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10',}}
	gear.magicAccCape = {name="Intarabus's Cape", augments={'CHR+20',}}
    gear.savageCape = {name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    gear.ghorn = {name="Gjallarhorn"}
    gear.harp = {name="Blurred Harp +1"}
    gear.linos = {name="Linos"}

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Fast cast sets for spells
    sets.precast.FC = {
        --sub="Kali", --7
        --head="Volte Beret", --6
        body="Inyanga Jubbah +2", --14
        --hands="Gende. Gages +1", --7
        --legs="Volte Brais", --8
        --feet="Volte Gaiters", --6
        --neck="Orunmila's Torque", --5
        --ear1="Loquac. Earring", --2
        ear2="Etiolation Earring", --1
        --ring1="Weather. Ring +1", --5
        --ring2="Kishar Ring", --4
        --back=gear.BRD_Song_Cape, --10
        --waist="Embla Sash", --5
    }

	--sets.precast.FC['Enhancing Magic'] = sets.precast.FC
    --sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        --feet="Kaykaus Boots +1", --0/7
        --ear2="Mendi. Earring", --0/5

        head="Vanya Hood",
        hands="Vanya Cuffs",
        legs="Vanya Slops",
        feet="Vanya Clogs",
        ring1="Stikini Ring",
        ring2="Stikini Ring",
    })

    sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
        --head="Fili Calot +1", --14
        --body="Brioso Justau. +3", --15
        feet="Brioso Slippers +3", 
        --neck="Loricate Torque +1",
        --ear1="Odnowa Earring +1",
        --ring2="Defending Ring",
        neck="Mnbw. Whistle +1",
        --range="Blurred Harp +1",
    })

    sets.precast.FC.SongPlaceholder = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})

    --sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    -- Precast sets to enhance JAs

    sets.precast.JA.Nightingale = {feet="Brioso Slippers +3"} --{feet="Bihu Slippers +3"}
    sets.precast.JA.Troubadour = {} --{body="Bihu Jstcorps. +3"}
    sets.precast.JA['Soul Voice'] = {} --{legs="Bihu Cannions +3"}

    sets.precast.Waltz = {}

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- General set for recast times.
    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.SpellInterrupt = {
        --ammo="Staunch Tathlum +1", --11
        --body="Ros. Jaseran +1", --25
        --hands=gear.Chironic_WSD_hands, --20
        --legs="Querkening Brais" --15
        --neck="Loricate Torque +1", --5
        --ear1="Halasz Earring", --5
        --ear2="Magnetic Earring", --8
        --ring2="Evanescence Ring", --5
        --waist="Rumination Sash", --10
    }

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt

    -- Gear to enhance certain classes of songs.
    sets.midcast.Ballad = {} --{legs="Fili Rhingrave +1"}
    sets.midcast.Carol = {} --{hands="Mousai Gages +1"}
    sets.midcast.Etude = {} --{head="Mousai Turban +1"}
    sets.midcast.HonorMarch = {} --{range="Marsyas", hands="Fili Manchettes +1"}
    sets.midcast.Lullaby = {
        head="Inyanga Tiara +2", --0/5
        body="Inyanga Jubbah +2", --0/8
        hands="Inyanga Dastanas +2",
        legs="Inyanga Shalwar +2", --0/6
        feet="Inyan. Crackows +2", --0/3

        neck="Moonbow Whistle +1",
        ring1="Stikini Ring",
        ring2="Stikini Ring",
        ear1="Enchanter's Earring",
        
        waist="Harfner's Sash",
        back=gear.magicAccCape,
    } --{body="Fili Hongreline +1", hands="Brioso Cuffs +3"}
    sets.midcast.Madrigal = {} --{head="Fili Calot +1"}
    sets.midcast.Mambo = {} --{feet="Mou. Crackows +1"}
    sets.midcast.March = {} --{hands="Fili Manchettes +1"}
    sets.midcast.Minne = {} --{legs="Mou. Seraweels +1"}
    sets.midcast.Minuet = {body="Fili Hongreline"} -- +1
    sets.midcast.Paeon = {} --{head="Brioso Roundlet +3"}
    sets.midcast.Threnody = {} --{body="Mou. Manteel +1"}
    sets.midcast['Adventurer\'s Dirge'] = {} --{range="Marsyas", hands="Bihu Cuffs +3"}
    sets.midcast['Foe Sirvente'] = {} --{head="Bihu Roundlet +3"}
    sets.midcast['Magic Finale'] = {} --{legs="Fili Rhingrave +1"}
    sets.midcast["Sentinel's Scherzo"] = {} --{feet="Fili Cothurnes +1"}
    sets.midcast["Chocobo Mazurka"] = {} --{range="Marsyas"}

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEnhancing = {
        --main="Carnwenhan",
        --range="Gjallarhorn",
        --head="Fili Calot +1",
        --body="Fili Hongreline +1",
        --hands="Fili Manchettes +1",
        legs="Inyanga Shalwar +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        --ear1="Odnowa Earring +1",
        --ear2="Etiolation Earring",
        --ring1="Moonlight Ring",
        --ring2="Defending Ring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        --waist="Flume Belt +1",
        --back=gear.BRD_Song_Cape,
        }

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongEnfeeble = {
        --main="Carnwenhan",
        --sub="Ammurapi Shield",
        --range="Gjallarhorn",
        --head="Brioso Roundlet +3",
        --body="Brioso Justau. +3",
        --hands="Brioso Cuffs +3",
        --legs="Brioso Cannions +3",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        --ear1="Digni. Earring",
        --ear2="Regal Earring",
        --ring1={name="Stikini Ring +1", bag="wardrobe3"},
        --ring2="Metamor. Ring +1",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        --waist="Acuity Belt +1",
        back=gear.magicAccCape,
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
	}

    -- For Horde Lullaby maxiumum AOE range.
    sets.midcast.SongStringSkill = {
        --ear1="Gersemi Earring",
        --ear2="Darkside Earring",
        --ring2={name="Stikini Ring +1", bag="wardrobe4"},
        neck="Mnbw. Whistle +1",
    }

    -- Placeholder song; minimize duration to make it easy to overwrite.
    sets.midcast.SongPlaceholder = set_combine(sets.midcast.SongEnhancing, {range=info.ExtraSongInstrument})

    -- Other general spells and classes.
    sets.midcast.Cure = {
        --main="Daybreak", --30
        --sub="Ammurapi Shield",
        head="Vanya Hood", --head="Kaykaus Mitra +1", --11
        --body="Kaykaus Bliaut +1", --(+4)/(-6)
        hands="Vanya Cuffs", --hands="Kaykaus Cuffs +1", --11(+2)/(-6)
        legs="Vanya Slops", --legs="Kaykaus Tights +1", --11/(+2)/(-6)
        feet="Vanya Clogs",--feet="Kaykaus Boots +1", --11(+2)/(-12)
        --neck="Incanter's Torque",
        --ear1="Beatific Earring",
        --ear2="Meili Earring",
        ring1="Stikini Ring", --ring1="Menelaus's Ring",
        ring2="Stikini Ring", --ring2="Haoma's Ring",
        --back="Solemnity Cape", --7
        --waist="Bishop's Sash",
    }

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        --neck="Nuna Gorget +1",
        --ring1={name="Stikini Ring +1", bag="wardrobe3"},
        --ring2="Metamor. Ring +1",
        --waist="Luminary Sash",
    })

    sets.midcast.StatusRemoval = {
        --head="Vanya Hood",
        --body="Vanya Robe",
        --legs="Aya. Cosciales +2",
        --feet="Vanya Clogs",
        --neck="Incanter's Torque",
        --ear2="Meili Earring",
        --ring1="Menelaus's Ring",
        --ring2="Haoma's Ring",
        --back=gear.BRD_Song_Cape,
        --waist="Bishop's Sash",
    }

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        --hands="Hieros Mittens",
        --neck="Debilis Medallion",
        --ear1="Beatific Earring",
        --back="Oretan. Cape +1",
    })

    sets.midcast['Enhancing Magic'] = {
        --main="Carnwenhan",
        --sub="Ammurapi Shield",
        --head=gear.Telchine_ENH_head,
        --body=gear.Telchine_ENH_body,
        --hands=gear.Telchine_ENH_hands,
        --legs=gear.Telchine_ENH_legs,
        --feet=gear.Telchine_ENH_feet,
        --neck="Incanter's Torque",
        --ear1="Mimir Earring",
        --ear2="Andoaa Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        --ring1={name="Stikini Ring +1", bag="wardrobe3"},
        --ring2={name="Stikini Ring +1", bag="wardrobe4"},
        --back="Fi Follet Cape +1",
        --waist="Embla Sash",
    }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga Tiara +2"})
    sets.midcast.Haste = sets.midcast['Enhancing Magic']
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {}) --{waist="Gishdubar Sash", back="Grapevine Cape"})
    --sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget", waist="Siegel Sash"})
    --sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {waist="Emphatikos Rope"})
    --sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    --sets.midcast.Protectra = sets.midcast.Protect
    --sets.midcast.Shell = sets.midcast.Protect
    --sets.midcast.Shellra = sets.midcast.Shell

    sets.midcast['Enfeebling Magic'] = {
        --main="Carnwenhan",
        --sub="Ammurapi Shield",
        --head=empty;
        --body="Cohort Cloak +1",
        --hands="Brioso Cuffs +3",
        --legs="Brioso Cannions +3",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        --ear1="Digni. Earring",
        --ear2="Vor Earring",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        --ring1="Kishar Ring",
        --ring2="Metamor. Ring +1",
        --waist="Acuity Belt +1",
        back=gear.magicAccCape,
    }

    --sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})
	
	------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        --range=gear.Linos_WS,
        head="Nyame Helm", --head=gear.Chironic_WSD_head,
        body="Nyame Mail", --body="Bihu Jstcorps. +3",
        hands="Chironic Gloves",
        legs="Nyame Flanchard", --legs="Bihu Cannions +3",
        feet="Nyame Sollerets", --feet="Bihu Slippers +3",
        neck="Bard's Charm", --neck="Fotia Gorget",
        ear1="Steelflash Earring", --ear1="Ishvara Earring",
        ear2="Tripudio Earring", --ear2="Moonshade Earring",
        ring1="Ifrit Ring +1",
        ring1="Apate Ring", --ring2="Ilabrat Ring",
        back=gear.meleeTPCape, --back=gear.BRD_WS1_Cape,
        waist="Sailfi Belt +1",
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    })

		------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        --range="Gjallarhorn",
        --head="Volte Beret",
        --body="Mou. Manteel +1",
        --hands="Raetic Bangles +1",
        --legs="Volte Brais",
        --legs="Volte Gaiters",
        --neck="Bathy Choker +1",
		neck="Moonbow Whistle +1",
        ear1="Enchanter's Earring",
        --ear1="Eabani Earring",
        --ear2="Sanare Earring",
		ring1="Vertigo Ring",
		ring2="Fortified Ring",
        --ring1={name="Stikini Ring +1", bag="wardrobe3"},
        --ring2={name="Stikini Ring +1", bag="wardrobe4"},
        --back="Moonlight Cape",
        --waist="Flume Belt +1",
        head="Inyanga Tiara +2", --0/5
        body="Inyanga Jubbah +2", --0/8
        hands="Inyanga Dastanas +2",
        legs="Inyanga Shalwar +2", --0/6
        feet="Inyan. Crackows +2", --0/3
        ring2="Inyanga Ring",
    }

    sets.idle.DT = {
        --head="Bihu Roundlet +3", --6/0
        --body="Bihu Jstcorps. +3", --7/0
        --hands="Raetic Bangles +1",
        --legs="Brioso Cannions +3", --8/8
        feet="Inyan. Crackows +2", --0/3
        --neck="Loricate Torque +1", --6/6
        --ear1="Odnowa Earring +1", --3/5
        --ear2="Etiolation Earring", --0/3
        --ring1="Moonlight Ring", --5/5
        --ring2="Defending Ring",  --10/10
        --back="Moonlight Cape", --6/6
        --waist="Carrier's Sash",
        }

    sets.idle.MEva = {
        head="Inyanga Tiara +2", --0/5
        body="Inyanga Jubbah +2", --0/8
        --hands="Raetic Bangles +1",
        legs="Inyanga Shalwar +2", --0/6
        feet="Inyan. Crackows +2", --0/3
        --neck="Warder's Charm +1",
        --ear1="Eabani Earring",
        --ear2="Sanare Earring",
        --ring1="Purity Ring",
        ring2="Inyanga Ring",
        --back="Moonlight Cape", --6/6
        --waist="Carrier's Sash",
        }

    sets.idle.Town = set_combine(sets.Idle, {
        --range="Gjallarhorn",
        --head="Mousai Turban +1",
        --body="Ashera Harness",
        --legs="Mou. Seraweels +1",
        --feet="Mou. Crackows +1",
        --neck="Bard's Charm +2",
        --ear1="Enchntr. Earring +1",
        --ear2="Regal Earring",
        --back=gear.BRD_Song_Cape,
        --waist="Acuity Belt +1",
        })

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        --range="Linos", --range=gear.Linos_TP,
        head="Ayanmo Zucchetto +2", --head="Volte Tiara",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2", --hands="Raetic Bangles +1",
        --legs="Ayanmo Cosciales +2", --legs="Zoar Subligar +1",
        --feet="Ayanmo Gambieras +2", --feet=gear.Chironic_QA_feet,
        neck="Bard's Charm",     
		ear1="Cessance Earring",
		ear2="Tripudio Earring", --ear2="Telos Earring",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
    }

    sets.engaged.DW = {
        --range="Linos", --range=gear.Linos_TP,
        head="Ayanmo Zucchetto +2", --head="Volte Tiara",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2", --hands="Raetic Bangles +1",
        --legs="Ayanmo Cosciales +2", --legs="Zoar Subligar +1",
        --feet="Ayanmo Gambieras +2", --feet=gear.Chironic_QA_feet,
        neck="Bard's Charm",     
        ear1="Cessance Earring",
        ear2="Tripudio Earring", --ear2="Telos Earring",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
    } -- 26%

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged.Hybrid = {
        --neck="Loricate Torque +1", --6/6
        --ring1="Moonlight Ring", --5/5
        --ring2="Defending Ring", --10/10
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.SongDWDuration = {sub="Kali"}

    sets.buff.Doom = {
        --neck="Nicander's Necklace", --20
        --ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        --ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        --waist="Gishdubar Sash", --10
    }

	sets.Obi = {}
    --sets.Obi = {waist="Hachirin-no-Obi"}

	sets.moveSpeed = {feet="Fili Cothurnes +1"}

    sets.Carnwenhan = {} --{main="Carnwenhan", sub="Ternion Dagger +1"}
    sets.Twashtar = {} --{main="Twashtar", sub="Taming Sari"}
    sets.Tauret = {} --{main="Tauret", sub="Ternion Dagger +1"}
    sets.Naegling = {} --{main="Naegling", sub="Centovente"}

    sets.DefaultShield = {} --{sub="Genmei Shield"}
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=set_combine(sets.engaged, sets.idle), engaged=sets.engaged},
	}

    weaponMode = {
		["index"] = 0,
		[0] = {name="Fusetto", set={main="Naegling", sub="Fusetto +2"}},
        [1] = {name="Kali", set={main="Naegling", sub="Kali"}},        
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
		},		
        ["sing"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},	
	}	

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
    send_command('bind @q gs c cycleSing')
	set_macro_page(1, 2)
end

function user_unload()

end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)

end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast Phase Extensions
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)	
    if spell.type == 'BardSong' then
        if buffactive['Clarion Call'] then -- Buff ID: 499
            equip({ranged="Blurred Harp +1"})
        else
            equip({ranged="Gjallarhorn"})
        end
    end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)	
    if spell.type == 'BardSong' then
        if buffactive['Clarion Call'] then -- Buff ID: 499
            equip({ranged="Blurred Harp +1"})
        else
            equip({ranged="Gjallarhorn"})
        end
    end

    if spell.name:contains('Minuet') then
        equip({body="Fili Hongreline"})
    end
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)	
    if spell.type == 'BardSong' then
        if buffactive['Clarion Call'] then -- Buff ID: 499
            equip({ranged="Blurred Harp +1"})
        else
            equip({ranged="Gjallarhorn"})
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	-- spike health for omen healing objective
	if cmdParams[1]:lower() == 'spikehealth' then
		equip(sets.naked)
	end

    --[[ Cycle Auto Sing ]]--
    if cmdParams[1] == 'cycleSing' then
        auto.sing.index = auto.sing.index + 1
        if auto.sing.index > #auto.sing then
            auto.sing.index = 0
        end
        windower.add_to_chat(122,'[Sing: '..auto.sing[auto.sing.index]..']')
    end

    modeHud('update')
end

function extendedModeHud(hudText)
    skyblue = '\\cs(135,206,250)'
    red = '\\cs(255,0,0)'
	green = '\\cs(0,255,0)'
    textColor = red
    if auto.sing[auto.sing.index] == 'On' then
        textColor = green
    end

    hudText:append(skyblue..'Sing: '..textColor..auto.sing[auto.sing.index]..white)
	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction function: called ~once per second
-------------------------------------------------------------------------------------------------------------------
song1 = "Valor Minuet V"
song2 = "Valor Minuet IV"
song3 = "Victory March"
song4 = "Valor Minuet III"
songTimer = os.time()
baseSongDuration = 180
baseSongInterval = 10

function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()
    local curingWaltzRecast = abilRecast[186]
    local svRecast = abilRecast[0]
    local clarionRecast = abilRecast[254]
    local nightingaleRecast = abilRecast[109]
    local troubadourRecast = abilRecast[110]
    local marcatoRecast = abilRecast[48]
    local me = windower.ffxi.get_player()  

    --[[
    if auto.sing[auto.sing.index] == 'On' then
        local songTimeRemaining = songTimer - os.time()

        -- Plan A: If SV & Clarion are up, re-sing songs with Nitro/Marcato, short interval (1.5?) between, and no concern for current song duration
        if clarionRecast == 0 and svRecast == 0 then
            add_to_chat(122, '[~ Soul Voice ~]')
            send_command('input //af off')
            send_command('input /ja Nightingale <me>')
		    send_command:schedule(0.5, 'input /ja Troubadour <me>')
		    send_command:schedule(1.0, 'input /ja Marcato <me>')
            send_command:schedule(1.5, 'input /ja "Soul Voice" <me>')
            send_command:schedule(2.0, 'input /ja "Clarion Call" <me>')
            send_command:schedule(2.5, 'input /ma "'..song1..'" <me>')
            send_command:schedule(5.0, 'input /ma "'..song2..'" <me>')
            send_command:schedule(7.5, 'input /ma "'..song3..'" <me>')
            send_command:schedule(9.0, 'input /ma "'..song4..'" <me>')            
            send_command:schedule(10.5, 'input //af on')
            songTimer = os.time() + (baseSongDuration * 2)
            return
        -- Plan B: Use Nitro/Marcato if SV/Clarion are > 10 min away, re-sing songs when nearest is < 10 secs remaining
        elseif clarionRecast > 600 and svRecast > 600 and songTimeRemaining < 10 and nightingaleRecast == 0 and troubadourRecast == 0 and marcatoRecast == 0 then
            add_to_chat(122, '[~ Nitro ~]')
            send_command('input //af off')
            send_command('input /ja Nightingale <me>')
		    send_command:schedule(0.5, 'input /ja Troubadour <me>')
		    send_command:schedule(1.0, 'input /ja Marcato <me>')
            send_command:schedule(1.5, 'input /ma "'..song1..'" <me>')
            send_command:schedule(1.5+baseSongInterval, 'input /ma "'..song2..'" <me>')
            send_command:schedule(1.5+baseSongInterval*2, 'input /ma "'..song3..'" <me>')
            send_command:schedule(1.5+baseSongInterval*3, 'input /ma "'..song4..'" <me>')
            send_command:schedule(1.5+baseSongInterval*4, 'input //af on')
            songTimer = os.time() + (baseSongDuration * 2)
            return
        -- Plan C: Re-sing songs normally when nearest is < 10 secs remaining
        elseif songTimeRemaining < 10 then
            add_to_chat(122, '[~ Basic Re-sing ~]')            
            send_command('input //af off')            
            send_command('input /ma "'..song1..'" <me>')
            send_command:schedule(baseSongInterval, 'input /ma "'..song2..'" <me>')
            send_command:schedule(baseSongInterval*2, 'input /ma "'..song3..'" <me>')
            send_command:schedule(baseSongInterval*3, 'input /ma "'..song4..'" <me>')
            send_command:schedule(baseSongInterval*4, 'input //af on')
            songTimer = os.time() + baseSongDuration
            return
        end

        add_to_chat(122, '[Current Time: '..os.time()..' | Song Timer: '..songTimer..' | Song Time Remaining: '..songTimeRemaining..']')
    end
    ]]--
    --[[ Haste Samba handing when auto.buff is on ]]--
	if auto.buff[auto.buff.index] == 'On' and player.sub_job == 'DNC' and player.tp >= 350 and not buffactive['Haste Samba'] then
        add_to_chat(122, '[Haste Samba]')
        send_command('/haste samba')
        return
	end

    --[[ Emergency /DNC heals when auto.fite is on ]]--
    if auto.fite[auto.fite.index] == 'On'and not actionInProgress and not movingthen and me.status == 1 and me.sub_job == 'DNC' then
        local enemy = windower.ffxi.get_mob_by_target('t')		
        if player.tp >= 200 and curingWaltzRecast == 0 then
            for _, data in pairs(windower.ffxi.get_party()) do
                if type(data) == 'table' and data.mob then
                    local pInfo = data.mob
                    if pInfo.hpp > 0 and pInfo.hpp < 40 then
                        add_to_chat(122, pInfo.name..' is under 40% - Waltz!')
                        windower.chat.input('/curingwaltz3 '..pInfo.id)
                        return
                    end
                end
            end
        end
    end   

    --[[
    if not buffactive['Food'] then
        send_command('input /item "B.E.W. Pitaru" <me>')
        return
    end]]--
end