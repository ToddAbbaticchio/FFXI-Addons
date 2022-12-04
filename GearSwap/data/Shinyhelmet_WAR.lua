include('RST\\sharedFunctions')

-------------------------------------------------------------------------------------------------------------------
-- dumb name.  is required.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()

	gear.DubAttackCape ={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.WSCape = {name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}}
	gear.VitWSCape = {name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}

	sets.baseMelee = {
		ammo="Coiste Bodhar",
		head="Hjarrandi Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",		
		legs="Pummeler's Cuisses +3",
		feet="Pummeler's Calligae +3",		
		neck="Warrior's Bead Necklace +2",
		waist="Ioskeha Belt +1",
		ear1="Telos Earring",
		ear2="Boii earring +1",
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=gear.DubAttackCape,
	}

	sets.baseWS = {                               
	ammo="Knobkierrie",
	head="Agoge mask +3",
	body="Pummeler's Lorica +3",
	hands="Sakpata's Gauntlets",
	legs="Sakpata's Cuisses",
	feet="Sulev. Leggings +2",
	neck="Warrior's Bead Necklace +2",
	waist="Sailfi Belt +1",
	ear1="Thrud Earring",
	ear2="Moonshade Earring",
	ring1="Epaminondas's Ring",
	ring2="Karieyh Ring",
	back=gear.WSCape,
	}

	sets.fullWSdamage = {                               
		ammo="Knobkierrie",
		head="Agoge mask +3",
		body="Pummeler's Lorica +3",
		hands="Boii Mufflers +2",
		legs="Sakpata's Cuisses",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Epaminondas's Ring",
		ring2="Karieyh Ring",
		back=gear.WSCape,
		}

    sets.baseIdle = {
	ammo="Staunch Tathlum +1",
	head="Genmei Kabuto",
	neck="Loricate Torque",
	ear1="Genmei Earring",
	ear2="Ethereal Earring",
	body="Tartarus Platemail",
	hands="Sulev. Gauntlets +2",
	ring1="Defending Ring",
	ring2="Karieyh Ring",
	back="Shadow Mantle",
	waist="Flume Belt +1",
	legs="Sulev. Cuisses +2",
	feet="Amm Greaves"}


	sets.moveSpeed = {feet="Hermes' Sandals"}
	sets.wakeUp = {head="Vim Torque"}
	
	--sets.TH = {waist='Chaac Belt', head='Wh. Rarab Cap +1', ammo='Per. Lucky Egg', hands="Herculean Gloves"}
	sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}

	-- JA Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back="Cichol's Mantle", feet="Agoge Calligae +1", body="Pummeler's Lorica +3"}
	sets.precast.JA['Warcry'] = {head="Agoge mask +3"}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {body="Warrior's Lorica +2"}
	sets.precast.JA['Mighty Strikes'] = {hands="Warrior's Mufflers +2"}
	sets.precast.JA["Warrior's Charge"] = {}  --  yea not using this.. 
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk", feet="Agoge Calligae +1"}
	sets.precast.JA['Retaliation'] = {feet="Boii Calligae +2"}
	sets.precast.JA['Restraint'] = {hands="Boii mufflers +2"}  -- meh
	sets.precast.JA['Blood Rage'] = {body="Boii lorica +3"}  
	sets.precast.JA['Brazen Rush'] = {}  -- no gear to enhance. 
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})

	-- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Upheaval'] = set_combine(sets.baseWS, {back=gear.VitWSCape})
    sets.precast.WS['Impulse Drive'] = set_combine(sets.baseWS, {feet="Thereoid greaves"})
	sets.precast.WS['Fell Cleave'] = set_combine(sets.baseWS, {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {head="Agoge mask +3", feet="Sulev. Leggings +2",waist="Sailfi Belt +1"})
	sets.precast.WS['Requiescat'] = {sets.baseWS}
	sets.precast.WS['Sanguine Blade'] = {sets.baseWS}
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="Attack", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
		[1] = {name="FullWS", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Chango", set={main="Chango", sub="Utu Grip"}},
		[1] = {name="Lycurgos", set={main="Lycurgos", sub="Utu Grip"}},
		[2] = {name="Prime", set={main="Laphria", sub="Utu Grip"}},
		[3] = {name="Shining", set={main="Shining One", sub="Utu Grip"}},
		[4] = {name="Naegling", set={main="Naegling", sub="Blurred Shield +1"}},
		[5] = {name="Montante", set={main="Montante +1", sub="Utu Grip"}},
		[6] = {name="Loxotic", set={main="Loxotic Mace +1", sub="Blurred Shield +1"}},
		[7] = {name="Gozuki", set={main="Gozuki Mezuki", sub="Utu Grip"}},
		[8] = {name="DW-Swords", set={main="Naegling", sub="Zantetsuken"}},
		[9] = {name="Dagger", set={main="Qutrub knife", sub="Blurred Shield +1"}},
		[10] = {name="Spear", set={main="Iapetus", sub="Utu Grip"}},
		[11] = {name="Sword", set={main="Twinned blade", sub="Blurred Shield +1"}},
		[12] = {name="GSword", set={main="Lament", sub="Utu Grip"}},
		[13] = {name="Scythe", set={main="Hoe", sub="Utu Grip"}},
		[14] = {name="Katana", set={main="Debahocho", sub="Blurred Shield +1"}},
		[15] = {name="GKatana", set={main="Lotus Katana", sub="Utu Grip"}},
		[16] = {name="Club", set={main="Apkallu scepter", sub="Blurred Shield +1"}},
		[17] = {name="Staff", set={main="Fourth Staff", sub="Utu Grip"}},
		[18] = {name="ZaDah", set={main="Za'Dha Chopper",sub="Utu Grip"}},
		
	}

	food = {
		["index"] = 0,
		[0] = 'Grape Daifuku',
		[1] = 'Behemoth Steak',
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
		["stance"] = {
			["index"] = 0,
			[0] = "Hasso",
			[1] = "Seigan",
		},
		["doom"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
		["foodmode"] = {
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
	
	send_command('bind ^F12 gs c togglestance')
	send_command('bind ^z gs c resetweaponindex')
	send_command('bind @z gs c procweapons')
	send_command('bind ^F8 gs c toggleautofood')
	send_command('bind !F8 gs c togglefood')
	
	send_command('bind !F9 gs c reversetoggleweaponmode')

	--Set default macro book / page
    if player.sub_job == 'DRG' then
        set_macro_page(2, 8)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 8)
    end
	
	windower.send_command:schedule(4, 'input /lockstyleset 7')
	
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
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
function job_buff_change(buff, gain)
	if buff == 'Doom' then
		if gain then
			send_command('input /p Doomed! Haaaaaalp!')
			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
			disable('ring1','waist')
			auto.doom.index = 1 
		else
			enable('ring1','waist')
			evalState_equipGear()
			auto.doom.index = 0
		end
	end

	if buff == 'Warcry' then
		if gain and windower.ffxi.get_ability_recasts()[2] > 297 then
			lastwarcry = player.name
		else
			lastwarcry = ''
		end
	end

end

-------------------------------------------------------------------------------------------------------------------
-- Job specific function extensions
-------------------------------------------------------------------------------------------------------------------

function extendedJobSelfCommand(cmdParams, eventArgs)
	-- for reset weapon index addon
	if cmdParams[1]:lower() == 'resetweaponindex' then
		weaponMode.index = 0

		sets.weapons = weaponMode[weaponMode.index].set
		modeHud('update')
		evalState_equipGear()
	end

	if cmdParams[1]:lower() == 'procweapons' then
		weaponMode.index = 9

		sets.weapons = weaponMode[weaponMode.index].set
		modeHud('update')
		evalState_equipGear()
	end

	if cmdParams[1]:lower() == 'reversetoggleweaponmode' then
		weaponMode.index = weaponMode.index -1
		if weaponMode.index < 0 then
			weaponMode.index = #weaponMode;
		end
		
		if extendedTWM then
			extendedTWM(cmdParams, eventArgs)
		end

		sets.weapons = weaponMode[weaponMode.index].set
		--windower.add_to_chat(122,'-- WeaponMode: '..weaponMode[weaponMode.index].name..' --')
		modeHud('update')
		evalState_equipGear()
	end

	if cmdParams[1]:lower() == 'togglestance' then
		auto.stance.index = auto.stance.index + 1
		if auto.stance.index > #auto.stance then
			auto.stance.index = 0
		end
		modeHud('update')
	end

	if cmdParams[1]:lower() == 'toggleautofoodmode' then
		auto.foodmode.index = auto.foodmode.index + 1
		if auto.foodmode.index > #auto.foodmode then
			auto.foodmode.index = 0
		end
		modeHud('update')
	end
	if cmdParams[1]:lower() == 'togglefood' then
		food.index = food.index + 1
		if food.index > #food then
			food.index = 0
		end
		modeHud('update')
	end	
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
	-- job specific location override?
	--modeHud_xPos = 1200
	--modeHud_yPos = 50

	local autoFoodMode = auto.foodmode[auto.foodmode.index]
	hudText:append(white..'auto.autoFoodMode: ' ..getBoolColor(autoFoodMode))
	
	local autoFood = food[food.index]
	hudText:append(white..'food: '..autoFood)

	if  player.sub_job == 'SAM' then 
		local autoStance = auto.stance[auto.stance.index]
		hudText:append(white..'auto.stance: '..getStanceColor(autoStance))
	end 


	return hudText
end

function getStanceColor(bool)
	if bool == 'Hasso' then
		return green..bool..white
	end
	return red..bool..white
end


-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()
	
	local bloodRageRecast = abilRecast[11]
	local berserkRecast = abilRecast[1]
	local warcryRecast = abilRecast[2]
	local defenderRecast = abilRecast[3]
	local aggressorRecast = abilRecast[4]


	if  player.sub_job == 'DRG' then 
		local jumpRecast = abilRecast[158]
	    local highJumpRecast = abilRecast[159] 
	end

	if  player.sub_job == 'SAM' then 
		local hassoRecast = abilRecast[138]
		local seiganRecast = abilRecast[139]
		local thirdEyeRecast = abilRecast[133]
	    local meditateRecast = abilRecast[134]
	end

	-- auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- handle auto wake on sleep with frenzy sallet
	if buffactive['Sleep'] and player.status == "Engaged" then 
		send_command('input //gs equip sets.wakeUp')
	elseif player.equipment.head == "Vim Torque" and not buffactive['Sleep'] then
		if player.status == "Engaged" then
			send_command('input //gs equip sets.engaged')
		else
			send_command('input //gs equip sets.idle')
		end
	end

	if auto.doom[auto.doom.index] == 'On' and not actionInProgress and not moving then
		if player.inventory['Holy Water'] or player.satchel['Holy Water'] then
			windower.chat.input('/item "Holy Water" <me>')
			add_to_chat(123,'Abort: You are doomed, using Holy Water instead.')
			eventArgs.cancel = true
			return 
		end
	end

	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		
			if not buffactive['Berserk'] then
				--actionInProgress = true
				send_command('input /ja "Berserk" <me>')
				return
			end

			if not buffactive['Retaliation'] then
				--actionInProgress = true
				send_command('input /ja "Retaliation" <me>')
				return
			end

			if not buffactive['Aggressor'] then
				--actionInProgress = true
				send_command('input /ja "Aggressor" <me>')
				return
			end

			if not buffactive['Warcry'] and not buffactive['Blood Rage'] then
				--actionInProgress = true
				send_command('input /ja "Warcry" <me>')
				return
			end			

			--if warcry isnt up then case Blood Rage 
			if not buffactive['Blood Rage'] and bloodRageRecast == 0 and not buffactive['Warcry'] then
				--actionInProgress = true
				send_command('input /ja "Blood Rage" <me>')
				return
			end		

			if jumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
				add_to_chat(207, '[~ Jump ~]')
				send_command('/jump')
				return
			end
	
			if highJumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
				add_to_chat(207, '[~ High Jump ~]')
				send_command('/highjump')
				return
			end			

			if auto.stance[auto.stance.index] == 'Hasso' then
				if hassoRecast == 0 and not buffactive['Hasso'] and player.sub_job == 'SAM' then 
					send_command('input /ja "Hasso" <me>')
					return
				end
			end

			if auto.stance[auto.stance.index] == 'Seigan' then
				if seiganRecast == 0 and not buffactive['Seigan'] and player.sub_job == 'SAM' then 
					send_command('input /ja "Seigan" <me>')
					return
				end
				
				if thirdEyeRecast == 0 and not buffactive['Third Eye'] and player.sub_job == 'SAM' then
					send_command('input /ja "Third Eye" <me>')
					return
				end					
			end

			if meditateRecast == 0 then
				--add_to_chat(207, '[~ Meditate ~]')
				send_command('/meditate')
				return
			end
	end

	if auto.foodmode[auto.foodmode.index] == 'On' and not buffactive['Food'] then
		send_command('input /item "' ..food[food.index].. '" <me>')
		return
	end  

end
