include('sharedFunctions.lua')
res = require 'resources'
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
	gear.magicAccCape = {name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
    gear.savageCape = {name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    gear.extraSong = {name="Daurdabla"}
    gear.songPotency = {name="Gjallarhorn"}
    gear.linos = {name="Linos"}

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    -- Fast cast sets for spells
    sets.precast.FC = {
        main="Kali", -- 7%
        head="Bunzi's Hat", -- 10%
        body="Inyanga Jubbah +2", -- 14%
        hands="Kaykaus Cuffs +1", -- 4%
        legs="Kaykaus Tights +1", -- 7%
        feet="Fili Cothurnes +2", -- 10%
        ear2="Etiolation Earring", -- 1%
        ring2="Kishar Ring", -- 4%
        back=gear.magicAccCape, -- 10%
        -- = 67%
    }
	sets.precast.FC['Enhancing Magic'] = sets.precast.FC

    sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
        head="Fili Calot +2", --14
        body="Brioso Justau. +2", --15
        feet="Brioso Slippers +3", 
        --neck="Loricate Torque +1",
        --ear1="Odnowa Earring +1",
        --ring2="Defending Ring",
        neck="Mnbw. Whistle +1",
    })

    --sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

    sets.precast.Waltz = {}

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    -- Gear to enhance certain classes of songs.
    sets.midcast.Ballad = {legs="Fili Rhingrave +2"}
    sets.midcast.Carol = {hands="Mousai Gages +1"}
    sets.midcast.Etude = {head="Mousai Turban +1"}
    sets.midcast.HonorMarch = {range="Marsyas", hands="Fili Manchettes +2"}
    sets.midcast.Lullaby = {
        range="Blurred Harp +1",
        head="Brioso Roundlet +2",
        body="Brioso Justaucorps +2",
        hands="Inyanga Dastanas +2",
        legs="Inyanga Shalwar +2",
        feet="Bihu Slippers +3",
        neck="Moonbow Whistle +1",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        ear1="Enchanter's Earring",        
        waist="Harfner's Sash",
        back=gear.magicAccCape,
    } 
    sets.midcast.Madrigal = {head="Fili Calot +2"}
    sets.midcast.Mambo = {feet="Mou. Crackows +1"}
    sets.midcast.March = {hands="Fili Manchettes +2"}
    sets.midcast.Minne = {legs="Mou. Seraweels +1"}
    sets.midcast.Minuet = {body="Fili Hongreline +2"}
    sets.midcast.Paeon = {head="Brioso Roundlet +2"}
    sets.midcast.Threnody = {body="Mou. Manteel +1"}
    sets.midcast['Adventurer\'s Dirge'] = {range="Marsyas", hands="Bihu Cuffs +3"}
    sets.midcast['Foe Sirvente'] = {head="Bihu Roundlet +3"}
    sets.midcast['Magic Finale'] = {legs="Fili Rhingrave +2"}
    sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +2"}
    sets.midcast["Chocobo Mazurka"] = {range="Marsyas"}

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEnhancing = {
        head="Fili Calot +2",
        body="Fili Hongreline +2",
        hands="Fili Manchettes +2",
        legs="Inyanga Shalwar +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        --ear1="Odnowa Earring +1",
        ear2="Etiolation Earring",
        --ring1="Moonlight Ring",
        --ring2="Defending Ring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        --waist="Flume Belt +1",
        --back=gear.BRD_Song_Cape,
    }

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongEnfeeble = {
        head="Brioso Roundlet +2",
        body="Brioso Justau. +2",
        hands="Brioso Cuffs +2",
        legs="Brioso Cannions +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        ear1="Enchanter's Earring", --ear1="Digni. Earring",
        --ear2="Regal Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        waist="Harfner's Sash", --waist="Acuity Belt +1",
        back=gear.magicAccCape,
	}

    -- For Horde Lullaby maxiumum AOE range.
    sets.midcast.SongStringSkill = {
        --ear1="Gersemi Earring",
        --ear2="Darkside Earring",
        ring2="Stikini Ring +1",
        neck="Mnbw. Whistle +1",
    }

    -- Other general spells and classes.
    sets.midcast['Healing Magic'] = {
        main="Daybreak", --30
        --sub="Ammurapi Shield",
        head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
        hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
        legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        --neck="Incanter's Torque",
        --ear1="Beatific Earring",
        --ear2="Meili Earring",
        ring1="Menelaus's Ring",
        ring2="Stikini Ring +1", --ring2="Haoma's Ring",
        --back="Solemnity Cape", --7
        --waist="Bishop's Sash",
    }

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        --neck="Nuna Gorget +1",
        ring1="Stikini Ring +1",
        --ring2="Metamor. Ring +1",
        --waist="Luminary Sash",
    })

    sets.midcast.StatusRemoval = set_combine(sets.midcast.Cure, {
        head="Vanya Hood",
        body="Vanya Robe",
        legs="Aya. Cosciales +2",
        feet="Vanya Clogs",
        --neck="Incanter's Torque",
        --ear2="Meili Earring",
        ring1="Menelaus's Ring",
        --ring2="Haoma's Ring",
        --back=gear.BRD_Song_Cape,
        --waist="Bishop's Sash",
    })

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
        --hands="Hieros Mittens",
        --neck="Debilis Medallion",
        --ear1="Beatific Earring",
        --back="Oretan. Cape +1",
    })

    sets.midcast['Enhancing Magic'] = {
        --head=gear.Telchine_ENH_head,
        --body=gear.Telchine_ENH_body,
        --hands=gear.Telchine_ENH_hands,
        --legs=gear.Telchine_ENH_legs,
        --feet=gear.Telchine_ENH_feet,
        --neck="Incanter's Torque",
        --ear1="Mimir Earring",
        --ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
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
        hands="Brioso Cuffs +2",
        legs="Brioso Cannions +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        --ear1="Digni. Earring",
        --ear2="Vor Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
        --ring2="Metamor. Ring +1",
        --waist="Acuity Belt +1",
        back=gear.magicAccCape,
    }

    sets.midcast['Elemental Magic'] = {
        --main="Carnwenhan",
        --sub="Ammurapi Shield",
        head="Bunzi's Hat",
        body="Bunzi's Robe",
        hands="Bunzi's Gloves",
        legs="Bunzi's Pants",
        feet="Bunzi's Sabots",
        neck="Mnbw. Whistle +1",
        ear1="Friomisi Earring",
        ear2="Hecate's Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        --waist="Acuity Belt +1",
        back=gear.magicAccCape,
    }

    --sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})
	
	------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm", --head=gear.Chironic_WSD_head,
        body="Bihu Jstcorps. +3",
        hands="Chironic Gloves",
        legs="Bihu Cannions +3",
        feet="Bihu Slippers +3",
        neck="Bard's Charm +2", --neck="Fotia Gorget",
        ear1="Cessance Earring",
        ear2="Moonshade Earring",
        ring1="Sroda Ring",
        ring2="Epaminondas's Ring",
        back=gear.savageCape,
        waist="Sailfi Belt +1",
    }

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.precast.WS, {
        range=gear.Linos,
        head="Nyame Helm", --head="Volte Tiara",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        neck="Bard's Charm +2",     
		ear1="Cessance Earring",
		ear2="Mache Earring +1", --ear2="Telos Earring",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
        feet="Nyame Sollerets",
    })

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
    })

    sets.precast.WS['Shining Blade'] = set_combine(sets.precast.WS, {
        ear1="Friomisi Earring",
        waist="Soil Belt",
        feet="Nyame Sollerets",
    })
	
    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
		neck="Loricate Torque", -- -5% DT
        ear1="Etiolation Earring",
        ear2="Fili Earring",
		ring1="Stikini Ring +1",  -- +1 Refresh
		ring2="Stikini Ring +1",  -- +1 Refresh
        head="Fili Calot +2", -- -10% DT
        body="Bunzi's Robe", -- -10% DT
        hands="Fili Manchettes +2", -- -10% DT
        legs="Fili Rhingrave +2", -- -12% DT
        feet="Fili Cothurnes +2",
        back=gear.magicAccCape, -- -5% DT
    }

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.engaged = {
        range=gear.Linos,
        head="Ayanmo Zucchetto +2", --head="Volte Tiara",
        body="Ayanmo Corazza +2",
        hands="Bunzi's Gloves",
        legs="Zoar Subligar +1",
        neck="Bard's Charm +2",     
		ear1="Cessance Earring",
		ear2="Mache Earring +1", --ear2="Telos Earring",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
        feet="Volte Spats",
    }

    sets.engaged.DW = {
        range=gear.Linos,
        head="Ayanmo Zucchetto +2", --head="Volte Tiara",
        body="Ayanmo Corazza +2",
        hands="Bunzi's Gloves",
        legs="Zoar Subligar +1",
        neck="Bard's Charm +2",     
        ear1="Cessance Earring",
        ear2="Mache Earring +1",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
        feet="Volte Spats",
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.engaged.Hybrid = {
        ring2="Defending Ring",
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.buff.Doom = {}

	sets.Obi = {}
    --sets.Obi = {waist="Hachirin-no-Obi"}

	sets.moveSpeed = {feet="Fili Cothurnes +2"}
    sets.TH = {head="Wh. Rarab Cap +1", legs="Chironic Hose"}
    sets.precast.JA['Box Step'] = sets.TH
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	gearMode = {
		["index"] = 0,
		[0] = {name="Default", idle=sets.idle, engaged=sets.engaged},
	}

    weaponMode = {
		["index"] = 0,
		[0] = {name="Naegling/Cento", set={main="Naegling", sub="Centovente"}},
        [1] = {name="Naegling/Kali", set={main="Naegling", sub="Kali"}},   
        [2] = {name="AE", set={main="Tauret", sub="Kali"}},      
        [3] = {name="Kali", set={main="Kali", sub=""}},    
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

    autoSongs = {
        ['Honor March'] = {0, name="Honor March", expireTime=0, active=false},
        ['Victory March'] = {1, name="Victory March", expireTime=0, active=false},
        ['Blade Madrigal'] = {2, name="Blade Madrigal", expireTime=0, active=false},
        ['Valor Minuet V'] = {3, name="Valor Minuet V", expireTime=0, active=false},
        ['Valor Minuet IV'] = {4, name="Valor Minuet IV", expireTime=0, active=false},
        --['Archer\'s Prelude'] = {name="Archer's Prelude", expireTime=0, active=false},        
        --['Sword Madrigal'] = {name="Sword Madrigal", expireTime=0, active=false},        
        --['Valor Minuet III'] = {name="Valor Minuet III", expireTime=0, active=false},    
        --['Valor Minuet II'] = {name="Valor Minuet II", expireTime=0, active=false},      
        --['Learned Etude'] = {name="Learned Etude", expireTime=0, active=false},
        --['Quick Etude'] = {name="Quick Etude", expireTime=0, active=false},
        --['Swift Etude'] = {name="Swift Etude", expireTime=0, active=false},
        --['Sage Etude'] = {name="Sage Etude", expireTime=0, active=false},
        --['Learned Etude'] = {name="Learned Etude", expireTime=0, active=false},
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
    bardSongs = { 
        [195]="Paeon",
        [196]="Ballad",
        [197]="Minne",
        [198]="Minuet",
        [199]="Madrigal",
        [200]="Prelude",
        [201]="Mambo",
        [202]="Aubade",
        [203]="Pastoral",
        [204]="Hum",
        [205]="Fantasia",
        [206]="Operetta",
        [207]="Capriccio",
        [208]="Serenade",
        [209]="Round",
        [210]="Gavotte",
        [211]="Fugue",
        [212]="Rhapsody",
        [213]="Aria",
        [214]="March",
        [215]="Etude",
        [216]="Carol",
        [217]="Threnody",
        [218]="Hymnus",
        [219]="Mazurka",
        [220]="Sirvente",
        [221]="Dirge",
        [222]="Scherzo",
    }
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
    if auto.sing[auto.sing.index] == 'On' and spell.type == 'BardSong' and not spell.name:contains('Lullaby') then
        local maxSongs = 4
        local currCount = countSongs()
        if buffactive['Clarion Call'] then
            maxSongs = 5
        end

        if(spell.english == "Honor March") then
            equip({range="Marsyas"})
            return
        end

        if currCount >= maxSongs then
            add_to_chat(015, '- Equipping Gjallarhorn -')
            equip({ranged="Gjallarhorn"})
            return
        end

        add_to_chat(015, '- Equipping Daurdabla -')
        equip({ranged="Daurdabla"})
    end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)	
    if spell.name:contains('Minuet') then
        equip({body="Fili Hongreline +2"})
    elseif spell.name:contains('March') then
        equip({hands="Fili Manchettes +2"})
    elseif spell.name:contains('Madrigal') then
        equip({head="Fili Calot +2"})
    end
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)	
    --[[if spell.type == 'BardSong' then
        if buffactive['Clarion Call'] then -- Buff ID: 499
            equip({ranged="Blurred Harp +1"})
        else
            equip({ranged="Gjallarhorn"})
        end
    end]]--
end

function extendedJobAftercast(spell, action, spellMap, eventArgs)	

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
        windower.add_to_chat(013,'[Sing: '..auto.sing[auto.sing.index]..']')
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
songTimer = os.time()
songInProgress = false
-- How long your songs last with just gear
-- TODO: Calculate this via equipped gear during song listener
baseSongDuration = 240 
-- How long the song should have left on it before we re-sing
songBuffer = 60 
threnodyWatcher = false
singTime = false

function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()
    local curingWaltzRecast = abilRecast[186]
    local soulVoiceRecast = abilRecast[0]
    local clarionRecast = abilRecast[254]
    local nightingaleRecast = abilRecast[109]
    local troubadourRecast = abilRecast[110]
    local marcatoRecast = abilRecast[48]
    local me = windower.ffxi.get_player()  

    --[[ Auto Sing includes: Nightingale/Troubadour/Marcato, Songs ]]--
    --[[ Auto Fite includes: SV/Clarion and Food if set up]]--
    -- If we need to be pulling, do it and avoid all this code
    --[[if auto.fite[auto.fite.index] == 'On' and not me.status == 1 then
        return
    end]]--

    if auto.sing[auto.sing.index] == 'On' then
        -- Only allow auto Clarion/SV in autofite mode
		if auto.fite[auto.fite.index] == "On" then
            if countSongs() < 5 and clarionRecast == 0 then
                add_to_chat(013, '~ Adding to Queue: Clarion Call')
                table.insert(multiStepAction, '/ja "Clarion Call" <me>')
                addSongsToQueue(5)
			elseif countSongs() == 5 and soulVoiceRecast == 0 and nightingaleRecast == 0 and troubadourRecast == 0 then
                add_to_chat(013, '~ Adding to Queue: Soul Voice')
                table.insert(multiStepAction, '/ja "Soul Voice" <me>')
                add_to_chat(013, '~ Adding to Queue: Nightingale')
                table.insert(multiStepAction, '/ja Nightingale <me>')
                add_to_chat(013, '~ Adding to Queue: Troubadour')
                table.insert(multiStepAction, '/ja Troubadour <me>')
                addSongsToQueue(5)
            elseif countSongs() == 5 and soulVoiceRecast > 0 and nightingaleRecast == 0 and troubadourRecast == 0 then
                add_to_chat(013, '~ Adding to Queue: Nightingale')
                table.insert(multiStepAction, '/ja Nightingale <me>')
                add_to_chat(013, '~ Adding to Queue: Troubadour')
                table.insert(multiStepAction, '/ja Troubadour <me>')
                addSongsToQueue(5)
            elseif singTime then
                addSongsToQueue(5)
            end
            return
		end

		if auto.fite[auto.fite.index] == "Off" then
            if countSongs() < 4 then
                addSongsToQueue(4)
			elseif countSongs() == 4 and soulVoiceRecast == 0 and nightingaleRecast == 0 and troubadourRecast == 0 then
                add_to_chat(013, '~ Adding to Queue: Marcato')
                table.insert(multiStepAction, '/ja Marcato <me>')
                add_to_chat(013, '~ Adding to Queue: Nightingale')
                table.insert(multiStepAction, '/ja Nightingale <me>')
                add_to_chat(013, '~ Adding to Queue: Troubadour')
                table.insert(multiStepAction, '/ja Troubadour <me>')
                addSongsToQueue(4)
            elseif countSongs() == 4 and soulVoiceRecast > 0 and nightingaleRecast == 0 and troubadourRecast == 0 then
                add_to_chat(013, '~ Adding to Queue: Nightingale')
                table.insert(multiStepAction, '/ja Nightingale <me>')
                add_to_chat(013, '~ Adding to Queue: Troubadour')
                table.insert(multiStepAction, '/ja Troubadour <me>')
                addSongsToQueue(4)
            elseif singTime then
                addSongsToQueue(4)
            end
            return
		end
    end

    --[[ Auto Buff includes: /DNC Haste Samba ]]--
    --[[ Haste Samba handing when auto.buff is on ]]--
	if auto.buff[auto.buff.index] == 'On' and not songInProgress then
        if player.sub_job == 'DNC' and player.tp >= 350 and not buffactive['Haste Samba'] then
            add_to_chat(122, '[Haste Samba]')
            send_command('/haste samba')
            return
        end
	end
end

windower.register_event('action',function(act)

    if auto.sing[auto.sing.index] == 'On' then
        if not act then return end

        -- actor_id: mob id of caster
        local actor = windower.ffxi.get_mob_by_id(act.actor_id)
        local self = windower.ffxi.get_player()
        local category = act.category
        local param = act.param -- param: Spell ID (from spells.xml resource)
        local targets = act.targets
        local targetsParam = targets.param

        if actor and self and actor.id == self.id then
            -- 08: Start spell casting    (param 24931 = initiation, 28787 = failure)
            -- Objects in 08 return a targets array and an actions array of everyone who is hit by the spell
            if category == 8 and param == 24931 then
                songInProgress = true
                local spellName = res.spells[act.targets[1].actions[1].param].en
                add_to_chat(013, '~ Singing Song ('..spellName..') ~')
            elseif param == 28787 then
                songInProgress = false
                local spellName = res.spells[act.targets[1].actions[1].param].en
                add_to_chat(011, '~ Song Interrupted! ('..spellName..') ~')
            end

            -- 04: Finish spell casting 
            if category == 4 then
                songInProgress = false
                local spellName = res.spells[param].en
                if autoSongs[spellName] ~= nil then
                    -- Don't update expiry very far out it was Harp (want to re-sing it with Gjallarhorn in 60 sec)
                    if (player.equipment.range == gear.extraSong) then                    
                        autoSongs[res.spells[param].en].expireTime = os.time() + songBuffer*2
                        add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : expireTime Set Short ('..(songBuffer*2)..')] ~')
                        autoSongs[spellName].active = true
                    else
                        if buffactive['Troubadour'] then 
                            autoSongs[res.spells[param].en].expireTime = os.time() + baseSongDuration*2
                            add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : expireTime Updated x2 ('..(baseSongDuration*2)..')] ~')
                        else
                            autoSongs[res.spells[param].en].expireTime = os.time() + baseSongDuration
                            add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : expireTime Updated ('..baseSongDuration..')] ~')
                        end                
                        
                        autoSongs[spellName].active = true
                    end            
                else
                    add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : No Changes] ~')
                end

                if auto.sing[auto.sing.index] == 'On' then
                    enable('head','body','hands','legs','feet','neck')
                    equip({range=gear.linos})
                    add_to_chat(015, '- Equipping Linos -')
                end
            end
            
            -- 06: Job Ability Complete
            if category == 6 then
                songInProgress = false
                add_to_chat(013, '- Used a JA ('..res.job_abilities[param].en..') -')
            end
        end
    end
end)

function countSongs()
    local count = 0
    for k,v in pairs(windower.ffxi.get_player().buffs) do
        if v >= 195 and v <= 222 then
            count = count + 1
        end
    end
    return count
end

function addSongsToQueue(numSongs)
    song1 = "Honor March"
    add_to_chat(013, '~ Adding to Queue: '..song1)
    table.insert(multiStepAction, '/ma "'..song1..'" <me>')

    song2 = "Victory March"
    add_to_chat(013, '~ Adding to Queue: '..song2)
    table.insert(multiStepAction, '/ma "'..song2..'" <me>')

    song3 = "Blade Madrigal"
    add_to_chat(013, '~ Adding to Queue: '..song3)
    table.insert(multiStepAction, '/ma "'..song3..'" <me>')

    song4 = "Valor Minuet V"
    add_to_chat(013, '~ Adding to Queue: '..song4)
    table.insert(multiStepAction, '/ma "'..song4..'" <me>')

    if numSongs == 5 then
        song5 = "Valor Minuet IV"
        add_to_chat(013, '~ Adding to Queue: '..song5)
        table.insert(multiStepAction, '/ma "'..song5..'" <me>')
    end
    return
end