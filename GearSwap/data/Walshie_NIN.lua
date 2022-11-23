include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

function init_gear_sets()
    sets.baseMelee = {
		ammo="Happo Shuriken",
		head="Adhemar Bonnet +1",
		neck="Clotharius Torque",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Epona's Ring",
		back="Atheling Mantle",
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet="Herculean Boots",		
	}

    sets.baseWS = {
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Epona's Ring",
		back="Atheling Mantle",
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Herculean Boots",		
	}

    sets.baseIdle = {
		ammo="Happo Shuriken",
		head="Adhemar Bonnet +1",
		neck="Clotharius Torque",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Epona's Ring",
		back="Atheling Mantle",
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet="Herculean Boots",	
	}	

	sets.baseMagic = {

	}
	
	sets.baseTank = set_combine(sets.baseMelee, {
		head="Malignance Chapeau",
		left_ear="Eabani Earring",
		left_ring="Defending Ring",
	})

    sets.treasureHunter = {
		head='Wh. Rarab Cap +1',
		waist = "Chaac Belt",
		ammo = "Perfect Lucky Egg",
	}

	sets.meleeAccuracy = {
	}
    
    sets.moveSpeed = {}
    sets.DayMovement = {}
    sets.NightMovement = {}

    sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}
    sets.precast.JA['Provoke'] = sets.treasureHunter

    sets.precast.Waltz = {
		head="Mummu Bonnet +2", 
		body="Mummu Jacket +2", 
		hands="Mummu Wrists +2", 
		legs="Mummu  Kecks +2", 
		feet="Mummu Gamashes +2", 
		ring1="Mummu Ring", 
	}
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast
	sets.precast.FC['Ninjutsu'] = set_combine(sets.baseMagic, {})
    sets.precast.FC['Utsusemi'] = {
		head="Mummu bonnet +2",		
		ring2="Stikini ring +1",
		neck="Magoraga Beads",
		ear2="Etiolation earring",		
		legs="Mummu kecks +2",	
	}    

	-- Midcast Sets
	sets.midcast['Ninjutsu'] = {
	}

	-- DT gear and utsusemi +2
    sets.midcast['Utsusemi'] = {
	}
	
	-- Weaponskill sets
	sets.precast.WS = set_combine(sets.baseWS, {})
	sets.precast.WS['Blade: Ku'] = set_combine(sets.baseWS, {})
	sets.precast.WS['Blade: Hi'] = set_combine(sets.baseWS, {
        head="Malignance Chapeau", 
        ear2="Suppanomimi"
    })
	sets.precast.WS['Blade: Shun'] = set_combine(sets.baseWS, {
        body="Adhemar Jacket +1", 
        legs="Samnuha Tights", 
        ear2="Moonshade Earring", 
        ear2="Epona's Ring"
    })
	sets.precast.WS['Evisceration'] = set_combine(sets.baseWS, {})
	sets.precast.WS['Exenterator'] = set_combine(sets.baseWS, {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {
		--head="Lanun Tricorne +3", --Upgrade to head="Herculean Helm",
		--hands="Chasseur's Gants +3",
		neck="Rep. Plat. Medal",
		--body="Laksamana's Frac +3",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ring1="Apate Ring",
		ring2="Epaminondas's Ring",
		--back=gear.sWSDCape,
		waist="Sailfi Belt +1", -- Fotia?
		legs="Herculean Trousers",
		--feet="Lanun Bottes +3",
	})
end

function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=sets.baseIdle, engaged=(sets.baseMelee)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Savage", set={main="Naegling", sub="Gleti's Knife"}},
		[1] = {name="Dagger", set={main="Qutrub Knife", sub="Gleti's Knife"}},
        [2] = {name="Sword", set={main="Nihility", sub="Extinction"}},
		[3] = {name="Great Sword", set={main="Lament", sub="Alber Strap"}},
		[4] = {name="Scythe", set={main="Hoe", sub="Alber Strap"}},
		[5] = {name="Polearm", set={main="Iapetus", sub="Alber Strap"}},
		[6] = {name="Katana", set={main="Kunai", sub="Kunai"}},
		[7] = {name="Great Katana", set={main="Kiikanemitsu",  sub="Alber Strap"}},
		[8] = {name="Club", set={main="Apkallu Scepter", sub="Chac-chacs"}},
		[9] = {name="Staff", set={main="Ranine Staff", sub="Alber Strap"}},
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
    set_macro_page(1,1)
    windower.send_command:schedule(4, 'input /lockstyleset 183')
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
	if weaponMode[weaponMode.index].name ~= "Free" and (player.equipment.main == "empty" or player.equipment.sub == "empty") then
		send_command('input //gs equip sets.weapons')
	end
end