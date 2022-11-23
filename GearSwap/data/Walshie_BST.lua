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
	gear.strWsCape = {name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
    --gear.dexWsCape = {name="Artio's Mantle", augments={'DEX + 20'}}
	--gear.tpCape = {name="Artio's Mantle", augments={'DEX + 20', 'SOMETHING ELSE'}}
	gear.petCape = {name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}}

	sets.baseMelee = {
        ammo = "Coiste Bodhar", -- DA+3%
        head = "Nukumi Cabasset +2", -- Haste+8%
        neck = "Shulmanu Collar", -- DA+3%
        ear1 = "Eabani Earring", -- DW+4
        ear2 = "Sherida Earring", -- DA+5%
        body = "Tali'ah Manteel +2", -- Haste+4%, TA+6%
        hands = "Nukumi Manoplas +2", -- Haste+4%
        ring1 = "Epona's Ring", -- DA+3%; TA+3%
        ring2 = "Gere Ring", -- TA+5%
        back = gear.strWsCape, -- DA+10%
        waist = "Windbuffet Belt +1", -- TA+2%; QA+2%
        legs = "Meg. Chausses +2", -- Haste+4%; TA+5%
        feet = "Nukumi Ocreae +2" -- Haste+3%
	}

	sets.meleeAcc = set_combine(sets.baseMelee, {
    })

    sets.meleeHybrid = set_combine(sets.baseMelee, {
        head="Malignance Chapeau",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        ring2="Defending Ring",
    })

	sets.baseWS = {
        ammo = "Coiste Bodhar",
        head = "Gleti's Mask",
        neck = "Fotia Gorget",
        ear1 = "Nukumi Earring",
        ear2 = "Sherida Earring",
        body = "Gleti's Cuirass",
        hands = "Meg. Gloves +2",
        ring1 = "Epona's Ring",
        ring2 = "Gere Ring",
        back = gear.strWsCape,
        waist = "Fotia Belt",
        legs = "Meghanada Chausses +2",
        feet = "Nukumi Ocreae +2"
    }     

	sets.baseIdle = {
		head = "Gleti's Mask",
        body = "Gleti's Cuirass",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        hands = "Gleti's Gauntlets",
        neck = "Twilight Torque",
        ring1 = "Defending Ring",
        ring2 = "Paguroidea Ring",
        back = "Archon Cape",
		waist = "Flume Belt +1",
		ear1 = "Eabani Earring",
		ear2 = "Enmerkar Earring"
	}

	sets.moveSpeed = {}
	sets.Obi = {waist="Hachirin-no-Obi"}
	sets.TH = {head="Wh. Rarab Cap +1", legs="Valorous Hose", waist="Chaac Belt", ammo="Perfect Lucky Egg"}
	sets.precast.JA['Box Step'] = sets.TH

	-- JA Sets
    sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
    sets.precast.JA['Bestial Loyalty'] = {hands = "Ankusa Gloves"}
    sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
    sets.precast.JA['Familiar'] = {legs="Ankusa Trousers"}		
    sets.precast.JA['Tame'] = {} -- {head="Totemic Helm +1",}		
    sets.precast.JA['Spur'] = {feet = "Nukumi Ocreae +2"}
	sets.precast.JA['Reward'] = {
        ammo = "Pet Food Theta",
        head = "Khimaira Bonnet",
        body = "Monster Jackcoat",
        hands = "Ogre Gloves",
        legs = "Totemic Trousers +2",
        feet = "Ankusa Gaiters"
	}
	
	-- WS Sets
	sets.precast.WS = set_combine(sets.baseWS, {})
	sets.precast.WS['Decimation'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo = "Voluspa Tathlum",
        head = "Gleti's Mask",
        neck = "Fotia Gorget",
        ear1 = "Ishvara Earring",
        ear2 = "Moonshade Earring",
        body = "Nukumi Gausape +2",
        hands = "Meg. Gloves +2",
        ring1 = "Apate Ring",
        ring2 = "Gere Ring",
        back = gear.strWsCape,
        waist = "Fotia Belt",
        legs = "Gleti's Breeches",
        feet = "Nukumi Ocreae +2"
	})
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		ring1="Ilabrat Ring", 
		ring2="Apate Ring",
		--back=gear.dexWSCape
	})
    sets.precast.WS['Primal Rend'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS, {})
	
	-- Pet Sets
	sets.petWS = {}

	sets.petWS.Phys = {
		ammo = "Voluspa Tathlum",
        head = "Nukumi Cabasset +2",
        neck = "Shulmanu Collar",
		ear1 = "Hija Earring",
		ear2 = "Kyrene's Earring",
		body = "Gleti's Cuirass",
        hands = "Nukumi Manoplas +2",
		ring1 = "Cath Palug Ring",
		ring2 = "Thurandaut Ring",
		back = gear.petCape,
		waist = "Incarnation Sash",
        legs = "Wisent Kecks",
		feet = "Gleti's Boots"
	}
    sets.petWS.Mag = {
		ammo = "Voluspa Tathlum",
        head = "Valorous Mask",
        neck = "Adad Amulet",
		ear1 = "Hija Earring",
		ear2 = "Kyrene's Earring",
        hands = "Nukumi Manoplas +2",
		ring1 = "Cath Palug Ring",
		ring2 = "Thurandaut Ring",
		back = gear.petCape,
        waist = "Incarnation Sash",
		legs = "Totemic Trousers +2",
		feet = "Gleti's Boots"
	}
    sets.petWS.Multi = {
		ammo = "Voluspa Tathlum",
        head = "Nukumi Cabasset +2",
        neck = "Shulmanu Collar",
		ear1 = "Hija Earring",
		ear2 = "Kyrene's Earring",
        hands = "Nukumi Manoplas +2",
		ring1 = "Cath Palug Ring",
		ring2 = "Thurandaut Ring",
		back = gear.petCape,
        waist = "Incarnation Sash",
		legs = "Wisent Kecks",
		feet = "Gleti's Boots"
	}

	sets.PetDT = {
        hands = "Gleti's Gauntlets"
    }
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=(sets.baseIdle), engaged=(sets.baseMelee)},
		[1] = {name="DPS-Acc", idle=(sets.baseIdle), engaged=(sets.meleeAcc)},
		[2] = {name="DPS-Hybrid", idle=(sets.baseIdle), engaged=(sets.meleeHybrid)},
		--[3] = {name="PetDPS", idle=set_combine(sets.PetDT, sets.baseIdle), engaged=sets.PetDT},
	}
	
	weaponMode = {
		["index"] = 0,
		[0] = {name="Dolichenus", set={main="Dolichenus", sub="Guttler"}},
		[1] = {name="Guttler", set={main="Guttler", sub="Dolichenus"}},
		[2] = {name="SW-Doli", set={main="Dolichenus", sub="Thorfinn Shield +1"}},
		[3] = {name="SW-Guttler", set={main="Guttler", sub="Thorfinn Shield +1"}},
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
				-- Never use ["Brain Crush"] = { cost=1, command="/bstpet 4 <me>" },
			},
		},
		[1] = {
			["type"] = "Tiger",
			["HQ"] = {}, -- Has no HQ Version
			["NQ"] = {name="BlackbeardRandy", jug="Meaty Broth"},
			["abilities"] = {
				[1] = {name="Razor Fang", cost=1, command="/bstpet 2 <me>", type="Phys"},
				[2] = {name="Claw Cyclone", cost=1, command="/bstpet 3 <me>", type="Mag"},
				[3] = {name="Crossthrash", cost=2, command="/bstpet 4 <me>", type="Phys"},
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
		[7] = {
			["type"] = "Diremite",
			["HQ"] = {}, ---- Has no HQ Version
			["NQ"] = {name="AnklebiterJedd", jug="Crackling Broth"},
			["abilities"] = {
				[1] = {name="Double Claw", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Grapple", cost=1, command="/bstpet 2 <me>", type="Phys"},
				[3] = {name="Spinning Top", cost=1, command="/bstpet 3 <me>", type="Phys"},
				[4] = {name="Filamented Hold", cost=2, command="/bstpet 4 <me>", type="Mag"}
			},
		},
		[8] = {
			["type"] = "Mosquito",
			["HQ"] = {name="Left-Handed Yoko", jug="Heavenly Broth"},
			["NQ"] = {name="MosquitoFamiliar", jug="Wetlands Broth"},
			["abilities"] = {
				[1] = {name="Infected Leech", cost=1, command="/bstpet 1 <me>", type="Mag"},
				[2] = {name="Gloom Spray", cost=2, command="/bstpet 2 <me>", type="Mag"}
			},
		},
		[9] = {
			["type"] = "Raptor",
			["HQ"] = {}, ---- Has no HQ Version
			["NQ"] = {name="FleetReinhard", jug="Rapid Broth"},
			["abilities"] = {
				[1] = {name="Scythe Tail", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Ripper Fang", cost=1, command="/bstpet 2 <me>", type="Phys"},
				[3] = {name="Chomp Rush	", cost=3, command="/bstpet 3 <me>", type="Phys"}
			},
		},
		[10] = {
			["type"] = "Leech",
			["HQ"] = {}, ---- Has no HQ Version
			["NQ"] = {name="FatsoFargann", jug="Curdled Plasma Broth"},
			["abilities"] = {
				[1] = {name="Suction", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Drainkiss", cost=1, command="/bstpet 2 <me>", type="Mag"},
				[3] = {name="Acid Mist", cost=2, command="/bstpet 3 <me>", type="Mag"},
				[4] = {name="TP Drainkiss", cost=3, command="/bstpet 4 <me>", type="Mag"}
			},
		},
		[11] = {
			["type"] = "Eft",
			["HQ"] = {}, ---- Has no HQ Version
			["NQ"] = {name="SuspiciousAlice", jug="Furious Broth"},
			["abilities"] = {
				[1] = {name="Geist Wall", cost=1, command="/bstpet 1 <me>", type="Mag"},
				[2] = {name="Numbing Noise", cost=1, command="/bstpet 2 <me>", type="Mag"},
				[3] = {name="Nimble Snap", cost=1, command="/bstpet 3 <me>", type="Phys"},
				[4] = {name="Cyclotail", cost=1, command="/bstpet 4 <me>", type="Phys"},
				[5] = {name="Toxic Spit", cost=2, command="/bstpet 5 <me>", type="Mag"}
			},
		},
		[12] = {
			["type"] = "Mandragora",
			["HQ"] = {}, ---- Has no HQ Version
			["NQ"] = {name="SweetCaroline", jug="Aged Humus"},
			["abilities"] = {
				[1] = {name="Head Butt", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Wild Oats", cost=1, command="/bstpet 2 <me>", type="Phys"},
				[3] = {name="Leaf Dagger", cost=1, command="/bstpet 3 <me>", type="Phys"},
				[4] = {name="Scream", cost=1, command="/bstpet 4 <me>", type="Mag"}
			},
		},
		[13] = {
			["type"] = "Slime",
			["HQ"] = {name="SultryPatrice", jug="Putrescent Broth"},
			["NQ"] = {name="SlimeFamiliar", jug="Decaying Broth"},
			["abilities"] = {
				[1] = {name="Fluid Toss", cost=1, command="/bstpet 1 <me>", type="Phys"},
				[2] = {name="Fluid Spread", cost=2, command="/bstpet 2 <me>", type="Phys"},
				[3] = {name="Digest", cost=1, command="/bstpet 3 <me>", type="Mag"}
			},
		},
	}
	
	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
	bstHud('update')
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
	--Setup job specific binds
	--send_command('bind ^= gs c summonPet')
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

function extendedUserUnload()
    send_command('unbind @1')
    send_command('unbind @2')
	send_command('unbind @3')
	send_command('unbind @4')
	send_command('unbind @5')
	send_command('unbind @6')
	--send_command('unbind ^=')
	send_command('unbind ^insert')
	send_command('unbind ^delete')
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
				add_to_chat(122, 'win+'..btn..' bound to: '..ability.command)
				send_command('bind @'..btn..' input '..ability.command)
				
				local abilText = 'win+'..btn..' - '..ability.name..' - R.Charges: '..ability.cost
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
function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()
	local callBeastRecast = abilRecast[104]
	local loyaltyRecast = abilRecast[94]
	local spurRecast = abilRecast[45]
	local runWildRecast = abilRecast[46]
	local unleashRecast = abilRecast[254]
	local killerInstinctRecast = abilRecast[106]
	local familiarRecast = abilRecast[0]
    
	--[[ Haste Samba ]]--
	--[[
	if auto.fite[auto.fite.index] == 'On' and player.sub_job == 'DNC' then
		if player.tp >= 350 and not buffactive['Haste Samba'] then
			add_to_chat(122, '[Haste Samba]')
			send_command('/haste samba')
			return
		end
	end
	]]--
	if pet.isvalid then
        local master = windower.ffxi.get_player()
        local pet = windower.ffxi.get_mob_by_target('pet')

		-- AutoActions we only take when autoFite mode is on
		if auto.fite[auto.fite.index] == 'On' then
			-- Heal Pet if Low HP & Calls on CD
			--[[
			if pet.hpp <= 25 and callBeastRecast > 0 and loyaltyRecast > 0 then
				add_to_chat(122, '[Reward]')
				send_command('/reward')
				return
			end
			]]--
			-- Heal Pet if Low HP & Loyalty on CD
			if pet.hpp <= 25 and loyaltyRecast > 0 then
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

				--[[ Familiar ]]--
				--[[ Use when Run Wild has between 8 and 9:20 minutes on CD 
					(15 min Recast, dies after 5:40 (+40s from Job Points), 
					so 9:20 min is perfect time) ]]--
				if runWildRecast > 480 and runWildRecast < 560 and familiarRecast == 0 then
					add_to_chat(122, '[Familiar]')
					windower.chat.input('/ja Familiar <me>')
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
				--[[ Fantod Broken
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
				]]--

				if pet.name == "Hip.Familiar" then
					if readyCharges() == 3 and player.tp > 400 and player.tp < 600 then
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

				--[[ Sultry Patrice (Slime) ]]--
				if pet.name == "SultryPatrice" and readyCharges() == 3 then
					if pet.hpp <= 80 then
						add_to_chat(122, '[Digest]')
						windower.chat.input('/bstpet 3 <me>')
						return
					else
						add_to_chat(122, '[Fluid Toss]')
						windower.chat.input('/bstpet 1 <me>')
						return
					end					
				end
			end
		end
    end

    if not pet.isvalid then 
		-- AutoActions we only take when autoFite mode is on

		--[[ Any Summon ]]--
		--[[
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
				windower.chat.input('/equip Ammo "Putrescent Broth"')
				send_command:schedule(.5, '/bestial loyalty')
				return
			end
		end	
    end
end