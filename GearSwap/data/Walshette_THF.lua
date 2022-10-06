include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    include('Mote-TreasureHunter')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()

    gear.strWSCape = { name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
    gear.dexWSCape = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
    gear.meleeTPCape = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}}
    
    sets.baseMelee = {
        ammo="Yetshila +1",
        head="Adhemar Bonnet +1",
        body="Adhemar Jacket +1",
        hands="Adhemar Wristbands +1", 
        legs="Meghanada Chausses +2", --legs="Samnuha Tights",
        feet="Herculean Boots",
        neck="Asn. Gorget +2",
        ear1="Sherida Earring",
        ear2="Cessance Earring",
        ring1="Chirich Ring +1", --ring1="Gere Ring",
        ring2="Chirich Ring +1", --ring2="Epona's Ring",
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
    }

    sets.meleeAcc = {
        -- Move Chirich Rings here when other rings are in baseMelee
    }

    sets.meleeHybrid = {
        -- Malignance or certain maxed AF/Relic/Empy here
    }

    -- Random one-off sets or small sets
    sets.baseIdle = {
        feet="Jute Boots +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
    }
    sets.moveSpeed = {feet="Jute Boots +1"}
    sets.wakeUp = {}
    sets.Obi = {} --{waist="Hachirin-no-Obi"}

    sets.TH = {head="Wh. Rarab Cap +1", hands="Plunderer's Armlets", feet="Skulker's Poulaines +2", }
   
    sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}

    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.baseWS = {
        --ammo="Seething Bomblet +1",
        --head="Meghanada Visor +2",
        --body="Ayanmo Corazza +2",
        --hands="Meghanada Gloves +2",
        legs="Meghanada Chausses +2",
        --feet="Meghanada Jambeaux +2",
        --neck="Fotia Gorget",
        --waist="Fotia Belt",
        --left_ear="Ishvara Earring",
        --right_ear="Moonshade Earring",
        --left_ring="Epona's Ring",
        ring2="Rajas Ring",
        back=gear.dexWSCape,
    }

    sets.precast.WS['Exenterator'] = set_combine(sets.baseWS, {
        --head="Plun. Bonnet +3",
        body="Adhemar Jacket +1",
        legs="Meg. Chausses +2",
        --feet="Meg. Jam. +2",
        ear1="Sherida Earring",
        --ear2="Telos Earring",
        --ring2="Ilabrat Ring",
    })

    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS, {
        ammo="Yetshila +1",
        head="Adhemar Bonnet +1",
        body="Meg. Cuirie +2",
        hands="Mummu Wrists +2",
        legs="Meghanada Chausses +2",
        feet="Mummu Gamashes +2",
        ear1="Odr Earring",
        ear2="Mache Earring +1",
        ring1="Apate Ring", 
        ring2="Mummu Ring",
        back=gear.dexWSCape,
        waist="Shadow Belt",
    })

    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.baseWS, {
        --ammo="Aurgelmir Orb +1",
        neck="Asn. Gorget +2",
        ear1="Sherida Earring",
        --waist="Kentarch Belt +1",
    })

    sets.precast.WS['Mandalic Stab'] = sets.precast.WS["Rudra's Storm"]

    sets.precast.WS['Aeolian Edge'] = sets.TH
    --set_combine(sets.baseWS, {
        --ammo="Ghastly Tathlum +1",
        --head=gear.Herc_MAB_head,
        --body="Samnuha Coat",
        --hands="Leyline Gloves",
        --legs=gear.Herc_WSD_legs,
        --feet=gear.Herc_WSD_feet,
        --neck="Baetyl Pendant",
        --ear1="Crematio Earring",
        --ear2="Friomisi Earring",
        --ring1="Metamor. Ring +1",
        --ring2="Epaminondas's Ring",
        --back="Argocham. Mantle",
        --waist="Orpheus's Sash",
    --})

    sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {
        --ammo="Ghastly Tathlum +1",
        --head=gear.Herc_MAB_head,
        --body="Samnuha Coat",
        --hands="Leyline Gloves",
        hangs="Meghanada Gloves +1",
        --legs=gear.Herc_WSD_legs,
        --feet=gear.Herc_WSD_feet,
        --neck="Baetyl Pendant",
        --ear1="Crematio Earring",
        --ear2="Friomisi Earring",
        ring1="Apate Ring",
        ring2="Ifrit Ring +1",
        --ring2="Epaminondas's Ring",
        --back="Argocham. Mantle",
        --waist="Orpheus's Sash",
        waist="Sailfi Belt +1",
        back=gear.strWSCape,
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +1"} --{head="Skulker's Bonnet +1"}
    sets.precast.JA['Aura Steal'] = {} --{head="Plun. Bonnet +3"}
    sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +1"} --set_combine(sets.TreasureHunter, {head="Skulker's Bonnet +1"})
    sets.precast.JA['Flee'] = {} --{feet="Pill. Poulaines +3"}
    sets.precast.JA['Hide'] = {} --{body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator'] = {} --set_combine(sets.TreasureHunter, {body="Skulker's Vest +1"})

    sets.precast.JA['Steal'] = {
        ammo="Barathrum",
        --head="Plun. Bonnet +3",
        --hands="Pillager's Armlets +1",
        --feet="Pill. Poulaines +3",
        }

    sets.precast.JA['Despoil'] = {ammo="Barathrum", feet="Skulker's Poulaines +2"} --{ legs="Skulk. Culottes +1", }
    sets.precast.JA['Perfect Dodge'] = {} --{hands="Plun. Armlets +3"}
    sets.precast.JA['Feint'] = {} --{legs="Plun. Culottes +3"}
    --sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    --sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']    

    sets.precast.Waltz = {
        --ammo="Yamarang",
        --body="Passion Jacket",
        --legs="Dashing Subligar",
        --ring1="Asklepian Ring",
        --waist="Gishdubar Sash",
    }

    sets.precast.FC = {
        --ammo="Sapience Orb",
        --head=gear.Herc_MAB_head,
        --body=gear.Taeon_FC_body,
        --hands="Leyline Gloves",
        --legs="Rawhide Trousers",
        --feet=gear.Herc_MAB_feet,
        --neck="Orunmila's Torque",
        --ear1="Loquacious Earring",
        --ear2="Enchntr. Earring +1",
        --ring2="Weather. Ring +1",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        --body="Passion Jacket",
        --ring1="Lebeche Ring",
    })


    -- Actions we want to use to tag TH.
    sets.midcast['Poisonga'] = sets.TH
    sets.midcast['Horde Lullaby'] = sets.TH
    sets.midcast['Horde Lullaby II'] = sets.TH    
    sets.precast.Step = sets.TH
    sets.precast.Flourish1 = sets.TH
    sets.precast.JA.Provoke = sets.TH
    sets.midcast.SongEnfeeble = sets.TH

end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS-Base", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
		[1] = {name="DPS-Acc", idle=(set_combine(sets.meleeAcc, sets.baseIdle)), engaged=(sets.meleeAcc)},
        [2] = {name="DPS-Hybrid", idle=(set_combine(sets.meleeHybrid, sets.baseIdle)), engaged=(sets.meleeHybrid)},
        [3] = {name="Full-TH", idle=(set_combine(sets.TH, sets.baseIdle)), engaged=(sets.TH)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Tauret-Shijo", set={main="Tauret", sub="Shijo"}},
        [1] = {name="Naegling-Magian", set={main="Naegling", sub="Fusetto +2"}},
        [2] = {name="TH", set={main="Tauret", sub="Sandung"}},
        [3] = {name="Lowdmg", set={main="Qutrub Knife", sub=""}},
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
        ["thief"] = {
            ["index"] = 0,
			[0] = "Off",
			[1] = "On",
        }
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
	--Setup my binds
	send_command('bind @q gs c cycleThief')

	--Set default macro book / page
    if player.sub_job == 'DNC' then
        set_macro_page(1, 2)
    end
	
	--Load job-specific addons
	windower.send_command('lua load thtracker')

    --windower.send_command:schedule(4, 'input /lockstyleset 181')	
end

function extendedUserUnload()
    send_command('unbind @q')
    send_command('lua u thtracker')
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)

end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)	
    --[[ Cycle Thief Mode ]]--
    if cmdParams[1] == 'cycleThief' then
        auto.thief.index = auto.thief.index + 1
        if auto.thief.index > #auto.thief then
            auto.thief.index = 0
        end
        windower.add_to_chat(122,'[Thief Mode: '..auto.thief[auto.thief.index]..']')
        modeHud('update')
    end
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
	-- job specific location override?
	modeHud_xPos = 0
	modeHud_yPos = 0

    hudText:append(white..'Thief[Q]: '..getBoolColor(auto.thief[auto.thief.index]))

	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()
    local bullyRecast = abilRecast[240]
    local stealRecast = abilRecast[60]
    local sneakAttackRecast = abilRecast[64]
    local trickAttackRecast = abilRecast[66]
    local mugRecast = abilRecast[65]
    local assassinsChargeRecast = abilRecast[67]
    local feintRecast = abilRecast[68]
    local despoilRecast = abilRecast[61]
    local conspiratorRecast = abilRecast[40]
    -- PD [0] and Larceny [254] not included

    local me = windower.ffxi.get_player()    

	-- Auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

    if auto.thief[auto.thief.index] == 'On' and not actionInProgress and not moving and me.status == 1 then
        if stealRecast == 0 then
            send_command('/steal')
            add_to_chat(122, '[Steal]')
            return
        end

        if mugRecast == 0 then
            send_command('/mug')
            add_to_chat(122, '[Mug]')
            return
        end

        if despoilRecast == 0 then
            send_command('/despoil')
            add_to_chat(122, '[Despoil]')
            return
        end
    end

	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving and me.status == 1  then

        -- Feint
        if feintRecast == 0 then
            send_command('/feint')
            add_to_chat(122, '[Feint]')
            return
        end

        -- Conspirator
        if conspiratorRecast == 0 then
            send_command('/conspirator')
            add_to_chat(122, '[Conspirator]')
            return
        end

        -- Assassin's Charge
        if assassinsChargeRecast == 0 then
            send_command('/assassinscharge')
            add_to_chat(122, '[Assassin\'s Charge]')
            return
        end

        --[[ Steal, Despoil, Mug ]]--

		-- Autofite only
		if auto.fite[auto.fite.index] == 'On' then
            -- Bully -> Sneak Attack
            if player.tp >= 1000 and bullyRecast == 0 and sneakAttackRecast == 0 then
                send_command('/bully')
                send_command:schedule(1.0, '/sneakattack')
                add_to_chat(122, '[Bully -> Sneak Attack]')
                return
            end
            -- Trick Attack
            if trickAttackRecast == 0 then
                send_command('/trickattack')
                add_to_chat(122, '[Trick Attack]')
                return
            end
		end
	end
end