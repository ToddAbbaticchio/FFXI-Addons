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
	gear.magicAccCape = {name="Intarabus's Cape", augments={'CHR+20',}}
    gear.savageCape = {name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    gear.extraSong = {name="Daurdabla"}
    gear.songPotency = {name="Gjallarhorn"}
    gear.linos = {name="Linos"}

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    -- Fast cast sets for spells
    sets.precast.FC = {
        --sub="Kali", --71
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
	sets.precast.FC['Enhancing Magic'] = sets.precast.FC

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
        head="Fili Calot +2", --14
        body="Brioso Justau. +2", --15
        feet="Brioso Slippers +3", 
        --neck="Loricate Torque +1",
        --ear1="Odnowa Earring +1",
        --ring2="Defending Ring",
        neck="Mnbw. Whistle +1",
    })

    --sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    sets.precast.JA.Nightingale = {feet="Bihu Slippers +2"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +2"}
    sets.precast.JA['Soul Voice'] = {} --{legs="Bihu Cannions +3"}

    sets.precast.Waltz = {}

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    -- Gear to enhance certain classes of songs.
    sets.midcast.Ballad = {legs="Fili Rhingrave +2"}
    sets.midcast.Carol = {} --{hands="Mousai Gages +1"}
    sets.midcast.Etude = {head="Mousai Turban +1"}
    sets.midcast.HonorMarch = {range="Marsyas", hands="Fili Manchettes +2"}
    sets.midcast.Lullaby = {
        range="Blurred Harp +1",
        head="Brioso Roundlet +2",
        body="Brioso Justaucorps +2",
        hands="Inyanga Dastanas +2",
        legs="Inyanga Shalwar +2",
        feet="Bihu Slippers +2",
        neck="Moonbow Whistle +1",
        ring1="Stikini Ring",
        ring2="Stikini Ring",
        ear1="Enchanter's Earring",        
        waist="Harfner's Sash",
        back=gear.magicAccCape,
    } 
    sets.midcast.Madrigal = {head="Fili Calot +2"}
    sets.midcast.Mambo = {} --{feet="Mou. Crackows +1"}
    sets.midcast.March = {hands="Fili Manchettes +2"}
    sets.midcast.Minne = {} --{legs="Mou. Seraweels +1"}
    sets.midcast.Minuet = {body="Fili Hongreline +2"}
    sets.midcast.Paeon = {head="Brioso Roundlet +2"}
    sets.midcast.Threnody = {body="Mou. Manteel +1"}
    sets.midcast['Adventurer\'s Dirge'] = {range="Marsyas"} -- bihu Cuffs
    sets.midcast['Foe Sirvente'] = {} --{head="Bihu Roundlet +3"}
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
		ring1="Stikini Ring",
		ring2="Stikini Ring",
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
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        waist="Harfner's Sash", --waist="Acuity Belt +1",
        back=gear.magicAccCape,
	}

    -- For Horde Lullaby maxiumum AOE range.
    sets.midcast.SongStringSkill = {
        --ear1="Gersemi Earring",
        --ear2="Darkside Earring",
        --ring2={name="Stikini Ring +1", bag="wardrobe4"},
        neck="Mnbw. Whistle +1",
    }

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
        ring1="Menelaus's Ring",
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
    }

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
		ring1="Stikini Ring", --ring1={name="Stikini Ring +1", bag="wardrobe3"},
		ring2="Stikini Ring", --ring2={name="Stikini Ring +1", bag="wardrobe4"},
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
        head="Nyame Helm", --head=gear.Chironic_WSD_head,
        body="Bihu Jstcorps. +3",
        hands="Chironic Gloves",
        legs="Nyame Flanchard", --legs="Bihu Cannions +3",
        feet="Bihu Slippers +2",
        neck="Bard's Charm +2", --neck="Fotia Gorget",
        ear1="Cessance Earring",
        ear2="Moonshade Earring",
        ring1="Ifrit Ring +1",
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
		neck="Moonbow Whistle +1", --neck="Bathy Choker +1",
        ear1="Enchanter's Earring",
        --ear1="Eabani Earring",
        ear2="Etiolation Earring", --ear2="Sanare Earring",
		ring1="Fortified Ring", --ring1={name="Stikini Ring +1", bag="wardrobe3"},
		ring2="Inyanga Ring", --ring2={name="Stikini Ring +1", bag="wardrobe4"},
        --back="Moonlight Cape",
        --waist="Flume Belt +1",
       --head="Inyanga Tiara +2", --head="Volte Beret",
        --body="Inyanga Jubbah +2", --body="Mou. Manteel +1",
        --hands="Inyanga Dastanas +2", --hands="Raetic Bangles +1",
        --legs="Inyanga Shalwar +2", ---legs="Volte Brais",
        --feet="Inyan. Crackows +2", --feet="Volte Gaiters",   
        head="Fili Calot +2",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Fili Rhingrave +2",
        feet="Fili Cothurnes +2",
    }

	------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.engaged = {
        range=gear.Linos,
        head="Ayanmo Zucchetto +2", --head="Volte Tiara",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2", --hands="Raetic Bangles +1",
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
        hands="Ayanmo Manopolas +2", --hands="Raetic Bangles +1",
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
        --neck="Loricate Torque +1", --6/6
        --ring1="Moonlight Ring", --5/5
        --ring2="Defending Ring", --10/10
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.buff.Doom = {
        --neck="Nicander's Necklace", --20
        --ring1={name="Eshmun's Ring", bag="wardrobe3"}, --20
        --ring2={name="Eshmun's Ring", bag="wardrobe4"}, --20
        --waist="Gishdubar Sash", --10
    }

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
		[0] = {name="DPS", idle=set_combine(sets.engaged, sets.idle), engaged=sets.engaged},
	}

    weaponMode = {
		["index"] = 0,
		[0] = {name="Naegling/Fusetto", set={main="Naegling", sub="Fusetto +2"}},
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
        ['Honor March'] = {name="Honor March", expireTime=0, active=false},
        --['Blade Madrigal'] = {name="Blade Madrigal", expireTime=0, active=false},
        --['Archer\'s Prelude'] = {name="Archer's Prelude", expireTime=0, active=false},
        --['Victory March'] = {name="Victory March", expireTime=0, active=false},
        --['Sword Madrigal'] = {name="Sword Madrigal", expireTime=0, active=false},
        ['Valor Minuet V'] = {name="Valor Minuet V", expireTime=0, active=false},
        ['Valor Minuet IV'] = {name="Valor Minuet IV", expireTime=0, active=false},
        ['Valor Minuet III'] = {name="Valor Minuet III", expireTime=0, active=false},    
        ['Valor Minuet II'] = {name="Valor Minuet II", expireTime=0, active=false},      
        --['Learned Etude'] = {name="Learned Etude", expireTime=0, active=false},
        --['Quick Etude'] = {name="Quick Etude", expireTime=0, active=false},
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
    if auto.sing[auto.sing.index] == 'On' and spell.type == 'BardSong' then
        local maxSongs = tablelength(autoSongs) - 1
        local currCount = countSongs()
        if buffactive['Clarion Call'] then
            maxSongs = maxSongs + 1
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

    if auto.sing[auto.sing.index] == 'On' and spell.type == 'BardSong' then
        disable('head','body','hands','legs','feet','neck')
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
baseSongDuration = 250 
-- How long the song should have left on it before we re-sing
songBuffer = 60 

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
    if auto.fite[auto.fite.index] == 'On' and not me.status == 1 then
        return
    end

    if auto.sing[auto.sing.index] == 'On' and not songInProgress then
        -- General theory is anything can be interrupted by other actions (mob hits you, AutoFite pulls or WSes, etc.)
        -- Constantly re-evaluate current status and determine what to do next

        -- If not all songs are active, try to get more up (only use clarion if Auto Fite is on)
        if (countSongs() < tablelength(autoSongs) and countSongs() >= 2 and (clarionRecast == 0 and auto.fite[auto.fite.index] == 'On' and not buffactive['Clarion Call'])) then
            add_to_chat(038, '! Clarion Call Needed !')
            send_command('/clarioncall')
            resetSongTimers()
            return
        elseif (countSongs() < tablelength(autoSongs)-1  and countSongs() >= 2 and (clarionRecast > 0 or auto.fite[auto.fite.index] == 'Off')) then
            -- This is (hopefully) handled by job precast
            add_to_chat(038, '! Bonus Song Needed !')
        end
        
        -- Soul Voice (only if AutoFite is on)
        if (soulVoiceRecast == 0 and auto.fite[auto.fite.index] == 'On' and not buffactive['Soul Voice']) then
            send_command('/soulvoice')
            resetSongTimers()
            return
        end

        -- JAs: Nightingale/Troubadour/Marcato  
        -- Marcato (if Soul Voice is not on, combine with Nitro)
        if (not buffactive['Soul Voice'] and marcatoRecast == 0 and nightingaleRecast == 0 and troubadourRecast == 0) then
            add_to_chat(013, '~ Marcato ~')
            send_command('/marcato')
            autoSongs['Honor March'].expireTime = -1
            return
        end
        -- Nitro should be saved for SV if it's going to be used soon 
        if (nightingaleRecast == 0 and troubadourRecast == 0 and ((soulVoiceRecast > 300 and auto.fite[auto.fite.index] == 'On') or auto.fite[auto.fite.index] == 'Off') and not buffactive['Nightingale']) then
            -- TODO: Set first song's expiry to 0 so it plays next
            -- TODO: Set other songs right after so they get re-sung with nitro duration
            add_to_chat(013, '~ Nitro ~')
            send_command('/nightingale')
            return
        end
        if (buffactive['Nightingale'] and troubadourRecast == 0 and not buffactive['Troubadour']) then
            send_command('/troubadour')
            resetSongTimers()
            return
        end

        -- Sing songs that expire soon
        for name,info in pairs(autoSongs) do
            if not info.active or info.expireTime - os.time() < songBuffer then                
                add_to_chat(013, '~ Input: '..name..' (Expiry: '..(info.expireTime - os.time())..')')
                send_command('input /ma "'..name..'" <me>')
                return
            end
        end
    end

    -- Emergency mode -- maybe missed a song completion and stuck in songInProgress
    if auto.sing[auto.sing.index] == 'On' and songInProgress then       
        for name,info in pairs(autoSongs) do
            if info.expireTime - os.time() < songBuffer*0.5 then                
                add_to_chat(038, '~ Emergency Input: '..name..' (Expiry: '..(info.expireTime - os.time())..')')
                send_command('input /ma "'..name..'" <me>')
                return
            end
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

    if auto.fite[auto.fite.index] == 'On' and not songInProgress and not buffactive['Food'] then
        send_command('input /item "Grape Daifuku +1" <me>')
        return
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

function countAutoSongs()
    local count = 0
    for k,v in pairs(autoSongs) do
        if v.active == true then
            count = count + 1
        end        
    end
    return count
end

function countSongs()
    local count = 0
    for k,v in pairs(windower.ffxi.get_player().buffs) do
        if v >= 195 and v <= 222 then
            count = count + 1
        end
    end
    return count
end

function resetSongTimers()
    -- Set all songs to buffer limit so they look like they need to be re-sung
    for k,v in pairs(autoSongs) do
        v.expireTime = os.time() + songBuffer     
    end
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end