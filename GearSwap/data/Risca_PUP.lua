include('RST\\sharedFunctions.lua')

-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
	sets.masterTP = {
		head="Malignance Chapeau",
		hands="Malignance Gloves",
		body="Malignance Tabard",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Shulmanu Collar",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Epona's Ring",
		right_ring="Niqmaddu Ring",
		back="Visucius's Mantle",
	}

	sets.pupTP = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Shulmanu Collar",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back="Visucius's Mantle",
	}

	sets.masterWS = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Hizamaru Hizayoroi +2",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Telos Earring",
		right_ear="Moonshade Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back="Visucius's Mantle",
	}
	
	sets.masterDEF = {
		head="Nyame Helm",                --07
		body="Nyame Mail",                --09
		hands="Nyame Gauntlets",          --07
		legs="Nyame Flanchard",           --08
		feet="Nyame Sollerets",           --07
		neck="Combatant's Torque",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Defending Ring",       --10
		right_ring="Varar Ring +1",
		--back=gear.STRCape,
	}
	
	sets.pupWS = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Visucius's Mantle",
	}

	-- Idle and initial engaged set
    sets.baseIdle = sets.masterTP
	sets.baseEngaged = sets.masterTP

	-- Random one-off sets or small sets
	sets.moveSpeed = {feet="Hermes' Sandals"}
	sets.wakeUp = {}
	sets.obi = {}
	sets.pupOil = {ammo="Automat. Oil +3"}

	-- JA Sets

	-- WS Sets
    sets.precast.WS = sets.masterWS
	sets.precast.WS['Shijin Spiral'] = set_combine(sets.masterTP, {neck="Fotia Gorget",waist="Fotia Belt",left_ring="Gere Ring",right_ear="Moonshade Earring",legs="Samnhua Tights"})
	
	sets.midcast.Pet.WS = sets.pupWS

	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="MasterDPS", idle=(sets.masterTP), engaged=(sets.masterTP)},
		[1] = {name="PupDPS", idle=(sets.pupTP), engaged=(sets.pupTP)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Karambit", set={main="Karambit"}},
		[1] = {name="Sakpata's Fists", set={main="Sakpata's Fists"}},
	}

	--Setup autoBuff
	auto = {
		["buff"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		}
	}
	
	evalState_equipGear()
end

-------------------------------------------------------------------------------------------------------------------
function job_setup()
	autoBuffs = {}
	autoBuffs.Maneuvers = S{'Earth Maneuver','Water Maneuver','Wind Maneuver','Fire Maneuver','Ice Maneuver','Thunder Maneuver','Light Maneuver','Dark Maneuver'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
function user_setup()
	--Setup my binds
	send_command('bind F9 gs c toggleGearMode')
	send_command('bind ^F9 gs c toggleWeaponMode')
	send_command('bind F10 gs c toggleModeMod')
	send_command('bind F11 gs c toggleAutoBuff')
	send_command('bind F12 input //gs reload')
    send_command('bind ^= gs c useRune')
	send_command('bind != gs c useBarSpell')
    send_command('bind ^insert gs c runesUp')
    send_command('bind ^delete gs c runesDown')

	--Set default macro book / page
    if player.sub_job == 'WAR' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 3)
    end
	
	--Handle weapons and stylelock based on subjob
	windower.send_command('wait 2; input /lockstyleset 6')
end

-------------------------------------------------------------------------------------------------------------------
-- Precast
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	--local abil_recasts = windower.ffxi.get_ability_recasts()
    --add_to_chat(123, spell.english)
	
	-- don't try to do stuff if we can't do stuff
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
		evalState_equipGear()
        return
    end
	
    -- who the heck even uses /nin?
	if spellMap == 'Utsusemi' then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end

	castInProgress = true
end

function job_midcast(spell, action, spellMap, eventArgs)

end

function job_aftercast(spell, action, spellMap, eventArgs)

	castInProgress = false
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Idle / Engaged set handling
-------------------------------------------------------------------------------------------------------------------
function update_IdleEngagedSets(gearMode, modeModifier)
	--add_to_chat(122,"-- Gear:"..gearMode.." | Mode:"..modeModifier.." --")
	if gearMode == 'Melee' then
		sets.idle = set_combine(sets.masterTP, sets.baseIdle)
		sets.engaged = sets.masterTP
	end
	if gearMode == 'Tank' then
		sets.idle = sets.masterDEF
		sets.engaged = sets.masterDEF
	end
	if gearMode == 'PupTank' then
		sets.idle = set_combine(sets.pupDEF, sets.baseIdle)
		sets.engaged = sets.pupDEF
	end
	
	if modeModifier == 'Normal' then
		evalState_equipGear()
		return
	end
	if modeModifier == 'CP' then
		sets.idle = set_combine(sets.idle, {back="Mecisto. Mantle"})
		sets.engaged = set_combine(sets.engaged, {back="Mecisto. Mantle"})
		evalState_equipGear()
		return
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Auto tic ~once per second
-------------------------------------------------------------------------------------------------------------------
slowTick = 0
windower.raw_register_event('postrender',function()
	slowTick = slowTick + 1;
	if slowTick > 60 then
		-- If I have a pet and I am fighting but he isn't, make him fight
		if windower.ffxi.get_mob_by_target('pet') then
			if windower.ffxi.get_player().status == 1 and windower.ffxi.get_mob_by_target('pet').status == 0 then
				windower.chat.input('/ja "Deploy" <t>')
			end
		end
	
		if auto.buff[auto.buff.index] == 'On' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			
			if player.sub_job == "RUN" then
				if buffactive["Unda"] ~= 2 then
					if not(abil_recasts[92] > 0) then
						send_command('input /ja "Unda" <me>')
					end
				end
			end
			
			if pet.isvalid and pet.hpp < 25 and not (abil_recasts[206] > 0) then
				add_to_chat(122,'-- Using Repair on '..pet.name..'! --')
				send_command('input //gs equip sets.pupOil')
				send_command('input /repair')
			end
		end
		slowTick = 0
	end
end)