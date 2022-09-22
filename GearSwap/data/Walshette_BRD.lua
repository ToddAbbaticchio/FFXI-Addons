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
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
	gear.meleeTPCape = {name="Intarabus's Cape", augments={'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10',}}
	gear.magicAccCape = {name="Intarabus's Cape", augments={'CHR+20',}}
    gear.savageCape = {name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

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
        --ear2="Etiolation Earring", --1
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
        --feet="Bihu Slippers +3", --9
        --neck="Loricate Torque +1",
        --ear1="Odnowa Earring +1",
        --ring2="Defending Ring",
        neck="Mnbw. Whistle +1",
        })

    sets.precast.FC.SongPlaceholder = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})

    --sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak", sub="Ammurapi Shield", waist="Shinjutsu-no-Obi +1"})

    -- Precast sets to enhance JAs

    sets.precast.JA.Nightingale = {} --{feet="Bihu Slippers +3"}
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
    sets.midcast.Minuet = {} --{body="Fili Hongreline +1"}
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
        --feet="Brioso Slippers +3",
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
        --feet="Brioso Slippers +3",
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
        --feet="Brioso Slippers +3",
        --neck="Mnbw. Whistle +1",
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
        --range=gear.Linos_TP,
        head="Ayanmo Zucchetto +2", --head="Volte Tiara",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2", --hands="Raetic Bangles +1",
        --legs="Ayanmo Cosciales +2", --legs="Zoar Subligar +1",
        --feet="Ayanmo Gambieras +2", --feet=gear.Chironic_QA_feet,
        neck="Bard's Charm",     
		ear1="Steelflash Earring", --ear1="Cessance Earring",
		ear2="Tripudio Earring", --ear2="Telos Earring",
		ring1="Apate Ring", --ring1={name="Chirich Ring +1", bag="wardrobe3"},
		ring2="Dhanurveda Ring", --ring2={name="Chirich Ring +1", bag="wardrobe4"},
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
    }

    sets.engaged.DW = {
        --range=gear.Linos_TP,
        head="Ayanmo Zucchetto +2", --head="Volte Tiara",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2", --hands="Raetic Bangles +1",
        --legs="Ayanmo Cosciales +2", --legs="Zoar Subligar +1",
        --feet="Ayanmo Gambieras +2", --feet=gear.Chironic_QA_feet,
        neck="Bard's Charm",     
        ear1="Steelflash Earring", --ear1="Cessance Earring",
        ear2="Tripudio Earring", --ear2="Telos Earring",
        ring1="Apate Ring", --ring1={name="Chirich Ring +1", bag="wardrobe3"},
        ring2="Dhanurveda Ring", --ring2={name="Chirich Ring +1", bag="wardrobe4"},
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

	sets.moveSpeed = {}

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
	--Setup gearMode
	--TODO: replace these with the modes you want. Give name, set desired idle/engaged sets when in that mode.
	gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=set_combine(sets.engaged, sets.idle), engaged=sets.engaged},
	}
	
	--Setup weaponMode
	--TODO: replace these with the weapon modes you want.
	weaponMode = {
		["index"] = 0,
		[0] = {name="Naegling", set={main="Naegling", sub="Fusetto +2"}},
		[1] = {name="Kali", set={main="Kali", sub=""}},
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
		}		
	}	

	--sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	
	evalState_equipGear()
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUser_Setup()
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
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	-- spike health for omen healing objective
	if cmdParams[1]:lower() == 'spikehealth' then
		equip(sets.naked)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction function: called ~once per second
-------------------------------------------------------------------------------------------------------------------
function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()
    local curingWaltzRecast = abilRecast[186]
    local me = windower.ffxi.get_player()  

    -- Autofite emergency heals
    if auto.fite[auto.fite.index] == 'On'and not actionInProgress and not movingthen and me.status == 1 then
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
end