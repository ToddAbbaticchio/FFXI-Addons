include('sharedFunctions.lua')

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
	-- Base Sets --
    sets.baseMelee = {
        ammo = "Staunch Tathlum",
        head = "Nyame helm",
        neck = "Shulmanu Collar",
        ear1 = "Sherida Earring",
        ear2 = "Thrud Earring",
        body = "Nyame mail",
        hands = "Nyame gauntlets",
        ring1 = "Petrov Ring",
        ring2 = "Sulevia's Ring",
        back = "Brigantia's Mantle",
        waist = "Sailfi Belt +1",
        legs = "Nyame flanchard",
        feet = "Nyame sollerets"
    }

	sets.baseWS = {
        ammo = "Knobkierrie",
        head = "Nyame helm",
        neck = "Fotia Gorget",
        ear1 = "Moonshade Earring",
        ear2 = "Thrud Earring",
        body = "Sulevia's Plate. +2",
        hands = "Nyame gauntlets",
        ring1 = "Rajas Ring",
		ring2 = "Sulevia's Ring",
        back = "Brigantia's Mantle",
        waist = "Fotia Belt",
		legs = "Sulev. Cuisses +2",
        feet = "Sulev. Leggings +2",
    }

	sets.baseTank = {
        ammo = "Staunch Tathlum",
        head = "Nyame helm",
        neck = "Shulmanu Collar",
        ear1 = "Sherida Earring",
        ear2 = "Thrud Earring",
        body = "Nyame mail",
        hands = "Nyame gauntlets",
        ring1 = "Petrov Ring",
        ring2 = "Sulevia's Ring",
        back = "Brigantia's Mantle",
        waist = "Sailfi Belt +1",
        legs = "Nyame flanchard",
        feet = "Nyame sollerets"
    }

	sets.baseJump = {
		ammo = "Voluspa Tathlum",
        head = "Sulevia's Mask +2",
        neck = "Asperity necklace",
        ear1 = "Sherida Earring",
        ear2 = "Thrud Earring",
        body = "Vishap Mail +2",
        hands = "Vis. Fng. Gaunt. +2",
        ring1 = "Petrov Ring",
        ring2 = "Flamma Ring",
        back = "Brigantia's Mantle",
        waist = "Ioskeha Belt",
        legs = "Sulev. Cuisses +2",
        feet = "Flam. Gambieras +2"
	}

	-- Partial Sets (for specific things and stuff) --
	sets.baseIdle = { --[[ TODO: do you use any idle gear?  like regen or refresh stuff?  stick that here if so ]] }
	sets.moveSpeed = { legs = "Carmine Cuisses +1" }

	--[[ 
		TODO: put things here to override sets.baseWS above. example:
		sets.precast.WS["Stardiver"] = set_combine(sets.baseWS, {ring2="critRing",head="critHelm"})

		because this WS is crit based, and this items give crit.  or whatever
	]]
	-- Specific WeaponSkill Handling --
    sets.precast.WS["Stardiver"] = set_combine(sets.baseWS, {})
    sets.precast.WS["Camlann's Torment"] = set_combine(sets.baseWS, {})
    sets.precast.WS["Sonic Thrust"] = set_combine(sets.baseWS, {})
    sets.precast.WS["Drakesbane"] = set_combine(sets.baseWS, {})
    sets.precast.WS["Impulse Drive"] = set_combine(sets.baseWS, {})
    sets.precast.WS["Raiden Thrust"] = set_combine(sets.baseWS, {})

    -- Job Ability Sets --
    sets.precast.JA['Jump'] = set_combine(sets.baseJump, {})
    sets.precast.JA['High Jump'] = set_combine(sets.baseJump, {})
    sets.precast.JA['Spirit Jump'] = set_combine(sets.baseJump, {})
    sets.precast.JA['Soul Jump'] = set_combine(sets.baseJump, {})
    sets.precast.JA['Angon'] = { ammo = "Angon" }
    sets.precast.JA['Spirit Surge'] = { body = "Vishap Mail +2" }
    sets.precast.JA['Steady Wing'] = { body = "Vishap Mail +2" }
    sets.precast.JA['Ancient Circle'] = { legs = "Vishap Brais +2" }
    sets.precast.JA['Spirit Link'] = { head = "Vishap Armet +2" }

    -- Casting Sets --
    sets.precast.FC = { ammo = "Impatiens" }
	sets.midcast = { ammo = "Voluspa Tathlum", head = "Vishap Armet +2", neck = "Dragoon's Collar" }
    sets.midcast.Pet = { ammo = "Voluspa Tathlum", head = "Vishap Armet +2", legs = "Vishap Brais +2", neck = "Dragoon's Collar" }
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
		[1] = {name="Tank", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseTank)},
		-- TODO: more modes ???
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Shining One", set={main="Shinging One", sub="Utu Grip"}},
		[1] = {name="Naegling", set={main="Naegling", sub=empty}},
		-- TODO: more modes ???
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
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
	-- you had nothing in your old lua for this function. its a placeholder i guess
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	--Setup any binds that are ONLY for this job

	--Set default macro book / page
    --TODO: adjust these macro books / pages because i'm guessing wildly
	if player.sub_job == 'SAM' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 1)
	elseif player.sub_job == 'DRK' then
		set_macro_page(3, 1)
	end

	--TODO: make sure this is the right style lock? also wild guess
	windower.send_command:schedule(4, 'input /lockstyleset 1')
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	local abilRecast = windower.ffxi.get_ability_recasts()
	
	--[[ if spell.name == 'Dismiss' and pet.hpp == 100 then
        eventArgs.cancel = true
        windower.add_to_chat(122, '-- '..pet.name..' is at full health! Cancelling Dismiss! --')
		return
    end ]]

    -- call wyvern handling
	if spell.name == 'Call Wyvern' then
		local spiritLinkRecast = abilRecast[162]
		if pet.isvalid and spiritLinkRecast == 0 then
            eventArgs.cancel = true
            send_command('input /ja "Spirit Link" <me>')
        end
		return
    end

	-- spirit link handling
    if spell.name == 'Spirit Link' then
        if not pet.isvalid then
            eventArgs.cancel = true
            local birdRecast = abilRecast[163]
			if birdRecast == 0 then
				add_to_chat(122, 'No wyvern currently summoned. Using Call Wyvern instead.')
				send_command('input /ja "Call Wyvern" <me>')
			else
				add_to_chat(122, 'Cant spirit link with no bird!')
			end
        end
		return
    end

	--[[ -- jump vs spirit jump handling
	if spell.name == 'Jump' and pet.isvalid then
		local sJumpRecast = abilRecast[166]
		if sJumpRecast == 0 then
			eventArgs.cancel = true
			send_command('input /ja "Spirit Jump" '..tostring(spell.target.raw))
		end
		return
	end

	-- highjump vs soul jump handling
	if spell.name == 'High Jump' and pet.isvalid then
		local soulJumpRecast = abilRecast[167]
		if soulJumpRecast == 0 then
			eventArgs.cancel = true
			send_command('input /ja "Soul Jump" '..tostring(spell.target.raw))
		end
		return
	end ]]
end

--[[ function pet_midcast(spell)
    if spell.english:contains('Breath') then
        equip(sets.midcast.Pet)
		disable('ammo','head','legs','neck')
        enable:schedule(1.2, 'ammo','head','legs','neck')
    end
end ]]

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	--[[ if cmdParams[1]:lower() == 'petcastdone' then
        petcast = false
        equip_current()
    end ]]
end

-------------------------------------------------------------------------------------------------------------------
-- PET STUFF
-------------------------------------------------------------------------------------------------------------------
function pet_change(pet, gain)
    if gain == false and pet.name then
        -- General announcement for when your Wyvern is killed, Dimissed, or eaten by Spirit Surge
        windower.add_to_chat(122, ' -- RIP in peace '..string.upper(pet.name)..' --')
    end
end
--[[ function pet_status_change(new, old)
    if new ~= "Engaged" then
        petcast = false
    end
end ]]

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()

	-- auto equip selected weapon set if enemies are dicks (we get disarmed)
	if player.equipment.main == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- handle auto wake with vim torque +1
	if buffactive['Sleep'] and player.status == "Engaged" then 
		send_command('input //gs equip {neck="Vim Torque +1"}')
	elseif player.equipment.neck == "Vim Torque +1" and not buffactive['Sleep'] then
		if player.status == "Engaged" then
			send_command('input //gs equip sets.engaged')
		else
			send_command('input //gs equip sets.idle')
		end
	end

	-- auto buff stuff!
	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		-- Summon bird if no bird
		local birdRecast = abilRecast[163]
		if not pet.isvalid and birdRecast == 0 then
			send_command('input /ja "Call Wyvern" <me>')
			return
		end
		
		--[[ I assume you want to control healing breath if you're playing... but if 
		auto.fite.index = 'On' autoHeal if anyone is below 50% hp? ]]
		if auto.fite[auto.fite.index] == 'On' then
			local birdHealRecast = abilRecast[239]
			local partyInfo = windower.ffxi.get_party()
			for _,info in pairs(partyInfo) do
				if type(info) == 'table' and info.mob then
					local partyMember = info.mob
					if partyMember.hpp < 50 and birdHealRecast == 0 then
						add_to_chat(122, '-- '..partyMember.name..' is hurt! Save them Solaire! --')
						send_command('input /pet "Restoring Breath" <me>')
						return
					end
				end
			end
		end
		
		-- if sub war
		if player.sub_job == 'WAR' then
			local berserkRecast = abilRecast[1]
			local warcryRecast = abilRecast[2]
			local aggressorRecast = abilRecast[4]
		
			-- if autobuff AND autofite is on
			if auto.fite[auto.fite.index] == 'On' then
				-- don't use berserk if we're in tank mode?  Because damage is scary?
				if not gearMode[gearMode.index].name:contains('Tank') then
					if not buffactive['Berserk'] and berserkRecast == 0 then
						send_command('input /ja "Berserk" <me>')
						return
					end
				end

				-- don't use warcry if we have warcry or blood rage active
				if not buffactive['Warcry'] and not buffactive['Blood Rage'] and warcryRecast == 0 then
					send_command('input /ja "Warcry" <me>')
					return
				end

				if not buffactive['Aggressor'] and aggressorRecast == 0 then
					send_command('input /ja "Aggressor" <me>')
					return
				end
			end
		end
		
		-- if sub sam
		if player.sub_job == 'SAM' then
			local hassoRecast = abilRecast[138]
			local sekkRecast = abilRecast[140]

			if not buffactive['Hasso'] and hassoRecast == 0 then
				send_command('input /ja "Hasso" <me>')
				return
			end

			-- if autobuff AND autofite is on
			if auto.fite[auto.fite.index] == 'On' then
				if not buffactive['Sekkanoki'] and sekkRecast == 0 then
					send_command('input /ja "Sekkanoki" <me>')
					return
				end
			end
		end

		--if sub drk
		if player.sub_job == 'DRK' then
			local lastresortRecast = abilRecast[87]
			
			-- if autobuff AND autofite is on
			if auto.fite[auto.fite.index] == 'On' then
				-- don't use last resort if we're in tank mode?  Because damage is scary?
				if not gearMode[gearMode.index].name:contains('Tank') then
					if not buffactive['Last Resort'] and lastresortRecast == 0 then
						send_command('input /ja "Last Resort" <me>')
						return
					end
				end
			end
		end
	end
end