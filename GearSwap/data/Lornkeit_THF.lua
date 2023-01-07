include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

function init_gear_sets()
    gear.meleeHercBoots = {name="Herculean Boots", augments={'Accuracy+19 Attack+19'}}

    sets.baseMelee = {
        ammo="Coiste Bodhar",
        head="Adhemar Bonnet +1",
        body="Adhemar Jacket +1",
        hands="Adhemar Wristbands +1",
        legs="Samnuha Tights",
        feet=gear.meleeHercBoots,
        neck="Anu Torque",
        waist="Windbuffet Belt +1",
        left_ear="Sherida Earring",
        right_ear="Skulker's Earring",
        left_ring="Gere Ring",
        right_ring="Moonlight Ring",
        back="Toutatis's Cape"
    }
    sets.baseWS = {
        ammo="Seething Bomblet +1",
        head="Adhemar Bonnet +1",
        body="Adhemar Jacket +1",
        hands="Meghanada Gloves +2",
        legs="Meghanada Chausses +2",
        feet="Meghanada Jambeaux +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear="Moonshade Earring",
        left_ring="Gere Ring",
        right_ring="Rajas Ring",
        back="Toutatis's Cape"
    }
    sets.baseTank = {
        ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        waist="Windbuffet Belt +1",
        neck="Loricate Torque",
        left_ear="Sherida Earring", 
        right_ear="Skulker's Earring",
        left_ring="Defending Ring",
        right_ring="Moonlight Ring"
    }
    sets.baseAFk = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        waist="Windbuffet Belt +1",
        neck="Anu Torque",
        left_ear="Sherida Earring", 
        right_ear="Skulker's Earring",
        left_ring="Gere Ring",
        right_ring="Moonlight Ring"
    }
    sets.meleeAcc = {
        ammo="Cath Palug Stone",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist="Kentarch Belt",
        left_ear="Sherida Earring",
        right_ear="Skulker's Earring",
        left_ring="Gere Ring",
        right_ring="Moonlight Ring",
        back="Toutatis's Cape"
    }
    -- base 3 + 8
    sets.treasureHunter = set_combine(sets.baseMelee, {
        ammo="Perfect Lucky Egg", -- +1
        hands="Plunderer's Armlets +1", -- +3
        feet="Skulker's Poulaines +1", -- +3
        waist="Chaac Belt" -- +1
    })
    
    sets.baseIdle = set_combine(sets.baseTank)
    sets.moveSpeed = {feet="Jute Boots +1"}
    sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}

    -- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.baseWS, sets.treasureHunter)
end

function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=sets.baseIdle, engaged=(sets.baseMelee)},
		[1] = {name="Treasure Hunter", idle=sets.baseIdle, engaged=(sets.treasureHunter)},
        [2] = {name="IWannaLive", idle=sets.baseIdle, engaged=(sets.baseTank)},
        -- [3] = {name="AfkExp", idle=sets.baseIdle, engaged=(sets.baseAFk)}
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Nothing", set={}},
		[1] = {name="Who cares", set={}},
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

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
end

function extendedUserSetup()
    set_macro_page(1,4)
    windower.send_command:schedule(4, 'input /lockstyleset 185')
end

function job_buff_change(buff, active)
	if buff == "Doom" then
		if active then
			-- send_command('input /p "Doomed, pls halp!')
			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
			disable('ring1','waist')
		else
			-- send_command('input /p "I am saved! ...or Doom killed me?')
			enable('ring1','waist')
			evalState_equipGear()
		end
	end
end

function extendedModeHud(hudText)
	modeHud_xPos = 550
	modeHud_yPos = 0
	return hudText
end

function autoActions()
	-- auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end
end

function job_setup()

end

function extendedJobPrecast(spell, action, spellMap, eventArgs)

end

function extendedJobMidcast(spell, action, spellMap, eventArgs)

end

function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)

end

function extendedEvalState_equipGear()

end