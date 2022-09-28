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
    --gear.XYZCape = {name="", augments={''}}

    gear.strWSCape = { name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
    gear.meleeTPCape = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}}
    
    sets.baseMelee = {
        --ammo="Aurgelmir Orb +1",
        head="Adhemar Bonnet +1", --head="Plun. Bonnet +3",
        body="Adhemar Jacket +1",
        hands="Adhemar Wristbands +1", 
        legs="Meghanada Chausses +1", --legs="Samnuha Tights",
        feet="Herculean Boots",--feet="Plun. Poulaines +3",
        neck="Asn. Gorget +2",
        ear1="Sherida Earring",
        ear2="Odr Earring", --ear2="Brutal Earring",
        ring1="Apate Ring", --ring1="Gere Ring",
        ring2="Dhanurveda Ring", --ring2="Epona's Ring",
        back=gear.meleeTPCape,
        waist="Windbuffet Belt +1",
    }

    sets.meleeAcc = {
    }

    -- Random one-off sets or small sets
    sets.baseIdle = {
        feet="Jute Boots +1",
        head="Nyame Helm",
        body="Nyame Mail", --body="Samnuha Coat",
        hands="Nyame Gauntlets", --hands="Maxixi Bangles +3",
        legs="Nyame Flanchard", --legs="Horos Tights +3",
    }
    sets.moveSpeed = {feet="Jute Boots +1"}
    sets.wakeUp = {}
    sets.Obi = {} --{waist="Hachirin-no-Obi"}

    sets.TH = {head="Wh. Rarab Cap +1", hands="Plunderer's Armlets", feet="Skulker's Poulaines", }
   
    sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}

    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.baseWS = {
        --ammo="Seething Bomblet +1",
        --head="Meghanada Visor +2",
        --body="Ayanmo Corazza +2",
        --hands="Meghanada Gloves +2",
        legs="Meghanada Chausses +1",
        --feet="Meghanada Jambeaux +2",
        --neck="Fotia Gorget",
        --waist="Fotia Belt",
        --left_ear="Ishvara Earring",
        --right_ear="Moonshade Earring",
        --left_ring="Epona's Ring",
        --right_ring="Rajas Ring",
        --back=gear.DEXCape,
    }

    sets.precast.WS['Exenterator'] = set_combine(sets.baseWS, {
        --head="Plun. Bonnet +3",
        body="Adhemar Jacket +1",
        legs="Meg. Chausses +1",
        --feet="Meg. Jam. +2",
        --ear1="Sherida Earring",
        --ear2="Telos Earring",
        --ring2="Ilabrat Ring",
    })

    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS, {
        ammo="Yetshila +1",
        --head="Plun. Bonnet +3",
        --body="Pillager's Vest +3",
        --hands="Mummu Wrists +2",
        --legs="Zoar Subligar +1",
        --feet="Plun. Poulaines +3",
        --ear1="Sherida Earring",
        --ear2="Mache Earring +1",
        --ring1="Begrudging Ring",
        ring2="Mummu Ring",
        --back=gear.THF_WS2_Cape,
    })

    sets.precast.WS['Rudra\'s Storm'] = set_combine(sets.baseWS, {
        --ammo="Aurgelmir Orb +1",
        neck="Asn. Gorget +2",
        --ear1="Sherida Earring",
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
        hangs="Meghanada Gloves",
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
    sets.precast.JA['Accomplice'] = {} --{head="Skulker's Bonnet +1"}
    sets.precast.JA['Aura Steal'] = {} --{head="Plun. Bonnet +3"}
    sets.precast.JA['Collaborator'] = {} --set_combine(sets.TreasureHunter, {head="Skulker's Bonnet +1"})
    sets.precast.JA['Flee'] = {} --{feet="Pill. Poulaines +3"}
    sets.precast.JA['Hide'] = {} --{body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator'] = {} --set_combine(sets.TreasureHunter, {body="Skulker's Vest +1"})

    sets.precast.JA['Steal'] = {
        ammo="Barathrum",
        --head="Plun. Bonnet +3",
        --hands="Pillager's Armlets +1",
        --feet="Pill. Poulaines +3",
        }

    sets.precast.JA['Despoil'] = {} --{ammo="Barathrum", legs="Skulk. Culottes +1", feet="Skulk. Poulaines +1"}
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

    sets.midcast['Poisonga'] = sets.TH
    sets.midcast['Horde Lullaby'] = sets.TH
    sets.midcast['Horde Lullaby II'] = sets.TH

    -- Actions we want to use to tag TH.
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
		[1] = {name="DPS-Acc", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.meleeAcc)},
        [2] = {name="DPS-Hybrid", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.meleeAcc)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="TH", set={main="Shijo", sub="Sandung"}},
        -- Savage Blade Naegling & Magian
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

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	--modeHud('update')
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
    magicMaps = {}

end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	--Setup my binds
	--send_command('bind ^F11 gs c toggleAutoRune')

	--Set default macro book / page
    if player.sub_job == 'DNC' then
        set_macro_page(1, 2)
    end
	
	--Load job-specific addons
	windower.send_command('lua load thtracker')

    --windower.send_command:schedule(4, 'input /lockstyleset 181')	
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	--add_to_chat(001, '-- Spell: '..spell.english..' Type: '..spell.type..' --')
		
    -- Utsusemi helper
	if spell.english:contains('Utsusemi') then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            eventArgs.cancel = true
            add_to_chat(123, '**!! ' .. spell.english .. ' Canceled: [3+ IMAGES] !!**')
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
	
end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)	
	-- spike health for omen healing objective
	if cmdParams[1]:lower() == 'spikehealth' then
		equip(sets.naked)

	end
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
	-- job specific location override?
	modeHud_xPos = 550
	modeHud_yPos = 0

	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()
	local runeRecast = abilRecast[92]

	-- auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then

		-- Autofite only
		if auto.fite[auto.fite.index] == 'On' then

		end
	end
end