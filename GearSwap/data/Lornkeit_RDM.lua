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
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist="Windbuffet Belt +1",
        left_ear="Eabani Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Rajas Ring",
    }
    sets.baseWS = {
        ammo="Oshasha's Treatise",
        head="Jhakri Coronal +2",
        body="Ayanmo Corazza +2",
        hands="Jhakri Cuffs +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Rep. Plat. Medal",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="Ayanmo Ring",
        right_ring="Apate Ring",
        back="Atheling Mantle"
    }
    sets.baseAFk = {
        ammo="Coiste Bodhar",
        head="Vitiation Chapeau",
        body="Jhakri Robe +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        waist="Windbuffet Belt +1",
        neck="Anu Torque",
        left_ear="Sherida Earring", 
        right_ear="Suppanomimi",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Atheling Mantle"
    }
    sets.basePrecast = {
        head="Atrophy Chapeau",
        body="Vitiation Tabard",
        hands="Jhakri Cuffs +2",
        legs="Aya. Cosciales +2",
        feet="Jhakri Pigaches +2",
        neck="Incanter's Torque",
        waist="Witful Belt",
        left_ear="Malignance Earring",
        right_ear="Lethargy Earring",
        ring1="Kishar Ring",
        ring2="Lebeche Ring",
        back="Perimede Cape"
	}
    
    sets.fullMAB = {
		main="Daybreak",
		sub="Culminus",
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Sibyl Scarf",
		left_ear="Malignance Earring",
		right_ear="Friomisi Earring",
		left_ring="Jhakri Ring",	
		right_ring="Shiva Ring +1",
		back="Aurist's Cape",
	}

    sets.baseEnhancing = {
		head="Befouled Crown",
        body="Vitiation Tabard",
        hands="Atrophy Gloves +1",
        legs="Carmine Cuisses +1",
        feet="Lethargy Houseaux +2",
        neck="Incanter's Torque",
        waist="Witful Belt",
        left_ear="Andoaa Earring",
        right_ear="Lethargy Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Fi Follet Cape"
	}

    sets.cureMagic = {
		-- main="Daybreak",
		-- sub="Culminus",
		-- range="Dunna",
		head="Atrophy Chapeau",
		body="Vitiation Tabard",
		hands="Regal CUffs",
		legs="Atrophy Tights",
		feet="Medium's Sabots",
		neck="Incanter's Torque",
		waist="Austerity Belt",
		left_ear="Loquacious Earring",
		right_ear="Malignance Earring",
		left_ring = "Lebeche Ring",
		right_ring = "Stikini Ring +1",
		back="Aurist's Cape",
	}
    sets.treasureHunter = set_combine(sets.baseMelee, {
        ammo="Perfect Lucky Egg", -- +1
        waist="Chaac Belt" -- +1
    })

    sets.enspells = set_combine(sets.baseEnhancing, {
            right_ear = "Hollow Earring", 
            hands = "Ayanmo Manopolas +2",
            head = "Umuthi Hat"
    })
    
    sets.baseIdle = {
        ammo="Staunch Tathlum +1",
        head="Vitiation Chapeau",
        body="Jhakri Robe +2",
        hands="Malignance Gloves",
        legs="Lengo Pants",
        feet="Malignance Boots",
        neck="Rep. Plat. Medal",
        waist="Fucho-no-Obi",
        left_ear="Malignance Earring",
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Shadow Mantle"
    }
    sets.moveSpeed = {legs="Carmine Cuisses +1"}
    sets.precast.FC = set_combine(sets.basePrecast, {})
    sets.precast.FC['Stoneskin'] = set_combine(sets.basePrecast, {
        head="Umuthi Hat",
        hands="Carapacho Cuffs",
        legs="Querkening Brais",
        waist="Siegel Sash"
    })

    sets.midcast = {}
    sets.midcast['Refresh'] = set_combine(sets.baseEnhancing, {legs="Lethargy Fuseau +2", waist="Gishdubar Sash", feet="Inspirited Boots",})
    sets.midcast['Enfeebling Magic'] = set_combine(sets.basePrecast, 
    {
        head="Vitiation Chapeau",
        body="Lethargy Sayon",
        neck="Duelist's Torque +1",
        hands="Regal Cuffs",
        legs="Jhakri Slops +2", 
        ring1="Kishar Ring",
        ring2="Stikini Ring +1",
        ammo="Regal Gem",
        back="Aurist's Cape",
        waist="Salire Belt"
    })
    sets.midcast['Enhancing Magic'] = sets.baseEnhancing
    sets.midcast['Elemental Magic'] = sets.fullMAB
    sets.midcast['Healing Magic'] = sets.cureMagic
    -- -- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.baseWS, sets.treasureHunter)
end

function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=sets.baseIdle, engaged=(sets.baseMelee)},
        [1] = {name="AFKExp", idle=sets.baseIdle, engaged=(sets.baseAFk)}
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
    windower.send_command:schedule(4, 'input /lockstyleset 187')
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
	local abil_recasts = windower.ffxi.get_ability_recasts()

    if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
        if abil_recasts[49] < 1 and player.mpp < 7 then
            send_command:schedule(0.5, 'input /ma "Utsusemi: Ni" <me>')
            send_command:schedule(4.5, 'input /ja "Convert" <me>')
        end
    end
end

function job_setup()
    magicMaps = {}
    magicMaps.Enspells = S{
        'Enstone', 
        'Enstone II', 
        'Enwater', 
        'Enwater II', 
        'Enaero', 
        'Enaero II', 
        'Enfire', 
        'Enfire II',
        'Enblizzard',
        'Enblizzard II',
        'Enthunder',
        'Enthunder II'
    }
end
function extendedJobMidcast(spell, action, spellMap, eventArgs)
    if magicMaps.Enspells:contains(spell.english) then
		equip(sets.enspells)
	end
end