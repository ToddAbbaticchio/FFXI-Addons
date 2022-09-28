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

    gear.tpCape = {name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
    gear.evisCape = {name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
    
    sets.baseMelee = {
        ammo="Coiste Bodhar", -- Aurgelmir Orb +1 > Yamarang
        head="Adhemar Bonnet +1",
        body="Adhemar Jacket +1", -- Horos Casaque +3
        hands="Adhemar Wristbands +1",
        legs="Samnuha Tights",
        feet="Herculean Boots", -- Horos Toe Shoes +3
        neck="Etoile Gorget +2",
        ear1="Brutal Earring",
        ear2="Sherida Earring",
        ring1="Gere Ring",
        ring2="Epona's Ring",
        back=gear.tpCape,
        waist="Windbuffet Belt +1", 
    }

    sets.meleeAcc = {
        --ammo="C. Palug Stone",
        --body="Maxixi Casaque +3",
        --legs="Maxixi Tights +3",
        --ear2="Mache Earring +1",
        --ring1="Regal Ring",
        --ring2={name="Chirich Ring +1", bag="wardrobe4"},
        --waist="Kentarch Belt +1",
    }

    sets.meleeHybrid = set_combine(sets.baseMelee, {
        head="Malignance Chapeau", --head=gear.Adhemar_D_head, --4/0
        --body="Ashera Harness", --7/7
        --neck="Loricate Torque +1", --6/6
        --ring1="Moonlight Ring", --5/5
        ring2="Defending Ring", --10/10
    })
    
    sets.baseWS = {
        ammo="Voluspa Tathlum", --ammo="Aurgelmir Orb +1",
        head="Herculean Helm", --head=gear.Herc_WSD_head,
        body="Nyame Mail", --body=gear.Herc_WS_body,
        hands="Meghanada Gloves +2", --hands="Maxixi Bangles +3",
        legs="Nyame Flanchard", --legs="Horos Tights +3",
        feet="Nyame Sollerets", --feet="Lustra. Leggings +1",
        neck="Fotia Gorget",
        ear1="Ishvara Earring",
        ear2="Moonshade Earring",
        ring1="Petrov Ring", --ring1="Regal Ring",
        ring2="Apate Ring", --ring2="Epaminondas's Ring",
        back=gear.evisCape,
        waist="Fotia Belt",
    }     

    sets.precast.FC = {
        --ammo="Sapience Orb",
        --head=gear.Herc_MAB_head, --7
        --body=gear.Taeon_FC_body, --9
        --hands="Leyline Gloves", --8
        --legs="Rawhide Trousers", --5
        --feet=gear.Herc_MAB_feet, --2
        --neck="Orunmila's Torque", --5
        --ear1="Loquacious Earring", --2
        --ear2="Enchntr. Earring +1", --2
        ring1="Naji's Loop",
        --ring2="Weather. Ring +1", --6(4)
    }

    sets.Enmity = {
        --ammo="Sapience Orb", --2
        --head="Halitus Helm", --8
        --body="Emet Harness +1", --10
        --hands="Horos Bangles +3", --9
        --feet="Ahosi Leggings", --7
        --neck="Unmoving Collar +1", --10
        --ear1="Cryptic Earring", --4
        --ear2="Trux Earring", --5
        --ring1="Pernicious Ring", --5
        --ring2="Eihwaz Ring", --5
        --back=gear.DNC_WTZ_Cape, --10
        --waist="Kasiri Belt", --3
    }
    
    sets.baseIdle = {
        --ammo="Staunch Tathlum +1",
        --head="Turms Cap +1",
        --body="Tu. Harness +1",
        --hands="Turms Mittens +1",
        --legs="Turms Subligar +1",
        --feet="Turms Leggings +1",
        --neck="Bathy Choker +1",
        ear1="Eabani Earring",
        --ear2="Sanare Earring",
        --ring1={name="Chirich Ring +1", bag="wardrobe3"},
        --ring2={name="Chirich Ring +1", bag="wardrobe4"},
        --back="Moonlight Cape",
        --waist="Engraved Belt",
    }

    sets.moveSpeed = {feet="Tandava Crackows"}
    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.TH = {head="Wh. Rarab Cap +1", waist='Chaac Belt', ammo='Per. Lucky Egg'}
   
    sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}

    -- JA Sets
    sets.precast.Waltz = {
        --head="Maxixi Tiara +3",
        body="Gleti's Cuirass", --body="Maxixi Casaque +3", --19(8)
        hands="Regal Gloves",
        --legs="Dashing Subligar", --10
        --feet="Maxixi Toe Shoes +3", --14
        neck="Etoile Gorget +2", --10
        --ear1="Handler's Earring +1",
        --ear2="Enchntr. Earring +1",
        --ring1="Carb. Ring +1",
        --ring2="Metamor. Ring +1",
        --back=gear.DNC_WTZ_Cape,
        waist="Aristo Belt",
    }

    sets.precast.WaltzSelf = set_combine(sets.precast.Waltz, {
        head="Mummu Bonnet +2", --(8)
        --ring1="Asklepian Ring", --(3)
        --ear1="Roundel Earring", --5
    })

    sets.precast.Step = {
        --ammo="C. Palug Stone",  -- Yamarang
        head="Mummu Bonnet +2", --head="Maxixi Tiara +3",
        body="Mummu Jacket +2", --body="Maxixi Casaque +3",
        hands="Mummu Wrists +2", --hands="Gazu Bracelet +1",
        legs="Mummu Kecks +2",
        feet="Mummu Gamashes +2", --feet="Horos T. Shoes +3",
        neck="Etoile Gorget +2",
        ear1="Odr Earring", -- ear1="Mache Earring +1",
        ear2="Telos Earring",
        ring1="Meghanada Ring", --ring1="Regal Ring",
        ring2="Mummu Ring", --ring2={name="Chirich Ring +1", bag="wardrobe4"},
        waist="Kentarch Belt", --waist="Olseni Belt",
        back=gear.tpCape,
    }

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity    

    sets.precast.Flourish1['Violent Flourish'] = { -- Magic Accuracy
        --ammo="Yamarang",
        head="Mummu Bonnet +2",
        --body="Horos Casaque +3",
        hands="Mummu Wrists +2",
        legs="Mummu Kecks +2",
        feet="Mummu Gamash. +2",
        neck="Etoile Gorget +2",
        --ear1="Digni. Earring",
        --ear2="Enchntr. Earring +1",
        --ring1="Metamor. Ring +1",
        --ring2="Weather. Ring +1",
        waist="Eschan Stone",
        back=gear.tpCape,
    }

    sets.precast.Flourish1['Desperate Flourish'] = { -- Accuracy
        --ammo="C. Palug Stone",
        --head="Maxixi Tiara +3",
        --body="Maxixi Casaque +3",
        --hands="Gazu Bracelet +1",
        --legs=gear.Herc_WS_legs,
        --feet="Maxixi Toe Shoes +3",
        neck="Etoile Gorget +2",
        --ear1="Cessance Earring",
        ear2="Telos Earring",
        --ring1="Regal Ring",
        --ring2={name="Chirich Ring +1", bag="wardrobe4"},
        back=gear.tpCape,
    }

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +1"} --{hands="Macu. Bangles +1",    back="Toetapper Mantle"}
    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {} --{body="Macu. Casaque +1"}
    sets.precast.Flourish3['Climactic Flourish'] = {} --{head="Maculele Tiara +1",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        ammo="Impatiens",
        body="Passion Jacket",
        --ring1="Lebeche Ring",
    })

    sets.precast.Step['Feather Step'] = {} --set_combine(sets.precast.Step, {feet="Macu. Toe Shoes +1"})

    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['No Foot Rise'] = {} --{body="Horos Casaque +3"}
    sets.precast.JA['Trance'] = {} --{head="Horos Tiara +3"}

    sets.buff['Saber Dance'] = {} --{legs="Horos Tights +3"}
    sets.buff['Fan Dance'] = {} --{body="Horos Bangles +3"}
    sets.buff['Climactic Flourish'] = {} --{head="Maculele Tiara +1"} --body="Meg. Cuirie +2"}
    sets.buff['Closed Position'] = {} --{feet="Horos T. Shoes +3"}

    -- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Exenterator'] = set_combine(sets.baseWS, {
        head="Adhemar Bonnet +1", --head=gear.Adhemar_B_head,
        body="Meg. Cuirie +2",
        legs="Meg. Chausses +2",
        feet="Meg. Jam. +2",
        ear1="Sherida Earring",
        ear2="Brutal Earring",
        --back=gear.DNC_WS2_Cape,
    })

    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.baseWS, {
        --head="Lustratio Cap +1",
        --body="Horos Casaque +3",
        hands="Adhemar Wristbands +1",
        legs="Samnuha Tights",
        feet="Herculean Boots",
        ear1="Sherida Earring",
        --ear2="Mache Earring +1",
        ring1="Gere Ring",
        ring2="Epona's Ring",
        --back=gear.DNC_WS2_Cape,
    })

    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS, {
        ammo="Charis Feather",
        head="Adhemar Bonnet +1",
        neck="Fotia Gorget",
        body="Meg. Cuirie +2",
        hands="Mummu Wrists +2",
        legs="Samnuha Tights", --legs="Lustr. Subligar +1",
        feet="Mummu Gamashes +2",   
        ear1="Odr Earring",
        ear2="Sherida Earring",
        ring1="Ilabrat Ring",
        ring2="Mummu Ring", -- Regal Ring
        back=gear.evisCape,--back=gear.DNC_WS3_Cape,
        waist="Fotia Belt",
    })

    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.baseWS, {
        --ammo="Charis Feather",
        neck="Etoile Gorget +2",
        ear1="Sherida Earring",
        --waist="Kentarch Belt +1",
    })

    sets.precast.WS['Aeolian Edge'] = {
        --ammo="Ghastly Tathlum +1",
        head="Herculean Helm", --head=gear.Herc_MAB_head,
        body="Nyame Mail", --body="Samnuha Coat",
        hands="Nyame Gauntlets", --hands="Maxixi Bangles +3",
        legs="Nyame Flanchard", --legs="Horos Tights +3",
        feet="Nyame Sollerets", --feet=gear.Herc_WSD_feet,
        neck="Stoicheion Medal", --neck="Baetyl Pendant",
        ear1="Novio Earring", --ear1="Crematio Earring",
        ear2="Friomisi Earring",
        --ring1="Metamor. Ring +1",
        --ring2="Epaminondas's Ring",
        --back="Argocham. Mantle",
        --waist="Orpheus's Sash",
    }

    sets.precast.Skillchain = {
        --hands="Macu. Bangles +1",
    }

    -- Magic sets
    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.SpellInterrupt = {
        --ammo="Staunch Tathlum +1", --11
        --body=gear.Taeon_Phalanx_body, --10
        --hands="Rawhide Gloves", --15
        --legs=gear.Taeon_Phalanx_legs, --10
        --feet=gear.Taeon_Phalanx_feet, --10
        --neck="Loricate Torque +1", --5
        --ear1="Halasz Earring", --5
        --ear2="Magnetic Earring", --8
        --ring2="Evanescence Ring", --5
    }

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=(sets.baseIdle), engaged=(sets.baseMelee)},
		[1] = {name="DPS-Acc", idle=(sets.baseIdle), engaged=(sets.meleeAcc)},
		[2] = {name="DPS-Hybrid", idle=(sets.baseIdle), engaged=(sets.meleeHybrid)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Tauret-Gleti", set={main="Tauret", sub="Gleti's Knife"}},
        [1] = {name="LowDmg", set={main="Qutrub Knife", sub="Gleti's Knife"}},        
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

    stepMode = {
        ["index"] = 0,
        [0] = {step="Box Step", command="/boxstep", msg="Sluggish Daze: DEF down", color="\\cs(240,128,128)"}, -- DPS Color (Coral)
        [1] = {step="Quickstep", command="/quickstep", msg="Lethargic Daze: EVA down", color="\\cs(135,206,250)"}, -- Tank Color
        [2] = {step="Stutter Step", command="/stutterstep", msg="Weakened Daze: mEVA down", color="\\cs(240,230,140)"}, -- Utility Color
        [3] = {step="Feather Step", command="/featherstep", msg="Bewildered Daze: Crit EVA down", color="\\cs(255,165,0)"}, -- DPS Color (Orange)        
    }

    flourish1Mode = {
        ["index"] = 0,
        [0] = {flourish="Animated Flourish", command="/animatedflourish", msg="(Group 1: FM 1-2) Provoke", color="\\cs(135,206,250)"}, -- Tank Color
        [1] = {flourish="Desperate Flourish", command="/desperateflourish", msg="(Group 1: FM 1) Gravity", color="\\cs(240,230,140)"}, -- Utility Color
        [2] = {flourish="Violent Flourish", command="/violentflourish", msg="(Group 1: FM 1) Stun", color="\\cs(240,230,140)"}, -- Utility Color
    }

    flourish2Mode = {
        ["index"] = 0,
        [0] = {flourish="Reverse Flourish", command="/reverseflourish", msg="(Group 2: FM 1-5) Convert FM to TP", color="\\cs(240,128,128)"}, -- DPS Color (Coral)
        [1] = {flourish="Building Flourish", command="/buildingflourish", msg="(Group 2: FM 1-3) WSD Boost", color="\\cs(255,165,0)"}, -- DPS Color (Orange)
        [2] = {flourish="Wild Flourish", command="/wildflourish", msg="(Group 2: FM 2) Ready for SC", color="\\cs(255,165,0)"}, -- DPS Color (Orange)      
    }

    flourish3Mode = {
        ["index"] = 0,
        [0] = {flourish="Climactic Flourish", command="/climacticflourish", msg="(Group 3: FM 1-5) Critical Hits", color="\\cs(240,128,128)"}, -- DPS Color (Coral),   
        [1] = {flourish="Striking Flourish", command="/strikingflourish", msg="(Group3: FM 1-3) Double Attack", color="\\cs(255,165,0)"}, -- DPS Color (Orange)
        [2] = {flourish="Ternary Flourish", command="/ternaryflourish", msg="(Group 3: FM 2) Triple Attack", color="\\cs(255,165,0)"}, -- DPS Color (Orange)    
    }

    sambaMode = {
        ["index"] = 0,
        [0] = {samba="Haste Samba", command="/hastesamba", msg="Haste Samba: JA Haste", color="\\cs(240,128,128)"}, -- DPS Color (Coral)     
        [1] = {samba="Drain Samba III", command="/drainsamba3", msg="Drain Samba: HP Drain", color="\\cs(135,206,250)"}, -- Tank Color
        [2] = {samba="Aspir Samba II", command="/aspirsamba2", msg="Aspir Samba: MP Drain", color="\\cs(240,230,140)"}, -- Utility Color    
    }

    danceMode = {
        ["index"] = 0,
        [0] = {dance="Saber Dance", command="/saberdance", msg="Saber Dance: Double Attack (no Waltz)", color="\\cs(240,128,128)"}, -- DPS Color (Coral)   
        [1] = {dance="Fan Dance", command="/fandance", msg="Fan Dance: -PDT, +Enmity (no Samba)", color="\\cs(135,206,250)"}, -- Tank Color
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
	-- Setup my binds
    send_command('bind @5 gs c cycleStep')
    send_command('bind @6 gs c cycleFlourish1')
    send_command('bind @7 gs c cycleFlourish2')
    send_command('bind @8 gs c cycleFlourish3')
    send_command('bind @9 gs c cycleSamba')
    send_command('bind @0 gs c cycleDance')

	-- Set default macro book / page
    set_macro_page(1, 5)
	
	-- Load addons

	-- Set style lock
	windower.send_command:schedule(4, 'input /lockstyleset 9')	
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)	
	-- Utsusemi helper already in sharedFunctions
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end
    end
    if spell.type=='Waltz' and spell.english:startswith('Curing') and spell.target.type == 'SELF' then
        equip(sets.precast.WaltzSelf)
    end
end

function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type == 'Step' then
        local abilRecast = windower.ffxi.get_ability_recasts()
        local prestoRecast = abilRecast[236]

        if prestoRecast == 0 then
            cast_delay(1.1)
            send_command('input /ja "Presto" <me>')
        end
    end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)

end



-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
	if buff == "Doom" then
		if active then
			send_command('input /p "Doomed, pls halp!')
			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
			disable('ring1','waist')
		else
			send_command('input /p "I am saved! ...or Doom killed me?')
			enable('ring1','waist')
			evalState_equipGear()
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)	
	--[[ Spike health for Omen healing objective ]]--
	if cmdParams[1] == 'spikehealth' then
		equip(sets.naked)
	end

    --[[ Cycle different Dancer ability groups ]]--
    if cmdParams[1] == 'cycleStep' then
        stepMode.index = stepMode.index + 1
        if stepMode.index > #stepMode then
            stepMode.index = 0
        end
        windower.add_to_chat(122,'[Step: '..stepMode[stepMode.index].step..' -- '..stepMode[stepMode.index].msg..']')
    end
    if cmdParams[1] == 'useStep' then
        windower.send_command(stepMode[stepMode.index].command)
    end

    if cmdParams[1] == 'cycleFlourish1' then
        flourish1Mode.index = flourish1Mode.index + 1
        if flourish1Mode.index > #flourish1Mode then
            flourish1Mode.index = 0
        end
        windower.add_to_chat(122,'[Flourish 1: '..flourish1Mode[flourish1Mode.index].flourish..' -- '..flourish1Mode[flourish1Mode.index].msg..']')
    end
    if cmdParams[1] == 'useFlourish1' then
        windower.send_command(flourish1Mode[flourish1Mode.index].command)
    end

    if cmdParams[1] == 'cycleFlourish2' then
        flourish2Mode.index = flourish2Mode.index + 1
        if flourish2Mode.index > #flourish2Mode then
            flourish2Mode.index = 0
        end
        windower.add_to_chat(122,'[Flourish 2: '..flourish2Mode[flourish2Mode.index].flourish..' -- '..flourish2Mode[flourish2Mode.index].msg..']')
    end
    if cmdParams[1] == 'useFlourish2' then
        windower.send_command(flourish2Mode[flourish2Mode.index].command)
    end

    if cmdParams[1] == 'cycleFlourish3' then
        flourish3Mode.index = flourish3Mode.index + 1
        if flourish3Mode.index > #flourish3Mode then
            flourish3Mode.index = 0
        end
        windower.add_to_chat(122,'[Flourish 3: '..flourish3Mode[flourish3Mode.index].flourish..' -- '..flourish3Mode[flourish3Mode.index].msg..']')
    end
    if cmdParams[1] == 'useFlourish3' then
        windower.send_command(flourish3Mode[flourish3Mode.index].command)
    end

    if cmdParams[1] == 'cycleSamba' then
        sambaMode.index = sambaMode.index + 1
        if sambaMode.index > #sambaMode then
            sambaMode.index = 0
        end
        windower.add_to_chat(122,'[Samba: '..sambaMode[sambaMode.index].samba..' -- '..sambaMode[sambaMode.index].msg..']')
    end
    if cmdParams[1] == 'useSamba' then
        windower.send_command(sambaMode[sambaMode.index].command)
    end

    if cmdParams[1] == 'cycleDance' then
        danceMode.index = danceMode.index + 1
        if danceMode.index > #danceMode then
            danceMode.index = 0
        end
        windower.add_to_chat(122,'[Dance: '..danceMode[danceMode.index].dance..' -- '..danceMode[danceMode.index].msg..']')
    end
    if cmdParams[1] == 'useDance' then
        windower.send_command(danceMode[danceMode.index].command)
    end

    modeHud('update')
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
    hudText:append(white..'Step[5]: '..stepMode[stepMode.index].color..stepMode[stepMode.index].step..white)
    hudText:append(white..'Flourishes[6,7,8]: '..'1: '..flourish1Mode[flourish1Mode.index].color..flourish1Mode[flourish1Mode.index].flourish..white..' | 2: '..flourish2Mode[flourish2Mode.index].color..flourish2Mode[flourish2Mode.index].flourish..white.. ' | 3: '..flourish3Mode[flourish3Mode.index].color..flourish3Mode[flourish3Mode.index].flourish..white)
    hudText:append(white..'Samba[9]: '..sambaMode[sambaMode.index].color..sambaMode[sambaMode.index].samba..white)
    hudText:append(white..'Dance[0]: '..danceMode[danceMode.index].color..danceMode[danceMode.index].dance..white)
	return hudText
end

function currentFM()
    if buffactive["Finishing Move 1"] then
        return 1
    elseif buffactive["Finishing Move 2"] then
        return 2
    elseif buffactive["Finishing Move 3"] then
        return 3
    elseif buffactive["Finishing Move 4"] then
        return 4
    elseif buffactive["Finishing Move 5"] then
        return 5
    elseif buffactive['Finishing Move (6+)'] then 
        return 6
    else
        return 0
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()

    local abilRecast = windower.ffxi.get_ability_recasts()
    local stepRecast = abilRecast[220]
    local flourish1Recast = abilRecast[221]  
    local flourish2Recast = abilRecast[222]  
    local flourish3Recast = abilRecast[226]  
    local prestoRecast = abilRecast[236]
    local tranceRecast = abilRecast[0]
    local grandPasRecast = abilRecast[254]
    local fm = currentFM()
    local me = windower.ffxi.get_player()    
    
    -- Autobuff (Saber Dance, Samba, Presto, Step, Flourish)
    if (auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
        local enemy = windower.ffxi.get_mob_by_target('t')
        
        -- Use currently selected Dance
        if not buffactive['Saber Dance'] and not buffactive['Fan Dance'] then
            add_to_chat(122, '['..danceMode[danceMode.index].dance..']')
            send_command(danceMode[danceMode.index].command)
            return
        end
                
        -- Use currently selected Samba (if Fan Dance isn't in effect)
        if (((player.tp >= 350 and player.tp < 1000) or player.tp>=1350) and not buffactive['Haste Samba'] and not buffactive['Fan Dance']) then                
            add_to_chat(122, '['..sambaMode[sambaMode.index].samba..']')
            send_command(sambaMode[sambaMode.index].command)
            return
        end

        -- Auto Presto when mob has high HP
        if (enemy.hpp >= 85 and prestoRecast == 0) then
            add_to_chat(122, '[Presto]')
            send_command('/presto')
            return
        end

        -- Auto Step when mob has high HP OR just use it if Presto is on
        if (((player.tp >= 100 and player.tp < 1000) or player.tp>=1100) and (enemy.hpp >= 80 or buffactive['Presto']) and stepRecast == 0) then
            add_to_chat(122, '['..stepMode[stepMode.index].step..']')
            send_command(stepMode[stepMode.index].command)
            return
        end

        -- Auto Flourish #2 (Offensive)
        if (currentFM() > 2 and flourish2Recast == 0 and player.tp < 1000) then
            add_to_chat(122, '['..flourish2Mode[flourish2Mode.index].flourish..']')
            send_command(flourish2Mode[flourish2Mode.index].command)
            return
        end     
        
        -- Auto Flourish #3 (when Flourish 2 isn't near ready)
        if (currentFM() > 2 and flourish2Recast >= 10 and flourish3Recast == 0) then
            add_to_chat(122, '['..flourish3Mode[flourish3Mode.index].flourish..']')
            send_command(flourish3Mode[flourish3Mode.index].command)
            return
        end     
    end

    -- Autofite (Cure & 1-hr)
    if (auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
        -- Auto Cure (if Saber Dance isn't in effect)
        if (player.tp >= 200 and curingWaltzRecast == 0 and not buffactive['Saber Dance']) then
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
        
        -- Auto 1-hr
        if tranceRecast == 0 then
            add_to_chat(122, '[~ Trance ~]')
            send_command('/trance')
            return
        end
        if grandPasRecast == 0 then
            add_to_chat(122, '[~ Grand Pas ~]')
            send_command('/grandpas')
            return
        end

        --[[
        if not buffactive['Food'] then
            send_command('input /item "Grape Daifuku" <me>')
            return
        end]]--
    end
end