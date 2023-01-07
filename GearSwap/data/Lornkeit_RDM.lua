include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

function init_gear_sets()

    gear.strWSCape  =   {name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.tpCape     =   {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}  
    gear.nukeCape   =   {name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}

    sets.precast.FC = {
        -- RDM Base: 38%
        head="Atrophy Chapeau", -- 11%
        body="Vitiation Tabard +3", -- 12%
        hands="Jhakri Cuffs +2", -- 1%
        legs="Aya. Cosciales +2", -- 6%
        feet="Jhakri Pigaches +2", -- 1%
        neck="Incanter's Torque",
        waist="Witful Belt", -- 3%
        ear1="Malignance Earring", -- 4%
        ear2="Lethargy Earring", -- 7%
        ring1="Kishar Ring", -- 4%
        ring2="Lebeche Ring", -- Quick
        back="Perimede Cape", -- Quick
        ammo="Impatiens" -- Quick
        -- 87%, done
	}    
    sets.precast.FC['Stoneskin'] = set_combine(sets.precast.FC, {
        head="Umuthi Hat",
        hands="Carapacho Cuffs",
        legs="Querkening Brais",
        waist="Siegel Sash"
    })
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        head="Kaykaus Mitra +1", -- -4% FC from base
        legs="Kaykaus Tights +1", -- -6% FC from base
        feet="Kaykaus Boots +1", -- -1% FC from base
        -- -11% FC +21% Cure
    })

    sets.midcast['Enfeebling Magic'] = {
        -- Assuming INT-based
        head="Vitiation Chapeau +3",
        body="Atrophy Tabard", -- Upgrade to Lethargy (Empy) +3
        neck="Duelist's Torque +2",
        hands="Regal Cuffs", -- Upgrade to Lethargy (Empy) +3
        legs="Jhakri Slops +2", -- Upgrade to Lethargy (Empy) +3
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        ear1="Snotra Earring",
        ear2="Regal Earring",
        ammo="Regal Gem",
        back=gear.nukeCape,
        waist="Salire Belt" -- Upgrade to Acuity Belt +1
    }
    -- TODO: Separate out Enfeeb Potency vs Duration vs MACC

    sets.midcast['Healing Magic'] = {
        head="Kaykaus Mitra +1",
        body="Kaykaus Bliaut +1",
        hands="Kaykaus Cuffs +1",
        legs="Kaykaus Tights +1",
        feet="Kaykaus Boots +1",
        ammo="Pemphredo Tathlum", -- Conserve MP
        neck="Incanter's Torque",
        ear1="Regal Earring",
        ear2="Roundel Earring",
        ring1="Stikini Ring +1",
        ring2="Menelaus's Ring",
        back="Fi Follet Cape +1", -- Conserve MP
        waist="Austerity Belt", -- Conserve MP
    }

    sets.midcast['Elemental Magic'] = {
        -- Assuming MB
		main="Daybreak", -- Upgrade to Bunzi's Rod
		sub="Ammurapi Shield",
        range="Ullr", -- Switch to ammo="Pemphredo Tathlum" for full dmg
		head="Jhakri Coronal +2", -- Upgrade to Ea Hat +1
		body="Jhakri Robe +2", -- Upgrade to Ea Houppelande +1
		hands="Regal Cuffs",
		legs="Jhakri Slops +2", -- Lethargy (Empy) +3
		feet="Jhakri Pigaches +2", -- Upgrade to Bunzi's Sabots
		neck="Sibyl Scarf",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		ring1="Freke Ring",	
		ring2="Mujin Band",
		back=gear.nukeCape,
	}
    -- TODO: Separate high MACC vs low MACC needed
    -- TODO: Separate MB vs Free

    sets.midcast['Enhancing Magic'] = {
		head="Lethargy Chappel +1", 
        body="Lethargy Sayon +2", 
        hands="Atrophy Gloves +1", -- Upgrade to (AF) +3
        legs="Lethargy Fuseau +2", 
        feet="Lethargy Houseaux +2", -- Upgrade to (Empy) +3
        neck="Duelist's Torque +2",
        waist="Embla Sash",
        left_ear="Andoaa Earring",
        right_ear="Lethargy Earring",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        back="Ghostfyre Cape" -- Upgrade to +20% ENH Duration
	}
    sets.midcast['Refresh'] = set_combine(sets.baseEnhancing, {
        head="Amalric Coif +1", 
        body="Atrophy Tabard", 
        legs="Lethargy Fuseau +2",
        waist="Gishdubar Sash",
    })
    
    sets.midcast['Gain-STR'] = set_combine(sets.baseEnhancing, {hands="Vitiation Gloves +3"})
    sets.midcast['Gain-DEX'] = set_combine(sets.baseEnhancing, {hands="Vitiation Gloves +3"})
    sets.midcast['Gain-VIT'] = set_combine(sets.baseEnhancing, {hands="Vitiation Gloves +3"})
    sets.midcast['Gain-AGI'] = set_combine(sets.baseEnhancing, {hands="Vitiation Gloves +3"})
    sets.midcast['Gain-INT'] = set_combine(sets.baseEnhancing, {hands="Vitiation Gloves +3"})
    sets.midcast['Gain-MND'] = set_combine(sets.baseEnhancing, {hands="Vitiation Gloves +3"})
    sets.midcast['Gain-CHR'] = set_combine(sets.baseEnhancing, {hands="Vitiation Gloves +3"})
    sets.enspells = set_combine(sets.midcast['Enhancing Magic'], {
        right_ear = "Hollow Earring", 
        hands = "Ayanmo Manopolas +2",
        head = "Umuthi Hat"
    })        

    sets.baseMelee = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist="Windbuffet Belt +1",
        ear1="Eabani Earring", -- Upgrade to Dedition
        ear2="Sherida Earring",
        ring1="Petrov Ring",
        ring2="Ayanmo Ring", -- Upgrade to Ilabrat
        back=gear.tpCape,
    }

    sets.baseWS = {
        ammo="Oshasha's Treatise",
		head="Vitiation Chapeau +3", -- Upgrade to Viti (Relic) +3
		body="Vitiation Tabard +3", -- Upgrade to Viti (Relic) +3
		hands="Jhakri Cuffs +2", -- Upgrade to Atrophy (AF) +3
        legs="Jhakri Slops +2",		
		feet="Leth. Houseaux +2", -- Upgrade to (Empy) +3
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
		ear1="Regal Earring",
		ear2="Moonshade Earring",
		ring1="Rajas Ring", -- Upgrade to Sroda Ring
		ring2="Apate Ring", -- Upgrade to Epamin Ring
        back=gear.strWSCape,
    }
    sets.precast.WS = sets.baseWS

    sets.baseIdle = {
        ammo="Staunch Tathlum +1",
        head="Vitiation Chapeau +3",
        body="Jhakri Robe +2",
        hands="Malignance Gloves", -- Aug Chironic with Refresh +2
        legs="Lengo Pants", -- Aug Chironic with Refresh +2
        feet="Malignance Boots", -- Aug Chironic with Refresh +2
        neck="Sibyl Scarf",
        waist="Fucho-no-Obi",
        ear1="Malignance Earring",
        ear2="Etiolation Earring",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        back=gear.tpCape,
    }
    sets.moveSpeed = {legs="Carmine Cuisses +1"}
    sets.obi = {waist="Hachirin-no-obi"}
    sets.treasureHunter = set_combine(sets.baseMelee, {
        ammo="Perfect Lucky Egg",
        waist="Chaac Belt",
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
		[0] = {name="None", set={}},
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

end

function extendedModeHud(hudText)
	modeHud_xPos = 200
	modeHud_yPos = 0
	return hudText
end

function autoActions()
	local abil_recasts = windower.ffxi.get_ability_recasts()
    local convertRecast = abil_recasts[49]
    local me = windower.ffxi.get_player()

    -- If we need to be pulling, do it and avoid all this code
    if auto.fite[auto.fite.index] == 'On' and not me.status == 1 then
        return
    end

    if auto.fite[auto.fite.index] == 'On' then
        local enemy = windower.ffxi.get_mob_by_target('t') or nil
        if convertRecast == 0 and player.mpp < 25 and enemy and enemy.hpp < 98 then            
            if not buffactive['Stoneskin'] then
                send_command('input /stoneskin')
            else
                send_command('input /convert')
            end
            return
        end

        if not actionInProgress and not moving and player.tp >= 1000 then
            add_to_chat(122, '[Savage Blade]')
            send_command('/savageblade')
            return
        end
    end

    if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
        if not buffactive['Addendum: White'] and player.sub_job == 'SCH' then
            if buffactive['Light Arts'] then
                send_command('/addendumwhite')
                return
            else
                send_command('/lightarts')
                return
            end
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

function extendedJobPrecast(spell, action, spellMap, eventArgs)

end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
    if magicMaps.Enspells:contains(spell.english) then
		equip(sets.enspells)
	end
end

function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)

end

function extendedEvalState_equipGear()

end