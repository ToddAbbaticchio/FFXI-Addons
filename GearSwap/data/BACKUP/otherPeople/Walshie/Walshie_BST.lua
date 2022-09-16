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
    -- Define augmented gear variables (these only need to be just specific enough to narrow it down to 1)
	gear.strWsCape = {name="Artio's Mantle", augments={'STR + 20'}}
    --gear.dexWsCape = {name="Artio's Mantle", augments={'DEX + 20'}}
	--gear.tpCape = {name="Artio's Mantle", augments={'DEX + 20', 'SOMETHING ELSE'}}
	--gear.petCape = {name="Artio's Mantle", augments={'WHO KNOWS WHAT GOES HERE'}}

	-- Base sets (typically modified with set_combine() calls)
	sets.baseTP = {
        ammo = "Voluspa Tathlum",
        head = "Gleti's Mask",
        neck = "Shulmanu Collar",
        ear1 = "Eabani Earring",
        ear2 = "Sherida Earring",
        body = "Gleti's Cuirass",
        hands = "Gleti's Gauntlets",
        ring1 = "Epona's Ring",
        ring2 = "Rajas Ring",
        back = "Atheling Mantle",
        waist = "Sailfi Belt +1",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots"
	}

	sets.precast.WS = {
        ammo = "Voluspa Tathlum",
        head = "Gleti's Mask",
        neck = "Fotia Gorget",
        ear1 = "Brutal Earring",
        ear2 = "Sherida Earring",
        body = "Gleti's Cuirass",
        hands = "Meg. Gloves +2",
        ring1 = "Epona's Ring",
        ring2 = "Rajas Ring",
        back = gear.strWsCape,
        waist = "Fotia Belt",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots"
    }

	sets.baseTank = {
	}

	sets.baseIdle = {
		head = "Gleti's Mask",
        body = "Gleti's Cuirass",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        hands = "Gleti's Gauntlets",
        neck = "Wiglen Gorget",
        ring1 = "Sheltered Ring",
        ring2 = "Paguroidea Ring",
        back = "Shadow Mantle"
	}

	sets.moveSpeed = {} --{feet="Skadi's Jambeaux"}
	
	-- JA Sets
    sets.precast.JA['Killer Instinct'] = {} -- {head="Ankusa Helm +1"}
    sets.precast.JA['Bestial Loyalty'] = {hands = "Ankusa Gloves"}
    sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
    sets.precast.JA['Familiar'] = {} -- {legs="Ankusa Trousers"}		
    sets.precast.JA['Tame'] = {} -- {head="Totemic Helm +1",}		
    sets.precast.JA['Spur'] = {feet = "Nukumi Ocreae"}
	sets.precast.JA['Reward'] = {
        ammo = "Pet Food Theta",
        head = "Khimaira Bonnet",
        ear2 = "Communion Earring",
        body = "Monster Jackcoat",
        hands = "Ogre Gloves",
        ring1 = "Solemn Ring",
        ring2 = "Communion Ring",
        legs = "Totemic Trousers",
        feet = "Ankusa Gaiters"
	}
	
	-- WS Sets
	sets.precast.WS['Decimation'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {
		ring1="Illabrat Ring", 
		back=gear.dexWSCape
	})
    sets.precast.WS['Primal Rend'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS, {})
	
	-- Pet Sets
	sets.petWS = {}

	sets.petWS.Phys = {
		ammo = "Voluspa Tathlum",
        head = "Nukumi Cabasset",
        neck = "Shulmanu Collar",
		ear1 = "Hija Earring",
        hands = "Nukumi Manoplas",
        legs = "Totemic Trousers"
	}
    sets.petWS.Mag = {
		ammo = "Voluspa Tathlum",
        head = "Nukumi Cabasset",
        neck = "Shulmanu Collar",
		ear1 = "Hija Earring",
        hands = "Nukumi Manoplas",
        legs = "Totemic Trousers"
	}
    sets.petWS.Multi = {
		ammo = "Voluspa Tathlum",
        head = "Nukumi Cabasset",
        neck = "Shulmanu Collar",
		ear1 = "Hija Earring",
        hands = "Nukumi Manoplas",
        legs = "Totemic Trousers"
	}

	sets.PetDT = {
        hands = "Gleti's Gauntlets"
    }
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	--TODO: replace these with the modes you want. Give name, set desired idle/engaged sets when in that mode.
	gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=set_combine(sets.baseTP, sets.baseIdle), engaged=sets.baseTP},
		[1] = {name="DPS-HighAcc", idle=set_combine(sets.baseTP, sets.baseIdle), engaged=sets.baseTP},
		[2] = {name="DPS-MaxBuff", idle=set_combine(sets.baseTP, sets.baseIdle), engaged=sets.baseTP},
		[3] = {name="PetDPS", idle=set_combine(sets.PetDT, sets.baseIdle), engaged=sets.PetDT},
		[4] = {name="Tank", idle=set_combine(sets.baseTank, sets.baseIdle), engaged=sets.baseTank},
	}
	
	--Setup weaponMode
	--TODO: replace these with the weapon modes you want.
	weaponMode = {
		["index"] = 0,
		[0] = {name="Kaja", set={main="Kaja Axe", sub="Guttler"}},
		[1] = {name="Guttler", set={main="Guttler", sub="Kaja Axe"}},
		[2] = {name="SW-Kaja", set={main="Kaja Axe", sub="Kaidate"}},
		[3] = {name="SW-Guttler", set={main="Guttler", sub="Kaidate"}},
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

	-- Example: pet[pet.index].abilities['ST1'].cost
	petTable = {
		["index"] = 0,
		[0] = {
			["type"] = "Lizard",
			["broth"] = "Livid Broth",
			["HQ"] = {}, -- Has no HQ version
			["NQ"] = { name="WarlikePatrick", jug="Livid Broth"},
			["abilities"] = {
				[1] = {name="Tail Blow", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Blockhead", cost=1, command="/bstpet 3 <me>", type="Phys"},
				[3] = {name="Fireball", cost=1, command="/bstpet 2 <me>", type="Mag"},
				[4] = {name="Infrasonics", cost=2, command="/bstpet 5 <me>", type="Mag"},
				[5] = {name="Secretion", cost=1, command="/bstpet 6 <me>", type="Mag"},
			},
		},
		[1] = {
			["type"] = "Tiger",
			["HQ"] = {}, -- Has no HQ Version
			["NQ"] = {name="BlackbeardRandy", jug="Meaty Broth"},
			["abilities"] = {
				[1] = {name="Razor Fang", cost=1, command="/bstpet 2 <me>", type="Phys"},
				[2] = {name="Claw Cyclone", cost=1, command="/bstpet 2 <me>", type="Mag"},
				[3] = {name="Crossthrash", cost=2, command="/bstpet 5 <me>", type="Phys"},
				[4] = {name="Roar", cost=2, command="/bstpet 1 <me>", type="Mag"},
				[5] = {name="Predatory Glare", cost=2, command="/bstpet 5 <me>", type="Mag"}
			},
		},
		[2] = {
			["type"] = "Chapuli",
			["HQ"] = {name="BouncingBertha", jug="Spicy Broth"},
			["NQ"] = {name="ScissorlegXerin", jug="Bubbly Broth"},
			["abilities"] = {
				[1] = {name="Sensilla Blades", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Tegmina Buffet", cost=2, command="/bstpet 2 <me>", type="Phys"},
			},
		},
		[3] = {
			["type"] = "Rabbit",
			["HQ"] = {name="PonderingPeter", jug="Viscous Broth"},
			["NQ"] = {name="DroopyDortwin", jug="Swirling Broth"},
			["abilities"] = {
				[1] = {name="Foot Kick", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Whirl Claws", cost=1, command="/bstpet 3 <me>", type="Phys"},
				[3] = {name="Wild Carrot", cost=2, command="/bstpet 4 <me>", type="Phys"},
				[4] = {name="Dust Cloud", cost=1, command="/bstpet 2 <me>", type="Phys"}
			},
		},
		[4] = {
			["type"] = "Sheep",
			["HQ"] = {}, -- Has no HQ Version
			["NQ"] = {name="RhymingShizuna", jug="Lyrical Broth"},
			["abilities"] = {
				[1] = {name="Lamb Chop", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Sheep Charge", cost=1, command="/bstpet 3 <me>", type="Phys"},
				[3] = {name="Rage", cost=2, command="/bstpet 2 <me>", type="Phys"},
				[4] = {name="Sheep Song", cost=2, command="/bstpet 4 <me>", type="Mag"}
			},
		},
		[5] = {
			["type"] = "Slug",
			["HQ"] = {}, -- Has no HQ Version
			["NQ"] = {name="GenerousArthur", jug="Dire Broth"},
			["abilities"] = {
				[1] = {name="Corrosive Ooze", cost=1, command="/bstpet 2 <me>", type="Mag"},
				[2] = {name="Purulent Ooze", cost=1, command="/bstpet 1 <me>", type="Mag"},
			},
		},
		[6] = {
			["type"] = "Hippogryph",
			["HQ"] = {name="DaringRoland", jug="Feculent Broth"},
			["NQ"] = {name="Hip.Familiar", jug="Turpid Broth"},
			["abilities"] = {
				[1] = {name="Hoof Volley", cost=3, command="/bstpet 5 <me>", type="Phys"},
				[2] = {name="Back Heel", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[3] = {name="Jettatura", cost=3, command="/bstpet 2 <me>", type="Mag"},
				[4] = {name="Choke Breath", cost=1, command="/bstpet 3 <me>", type="Mag"},
				[5] = {name="Fantod", cost=2, command="/bstpet 3 <me>", type="Mag"},
				[6] = {name="Nihility Song", cost=1, command="/bstpet 6 <me>", type="Mag"}
			},
		},
	}
	
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
	--Setup job specific binds
	send_command('bind ^= gs c summonPet')
	send_command('bind ^insert gs c petUp')
    send_command('bind ^delete gs c petDown')

	set_macro_page(1, 2)
	
	--Handle weapons and stylelock based on subjob
	--TODO: update this for your stylelock(s)
	if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
		windower.send_command:schedule(4, 'input /lockstyleset 3')
	else
		windower.send_command:schedule(4, 'input /lockstyleset 3')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function job_pet_midcast(spell, action, spellMap, eventArgs)
    for _,value in pairs(petTable[petTable.index].abilities) do
        if value.name == spell.english then 
            equip(sets.petWS[value.type])
            return
        end
    end
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
			send_command('input /p "Im saved!!! ...or Doom killed me?')
			enable('ring1','waist')
			evalState_equipGear()
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	-- increment / decrement auto.pet.index
	if cmdParams[1]:lower() == 'petup' then
		petTable.index = petTable.index + 1
		if petTable.index > #petTable then
			petTable.index = 0
		end
		bstHud('update')
	end	
	if cmdParams[1]:lower() == 'petdown' then
		petTable.index = petTable.index - 1
		if petTable.index < 0 then
			petTable.index = #petTable
		end
		bstHud('update')
	end

	-- summon pet
	if cmdParams[1]:lower() == 'summonpet' then
		local abilRecast = windower.ffxi.get_ability_recasts()
		local loyaltyRecast = abilRecast[94]

		equip({ammo=petTable[petTable.index].broth})
		if loyaltyRecast == 0 then
			add_to_chat(122,'-- Summoning '..petTable[petTable.index].name..' with Beastial Loyalty! --')
			send_command:schedule(.5, '/bestial loyalty')
		else
			add_to_chat(122,'-- Summoning '..petTable[petTable.index].name..' with Call Familiar! --')
			send_command:schedule(.5, '/call familiar')
		end
	end

	-- spike health for omen healing objective
	if cmdParams[1]:lower() == 'spikehealth' then
		equip(sets.naked)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- BST Hud
-------------------------------------------------------------------------------------------------------------------
function bstHud(action)
	if action == 'update' then
		-- hud doesn't exist yet.  create it!
		if petInfoHud == nil then
			texts = require('texts')
			bstHud_xPos = 1500
			bstHud_yPos = 75
			petInfoHud = texts.new("")	
		end

		-- hud exists. figure out what to display
		local currPet = petTable[petTable.index]
		local petType = currPet.type

		-- figure out name string
		local petName = nil
		if currPet.HQ.name ~= nil and currPet.NQ.name ~= nil then
			petName = currPet.NQ.name..' / '..currPet.HQ.name
		elseif currPet.HQ.name ~= nil then 
			petName = currPet.HQ.name
		elseif currPet.NQ.name ~= nil then
			petName = currPet.NQ.name
		else
			petName = "OH GOD ITS BROKEN"
		end

		-- figure out jug situation(?)

		-- figure out petActionString and set the keybinds
		local petActions = nil
		for btn = 6, 1, -1 do
			if currPet.abilities[btn] ~= nil then
				local ability = currPet.abilities[btn]
				add_to_chat(122, 'alt+'..btn..' bound to: '..ability.command)
				setKeyBind('!'..btn, 'input '..ability.command)
				
				local abilText = 'alt+'..btn..' - '..ability.name..' - R.Charges: '..ability.cost
				if petActions == nil then
					petActions = abilText
				else
					petActions = abilText..'\n'..petActions
				end
			end
		end
		
		-- jam it all together and see what we get
		local displayText = petType..'\n'..petName..'\n'..petActions
		texts.text(petInfoHud, displayText)
		texts.visible(petInfoHud, true)
		texts.pos(petInfoHud, bstHud_xPos, bstHud_yPos)
		texts.bg_alpha(petInfoHud, 0)
	end

	if action == 'remove' then
		texts.visible(petInfoHud, false)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction function: called ~once per second
-------------------------------------------------------------------------------------------------------------------
fantodUsed = false
function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()
	local callBeastRecast = abilRecast[104]
	local loyaltyRecast = abilRecast[94]
	local spurRecast = abilRecast[45]
	local runWildRecast = abilRecast[46]
	local unleashRecast = abilRecast[254]
	local killerInstinctRecast = abilRecast[106]
    
	--[[ Haste Samba ]]--
	if auto.fite[auto.fite.index] == 'On' and player.sub_job == 'DNC' then
		if player.tp >= 350 and not buffactive['Haste Samba'] then
			add_to_chat(122, '[Haste Samba]')
			send_command('/haste samba')
			return
		end
	end

	if pet.isvalid then
        local master = windower.ffxi.get_player()
        local pet = windower.ffxi.get_mob_by_target('pet')

		-- AutoActions we only take when autoFite mode is on
		if auto.fite[auto.fite.index] == 'On' then
			-- Heal Pet if Low HP & Calls on CD
			if pet.hpp <= 25 and callBeastRecast > 0 and loyaltyRecast > 0 then
				add_to_chat(122, '[Reward]')
				send_command('/reward')
				return
			end

			-- Make pet fight when master is engaged
			if master.status == 1 and pet.status == 0 then
				add_to_chat(122, '[Fight]')
				send_command('/fight')
				return
			end

			if master.status == 1 and pet.status == 1 then
				--[[ Killer Instinct ]]--
				if killerInstinctRecast == 0 then
					add_to_chat(122, '[Killer Instinct]')
					windower.chat.input('/ja "Killer Instinct" <me>')
					return
				end
				
				--[[ Spur ]]--
 				if spurRecast == 0 then
					add_to_chat(122, '[Spur]')
					windower.chat.input('/pet Spur <me>')
					return
				end

				--[[ Unleash ]]--
				if unleashRecast == 0 then
					add_to_chat(122, '[Unleash]')
					windower.chat.input('/ja Unleash <me>')
					return
				end

				--[[ Run Wild ]]--
				if (loyaltyRecast <= 295) and runWildRecast == 0 then
				--if (loyaltyRecast <= 295 or callBeastRecast <= 295) and runWildRecast == 0 then
					add_to_chat(122, '[Run Wild]')
					windower.chat.input('/pet runwild <me>')
					return
				end

				--[[ Hippogryph ]]--
				if pet.name == "Hip.Familiar" then
					if readyCharges() >= 2 and fantodUsed == false then
						fantodUsed = true
						add_to_chat(122, '[Fantod]')
						windower.chat.input('/bstpet 4 <me>')
						return
					end

					if readyCharges() == 3 and fantodUsed == true then
						fantodUsed = false
						add_to_chat(122, '[Hoof Volley]')
						windower.chat.input('/bstpet 5 <me>')
						return
					end
				end
				
				--[[ Rhyming Shizuna (Sheep) ]]--
				if pet.name == "RhymingShizuna" and readyCharges() == 3 then
					if buffactive['Berserk'] then
						add_to_chat(122, '[Chop]')
						windower.chat.input('/bstpet 1 <me>')
						return
					end

					add_to_chat(122, '[Rage]')
					windower.chat.input('/bstpet 2 <me>')
					return
				end
				
				--[[ Pondering Peter (Rabbit) ]]--
				if pet.name == "PonderingPeter" and readyCharges() == 3 then
					for _, data in pairs(windower.ffxi.get_party()) do
						if type(data) == 'table' and data.mob then
							local pInfo = data.mob
							if pInfo.hpp > 0 and pInfo.hpp < 70 then
								add_to_chat(122, pInfo.name..' is under 70% - Carrot time Peter!')
								windower.chat.input('/bstpet 4 <me>')
								return
							end
						end
					end
					add_to_chat(122, 'HP is all good -- Foot Kick Peter!')
					windower.chat.input('/bstpet 1 <me>')
					return
				end

				--[[ Warlike Patrick (Lizard) ]]--
				if pet.name == "WarlikePatrick" and readyCharges() == 3 then
					add_to_chat('[Blockhead]')
					windower.chat.input('/bstpet 3 <me>')
					return
				end
			end
		end
    end

    if not pet.isvalid then 
		-- AutoActions we only take when autoFite mode is on

		--[[ Any Summon 
		if auto.fite[auto.fite.index] == 'On' then
			if loyaltyRecast == 0 then
				add_to_chat(122, '[Bestial Loyalty]')
				windower.chat.input('/equip Ammo "Livid Broth"')
				send_command:schedule(.5, '/bestial loyalty')
				return
			elseif callBeastRecast == 0 then
				add_to_chat(122, '[Call Beast]')
				windower.chat.input('/equip Ammo "Livid Broth"')
				send_command:schedule(.5, '/call beast')
				return
			end
		end
		]]-- 
		--[[ Loyalty Only ]]--
		if auto.fite[auto.fite.index] == 'On' then
			if loyaltyRecast == 0 then
				add_to_chat(122, '[Bestial Loyalty]')
				windower.chat.input('/equip Ammo "Turpid Broth"')
				send_command:schedule(.5, '/bestial loyalty')
				return
			end
		end		
    end
end