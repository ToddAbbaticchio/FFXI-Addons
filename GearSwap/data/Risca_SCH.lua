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
	gear.nukeCape = {name="Lugh's Cape", augments={'"Regen"+5'}}
	gear.fcCape = {name="Lugh's Cape", augments={'"Fast Cast"+10'}}

	sets.Nuke = {                         --Burst Bonus
		--main = "Akademos",                --10
		--sub = "Enki Strap",
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",                --07
		body = "Agwu's Robe",               --10
		hands = "Amalric Gages +1",         --6*
		legs = "Agwu's Slops",              --09
		feet = "Agwu's Pigaches",           --06
		neck = "Argute Stole +1",           --07
		waist = "Eschan Stone",
		left_ear = "Malignance Earring",
		right_ear = "Barkaro. Earring",
		left_ring = "Freke Ring",
		right_ring = "Mujin Band",          --5*
		back=gear.nukeCape,               
	}

	sets.FreeNuke = {                         --Burst Bonus
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",                --07
		body = "Agwu's Robe",               --10
		hands = "Amalric Gages +1",         --6*
		legs = "Agwu's Slops",              --09
		feet = "Agwu's Pigaches",           --06
		neck = "Argute Stole +1",           --07
		waist = "Eschan Stone",
		left_ear = "Malignance Earring",
		right_ear = "Barkaro. Earring",
		left_ring = "Freke Ring",
		right_ring = "Stikini Ring +1",          --5*
		back=gear.nukeCape,
	}

	sets.Cure = {
		--main = "Daybreak",
		--sub = "Sors Shield",
		ammo = "Pemphredo Tathlum",
		head = "Pinga Crown",
		body = "Jhakri Robe +2",
		hands = "Telchine Gloves",
		legs = "Jhakri Slops +2",
		feet = "Jhakri Pigaches +2",
		neck = "Sanctity Necklace",
		waist = "Eschan Stone",
		left_ear = "Malignance Earring",
		right_ear = "Hecate's Earring",
		left_ring = "Freke Ring",
		right_ring = "Acumen Ring",
		back = "Pahtli Cape",
	}
	sets.precast.FC = {
		ammo = "Impatiens",
		head = "Merlinic Hood",
		body = "Merlinic Jubbah",
		hands = "Pinga Mittens",
		legs = "Jhakri Slops +2",
		feet = "Merlinic Crackows",
		neck = "Orunmila's Torque",
		waist = "Witful Belt",
		left_ear = "Malignance Earring",
		right_ear = "Loquac. Earring",
		left_ring = "Kishar Ring",
		right_ring = "Jhakri Ring",
		back=gear.fcCape,
	}
	sets.baseIdle = {
        --main = "Daybreak",
		--sub = "Genmei Shield",
		ammo = "Homiliary",
        head = "Befouled Crown",
        body = "Agwu's Robe",
        --hands="Kaykaus Cuffs +1",
        --legs="Amalric Slops +1",
        --feet="Kaykaus Boots +1",
        neck = "Loricate Torque +1",
        --ear1="Loquacious Earring",
        --ear2="Etiolation Earring",
        ring1 = "Karieyh Ring +1",
        ring2 = "Defending Ring",
        --back="Fi Follet Cape +1",
        waist = "Fucho-no-Obi",
	}
    sets.precast.WS['Myrkr'] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Amalric Doublet +1",
        hands = "Kaykaus Cuffs +1",
        legs = "Amalric Slops +1",
        feet = "Kaykaus Boots +1",
        neck = "Orunmila's Torque",
        ear1 = "Loquacious Earring",
        ear2 = "Etiolation Earring",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = "Fi Follet Cape +1",
        waist = "Shinjutsu-no-Obi +1",
    }
	sets.baseTank = {
		ammo = "Homiliary",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Loricate Torque +1",
        --ear1="Loquacious Earring",
        --ear2="Etiolation Earring",
        ring1 = "Karieyh Ring +1",
        ring2 = "Defending Ring",
        --back="Fi Follet Cape +1",
        waist = "Fucho-no-Obi",
	
	}
	
	sets.DarkArtsWeapons = {main="Akademos",sub="Enki Strap"}
	sets.LightArtsWeapons = {main="Daybreak",sub="Genmei Shield"}
	sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
	sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

	sets.emSkill = {head="Befouled Crown", neck="Incanter's Torque", waist="Olympus Sash", ear1="Mimir Earring", ear2="Andoaa Earring", body="Telchine Chas.",}
	sets.enfeebSkill = {neck="Incanter's Torque", head="Befouled Crown", ring1="Kishar Ring", ring2="Jhakri Ring"}
	sets.magicAcc = {}

	sets.moveSpeed = {feet="Desert Boots"}
	sets.obi = {waist="Hachirin-no-obi"}
	sets.precast.FC['Cure'] = set_combine(sets.precast.FC, {back="Pahtli Cape"})
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash",})
	sets.emDuration = {waist="Embla Sash", legs="Telchine Braconi", body="Telchine Chas.", feet="Telchine Pigaches", hands="Telchine Gloves"}

	-- JA Sets
	sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3"}
    sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"}
    sets.precast.JA['Sublimation'] = {waist="Embla Sash",}

	sets.midcast['Elemental Magic'] = sets.Nuke
	sets.midcast['Enhancing Magic'] = set_combine(sets.emSkill, sets.emDuration)
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Elemental Magic'], sets.enfeebSkill)
	sets.midcast['Cure'] = {hands="Telchine Gloves",}
	sets.midcast['Aspir'] = set_combine(sets.midcast['Enfeebling Magic'], {main="Rubicundity",waist="Fucho-no-Obi", left_ring="Evanescence Ring", feet="Merlinic Crackows", head="Pixie Hairpin +1"})
	sets.midcast['Drain'] = set_combine(sets.midcast['Enfeebling Magic'], {main="Rubicundity",waist="Fucho-no-Obi", left_ring="Evanescence Ring", feet="Merlinic Crackows", head="Pixie Hairpin +1"})

	-- These should all be under 'Enhancing Magic' but dont get picked up for some reason
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {head="Arbatel Bonnet +1", main="Bolelabunga"})
	sets.midcast['Refresh'] = sets.midcast['Enhancing Magic']
	sets.midcast['Haste'] = sets.midcast['Enhancing Magic']
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {feet="Dream Boots +1"})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {hands="Dream Mittens +1"})
	sets.midcast['Deodorize'] = sets.midcast['Enhancing Magic']

-------------------------------------------------------------------------------------------------------------------
-- Setup various toggle modes
-------------------------------------------------------------------------------------------------------------------
	--Setup gearMode
	sets.gearMode = {}
    sets.gearMode.index = {'DPS','DT'}
    gearMode_ind = 1
	
	--Setup modeMod
	sets.modeMod = {}
	sets.modeMod.index = {'FreeNuke','Burst'}
	modeMod_ind = 1

	--Setup autoBuff
	sets.autoBuff = {}
	sets.autoBuff.index = {'Off','On'}
	autoBuff_ind = 1

	--Setup elementMode
	sets.eleMode = {}
    sets.eleMode.index = {'Earth','Water','Wind','Fire','Ice','Lightning','Light','Dark'}
    eleMode_ind = 1

	--Setup autoFite
	autoFite = 0

	update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.modeMod.index[modeMod_ind])
	update_eleMode(sets.eleMode.index[eleMode_ind])
end

-------------------------------------------------------------------------------------------------------------------
function job_setup()
	spellStep = {
		['Stone'] = {'Stone','Stone II','Stone III','Stone IV','Stone V'},
		['Water'] = {'Water','Water II','Water III','Water IV','Water V'},
		['Aero'] = {'Aero','Aero II','Aero III','Aero IV','Aero V'},
		['Fire'] = {'Fire','Fire II','Fire III','Fire IV','Fire V'},
		['Blizzard'] = {'Blizzard','Blizzard II','Blizzard III','Blizzard IV','Blizzard V'},
		['Thunder'] = {'Thunder','Thunder II','Thunder III','Thunder IV','Thunder V'},
		['Aspir'] = {'Aspir','Aspir II','Aspir III'},
		['Sleep'] = {'Sleep','Sleep II'},
		['Cure'] = {'Cure','Cure II','Cure III','Cure IV'}
	}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
function user_setup()
	--Setup my binds
	send_command('bind F9 gs c toggleGearMode')
	send_command('bind F10 gs c toggleModeMod')
	send_command('bind F11 gs c toggleAutoBuff')
	send_command('bind F12 input //gs reload')
    send_command('bind ^= gs c usehelix')
	send_command('bind != gs c usestorm')
    send_command('bind ^insert gs c eleUp')
    send_command('bind ^delete gs c eleDown')

	--Set default macro book / page
    set_macro_page(1, 4)

	--Set style lock
	windower.send_command('wait 2; input /lockstyleset 4')
end

-------------------------------------------------------------------------------------------------------------------
function user_unload()
    send_command('unbind ^=')
	send_command('unbind !=')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind F9')
	send_command('unbind ^F9')
	send_command('unbind F10')
	send_command('unbind F11')
	send_command('unbind F12')
end

-------------------------------------------------------------------------------------------------------------------
-- Precast
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	-- don't try to do stuff if we can't do stuff
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
		evalState_equipGear()
        return
    end
	
	-- DarkArts --> Addendum: Black
	if spell.english == 'Dark Arts' and buffactive['Dark Arts'] then
		eventArgs.cancel = true
		send_command('input /ja "Addendum: Black" <me>')
		return
	end

	-- LightArts --> Addendum: White
	if spell.english == 'Light Arts' and buffactive['Light Arts'] then
		eventArgs.cancel = true
		send_command('input /ja "Addendum: White" <me>')
		return
	end

	if castMode == 'Light Arts' and autoFite == 1 then
		if strategemCount() >= 1 and buffactive['Regen'] and buffactive['Regain'] and buffactive['Phalanx'] then
			if spell.english == 'Haste' then
				if not (buffactive['Perpetuance']) then
					eventArgs.cancel = true
					send_command('input /ja "Perpetuance" <me>; wait 2; input /ma "'..spell.name..'" '..tostring(spell.target.raw))
					return
				end
			end		
		end
 	end

	-- If the spell name matches one of the groups defined in spellStep, call refineSpells
	for spellGroup,list in pairs(spellStep) do
		if spell.name:startswith(spellGroup) then
			refineSpells(spell, action, spellMap, eventArgs)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Post Midcast
-------------------------------------------------------------------------------------------------------------------
function job_post_midcast(spell, action, spellMap, eventArgs)
	for buff,active in pairs(state.Buff) do
		if active and sets.buff[buff] then
			equip(sets.buff[buff])
        end

	end

	if spell.english:contains('helix') then
		equip({main="Bunzi's Rod",sub="Culminus"})
	end
	if spell.english:contains('Luminohelix') then
		equip({main="Daybreak",sub="Culminus"})
	end

	-- if spell element matches day or weather element, and it's not a weaponskill, use mega obi
	if spell.type ~= 'WeaponSkill' then
		if (spell.element == world.day_element or spell.element == world.weather_element) then
			equip(sets.obi)
			if buffactive['Klimaform'] then
				equip(sets.buff['Klimaform'])
			end
		end
	end
end

function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.english:contains('helix') and not spell.interrupted then helixCast = true end

	if spell.english == 'Light Arts' then
		castMode = 'Light Arts'
		add_to_chat(122,'-- CastMode:'..castMode..' --')
	end
	if spell.english == 'Dark Arts' then
		castMode = 'Dark Arts'
		add_to_chat(122,'-- CastMode:'..castMode..' --')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function job_self_command(cmdParams, eventArgs)
    -- Change current gear mode
	if cmdParams[1]:lower() == 'togglegearmode' then
        gearMode_ind = gearMode_ind + 1
        if gearMode_ind > #sets.gearMode.index then 
			gearMode_ind = 1 
		end
		update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.modeMod.index[modeMod_ind])
		add_to_chat(122,'-- GearMode:' .. sets.gearMode.index[gearMode_ind] .. ' --')
	end
	
	-- Toggle autoBuff on / off
	if cmdParams[1]:lower() == 'toggleautobuff' then
		autoBuff_ind = autoBuff_ind + 1
		if autoBuff_ind > #sets.autoBuff.index then
			autoBuff_ind = 1
		end
		add_to_chat(122,'-- autoBuff:' .. sets.autoBuff.index[autoBuff_ind] .. ' --')
	end
	
	-- Change current modeMod
	if cmdParams[1]:lower() == 'togglemodemod' then
        modeMod_ind = modeMod_ind + 1
        if modeMod_ind > #sets.modeMod.index then 
			modeMod_ind = 1 
		end
		update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.modeMod.index[modeMod_ind])
		add_to_chat(122,'-- ModeMod:' .. sets.modeMod.index[modeMod_ind] .. ' --')
	end
	
	-- Handle autoMovement Detection
	if cmdParams[1]:lower() == 'moveaction' then
		if (buffactive["Sandstorm"] or world.weather_element == "Earth") and moving then
			equip(sets.moveSpeed)
		end 

		if not moving then
			evalState_equipGear()
		end
	end

	-- Cycle Ele Up or Down
	if cmdParams[1]:lower() == 'eleup' then
		if sets.autoBuff.index[autoBuff_ind] == 'On' then
			autoBuff_ind = 1
			add_to_chat(122,'-- autoBuff set to ' .. sets.autoBuff.index[autoBuff_ind] .. ' --')
		end
		eleMode_ind = eleMode_ind + 1
		if eleMode_ind > #sets.eleMode.index then
			eleMode_ind = 1
		end
		update_eleMode(sets.eleMode.index[eleMode_ind])
	end 
	if cmdParams[1]:lower() == 'eledown' then
		if sets.autoBuff.index[autoBuff_ind] == 'On' then
			autoBuff_ind = 1
			add_to_chat(122,'-- autoBuff set to ' .. sets.autoBuff.index[autoBuff_ind] .. ' --')
		end
		eleMode_ind = eleMode_ind - 1
		if eleMode_ind < 1 then
			eleMode_ind = #sets.eleMode.index
		end
		update_eleMode(sets.eleMode.index[eleMode_ind])
	end 

	-- Use currently selected Helix
	if cmdParams[1]:lower() == 'usehelix' then
		send_command('input /ma "'..helix..' II" <t>')
	end

	-- Use currently selected Storm
	if cmdParams[1]:lower() == 'usestorm' then
		send_command('input /ma "'..weather..' II" <me>')
	end

	if cmdParams[1]:lower() == 'autofite' then
		autoFite = autoFite + 1
		if autoFite > 1 then autoFite = 0 end
		add_to_chat(122, '-- autoFite set to: '..autoFite)
	end

	-- test thing
	if cmdParams[1]:lower() == 'test' then
		add_to_chat(122,'-- dayElement:' ..world.day_element.. ' --')
		sets.eleMode.index = world.day_element
		update_eleMode(sets.eleMode.index)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Elemental Mode Handling
-------------------------------------------------------------------------------------------------------------------
function update_eleMode(currElement)
	if currElement == 'Earth' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Geohelix'
		weather = 'Sandstorm'
		freeCastNuke = 'Stone V'
	elseif currElement == 'Water' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Hydrohelix'
		weather = 'Rainstorm'
		freeCastNuke = 'Water V'
	elseif currElement == 'Wind' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Anemohelix'
		weather = 'Windstorm'
		freeCastNuke = 'Aero V'
	elseif currElement == 'Fire' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Pyrohelix'
		weather = 'Firestorm'
		freeCastNuke = 'Fire V'
	elseif currElement == 'Ice' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Cryohelix'
		weather = 'Hailstorm'
		freeCastNuke = 'Blizzard V'
	elseif currElement == 'Lightning' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Ionohelix'
		weather = 'Thunderstorm'
		freeCastNuke = 'Thunder V'
	elseif currElement == 'Light' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Luminohelix'
		weather = 'Aurorastorm'
		freeCastNuke = 'Thunder V'
	elseif currElement == 'Dark' then
		add_to_chat(122,'-- '..currElement..' --')
		helix = 'Noctohelix'
		weather = 'Voidstorm'
		freeCastNuke = 'Thunder V'
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Idle / Engaged set handling
-------------------------------------------------------------------------------------------------------------------
function update_IdleEngagedSets(gearMode, modeModifier)
	if gearMode == 'DPS' then
		sets.idle = set_combine(sets.Nuke, sets.baseIdle)
		sets.engaged = sets.idle
	end

	if gearMode == 'DT' then
		sets.idle = set_combine(sets.Nuke, sets.baseIdle, sets.baseTank)
		sets.engaged = sets.Idle
	end
	
	if modeModifier == 'Burst' then
		equip{main="Akademos", sub="Enki Strap"}
		disable('main', 'sub')
		sets.midcast['Elemental Magic'] = sets.Nuke
	else
		enable('main', 'sub')
		sets.midcast['Elemental Magic'] = sets.FreeNuke
	end
	evalState_equipGear()
end

-------------------------------------------------------------------------------------------------------------------
-- Equip gear based on state
-------------------------------------------------------------------------------------------------------------------
function evalState_equipGear()
	if player.status == 'Idle' then
		equip(sets.idle)
    else
		equip(sets.engaged)
	end
	equip(sets.baseWeaps)
end

-------------------------------------------------------------------------------------------------------------------
-- When we gain a buff, add it to the state.Buff array - When we lose one remove it from array
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
	if state.Buff[buff] == nil and active then
		state.Buff[buff] = true
	else
		state.Buff[buff] = nil
	end

	-- Handle weapons based on light arts vs dark arts
	if buff == 'Light Arts' and active then
		sets.baseWeaps = sets.LightArtsWeapons
		evalState_equipGear()
		windower.send_command('wait 1; input /lockstyleset 5')
	end
	if buff == 'Dark Arts' and active then
		sets.baseWeaps = sets.DarkArtsWeapons
		evalState_equipGear()
		windower.send_command('wait 1; input /lockstyleset 4')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Refine Spells
-------------------------------------------------------------------------------------------------------------------
function refineSpells(spell)
	local recast = windower.ffxi.get_spell_recasts()
	if recast[spell.recast_id] > 0 then
		for key,spellList in pairs(spellStep) do
			if spell.name:startswith(key) then
				for _ in pairs(spellList) do
					local index = table.find(spellStep[key],spell.name)
					if index > 1 then
						local altSpell = spellList[index - 1]
						send_command('@input /ma "'..altSpell..'" '..tostring(spell.target.raw))
						return
					end
				end
			end
		end
	end
end

function strategemCount()
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]
    local maxStrategems = 5
    local fullRechargeTime = maxStrategems * 33
    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
    return currentCharges
end

--[[ function spellHelper(spell, target, ...)
	local args = {...}
	local stratsRequired = #args
	local delay = 0

	-- cast the required strategems
	for _,arg in pairs(args) do
        if not buffactive[arg] then
			if strategemCount() >= 1 then
				send_command('/ja '..arg..' <me>')
			end
			return
		end
    end

	-- if we've got all the strategems cast the spell
	send_command('/ma '..spell..' '..target)
end ]]

function buffIdActive(buffId)
	local currentBuffs = windower.ffxi.get_player().buffs
	for _, v in pairs(currentBuffs) do
		if v == buffId then
			return true
		end
	end
	return false
end

-------------------------------------------------------------------------------------------------------------------
-- Auto tic ~once per second
-------------------------------------------------------------------------------------------------------------------
slowTick = 0
castingTic = 0
castInProgress = false
spellHelperLock = false

if buffactive['Light Arts'] or buffactive['Addendum: White'] then
	castMode = 'Light Arts'
elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
	castMode = 'Dark Arts'
else
	castMode = 'none'
end
add_to_chat(122,'-- CastMode:'..castMode..' --')

windower.raw_register_event('postrender',function()
	slowTick = slowTick + 1;
	if slowTick > 60 then
		-- requip weapons if monsters are assholes
		if player.equipment.sub == "empty" then
			send_command('input //gs c autoweap')
		end
		
		-- autoBuff spells here. Won't cast if you're moving or already casting something else.
		if sets.autoBuff.index[autoBuff_ind] == 'On' then
			-- Sublimation Handling
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and abil_recasts[234] == 0 then
				send_command('input /ja "Sublimation" <me>')
			end
			if buffactive['sublimation: complete'] and player.mpp < 25 and abil_recasts[234] == 0 then
				add_to_chat(122,'-- MP below 25% - Popping Sublimation! --')
				send_command('input /ja "Sublimation" <me>')
			end

			-- Myrkr!
			if player.mpp < 40 and player.tp > 2500 then
				add_to_chat(122,'-- Myrkr! --')
				send_command('input /ws "Myrkr" <me>')
			end

			-- Maintain cast Mode
			if not buffactive['Addendum: White'] and not buffactive['Addendum: Black'] then
				send_command(castMode)
			end
			
			-- LightArts
			if buffactive['Light Arts'] or buffactive['Addendum: White'] then
				-- regen
				if not castInProgress and strategemCount() >= 2 then
					if not buffIdActive(42) then
						castInProgress = true
						send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Regen V" <me>')
						castingTic = castingTic + 1
					end
				end
				
				-- regain
				if not castInProgress and strategemCount() >= 2 then
					if not buffactive['Regain'] then
						castInProgress = true
						send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Adloquium" <me>')
						castingTic = castingTic + 1
					end
				end

				-- phalanx
				if not castInProgress and strategemCount() >= 2 then
					if not buffactive['Phalanx'] then
						castInProgress = true
						send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Phalanx" <me>')
						castingTic = castingTic + 1
					end
				end

				if autoFite == 1 then
					-- prot
					if not castInProgress and strategemCount() >= 2 then
						if not buffactive['Protect'] then
							castInProgress = true
							send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Protect V" <me>')
							castingTic = castingTic + 1
						end
					end

					-- shell
					if not castInProgress and strategemCount() >= 2 then
						if not buffactive['Shell'] then
							castInProgress = true
							send_command('input /accession; wait 2; input /ma "Shell V" <me>')
							castingTic = castingTic + 1
						end
					end

					--[[ -- weather
					if not castInProgress and strategemCount() >= 2 then
						if not buffactive['Hailstorm'] then
							castInProgress = true
							send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Hailstorm II" <me>')
							castingTic = castingTic + 1
						end
					end ]]
				end 

				--[[ -- refresh
				if not castInProgress and strategemCount() >= 2 then
					if not buffactive['Refresh'] then
						castInProgress = true
						send_command('/perpetuance')
						send_command:schedule(2, '/accession')
						send_command:schedule(4, '/refresh')
						--send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Refresh" <me>')
						castingTic = castingTic + 1
					end
				end ]]

				--[[ -- barwater
				if not castInProgress and strategemCount() >= 2 then
					if not buffactive['Barwater'] then
						castInProgress = true
						send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Barwater" <me>')
						castingTic = castingTic + 1
					end
				end
				-- barpoison
				if not castInProgress and strategemCount() >= 2 then
					if not buffactive['Barpoison'] then
						castInProgress = true
						send_command('input /perpetuance; wait 2; input /accession; wait 2; input /ma "Barpoison" <me>')
						castingTic = castingTic + 1
					end
				end ]]
			end
			
			-- DarkArts
			if buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
				-- Weather Effect Handling
				if not castInProgress and not buffactive[weather] then
					add_to_chat(122,'-- '.. weather .. ' is down. Casting! --')
					send_command('input //gs c usestorm')
					castInProgress = true
					castingTic = castingTic + 1
				end
				
				-- Klimaform Handling
				if not castInProgress and not buffactive['Klimaform'] then
					add_to_chat(122,'-- Klimaform is down. Casting! --')
					send_command('input /ma "Klimaform" <me>')
					castInProgress = true
					castingTic = castingTic + 1
				end
				
				--[[ local player = windower.ffxi.get_player()
				if player.status == 1 and not castInProgress and strategemCount() >= 1 then
					if not helixCast then
						local recast = windower.ffxi.get_spell_recasts()
						if recast[890] == 0 then
							send_command('input /ebullience; wait 2; input //gs c usehelix')
							castInProgress = true
							castingTic = castingTic + 1
						end
					elseif strategemCount() >= 4 then
						send_command('input /ebullience; wait 2; input //ma '..freeCastNuke..' <t>')
						castInProgress = true
						castingTic = castingTic + 1
					end
				end ]]
			end

			-- Don't try to cast a spell when we're mid-cast for something else	
			if castingTic > 0 then
				castingTic = castingTic + 1
			end
			if castingTic >= 8 then
				castInProgress = false
				castingTic = 0
			end
		end
	slowTick = 0
	end
end)

-------------------------------------------------------------------------------------------------------------------
-- Detect movement / equip fast pants
-------------------------------------------------------------------------------------------------------------------
mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter > 5 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
            if movement and not moving then
				moving = true
			    send_command('input //gs c moveaction')
            elseif not movement and moving then
				moving = false
			    send_command('input //gs c moveaction')
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
	end
end)

-------------------------------------------------------------------------------------------------------------------
-- Turn off autoBuff when we zone
-------------------------------------------------------------------------------------------------------------------
windower.register_event('zone change', function()
	if sets.autoBuff.index[autoBuff_ind] == 'On' then
		autoBuff_ind = 1
		add_to_chat(122,'-- autoBuff set to ' .. sets.autoBuff.index[autoBuff_ind] .. ' --')
	end
end)

-------------------------------------------------------------------------------------------------------------------
-- Day change
-------------------------------------------------------------------------------------------------------------------
--[[ windower.register_event('day change', function()
	sets.eleMode.index = world.day_element
	update_eleMode(sets.eleMode.index)
end) ]]