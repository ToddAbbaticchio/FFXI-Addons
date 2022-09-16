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
	gear.STRCape = {}
	gear.CASTCape = {}

	sets.baseMelee = {
		ammo="Happo Shuriken",
		head="Hiza. Somen +2",
		body="Hiza. Haramaki +2",
		hands="Hizamaru Kote +2",
		legs="Samnuha Tights",
		feet="Hiza. Sune-Ate +2",
		neck="Combatant's Torque",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Epona's Ring",
		right_ring="Rajas Ring",
		back="Lupine Cape",
	}
	sets.baseWS = {
		ammo="Voluspa Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Hiza. Hizayoroi +2",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Odr Earring",
		left_ring="Karieyh Ring +1",
		right_ring="Gere Ring",
		back="Lupine Cape",
	}
	sets.baseTank = {}
	sets.baseEnmity = {                   --Toal: 74
		ammo="Aqreaqa Bomblet",           --2
		--head="Halitus Helm",              --8
		body="Emet Harness +1",           --10
		hands="Futhark Mitons +3",        --6
		legs="Erilaz Leg Guards +1",      --11
		feet="Erilaz Greaves",            --5
		neck="Moonbeam Necklace",         --10
		waist="Warwolf Belt",             --3
		left_ear="Cryptic Earring",       --4
		right_ear="Friomisi Earring",     --2
		left_ring="Petrov Ring",          --4
		right_ring="Vengeful Ring",       --3
		back="Earthcry Mantle",           --7
	}
	sets.interrupt = {                    --Total: 73 (at 103% you literally can not be interrupted)
		-- level 5 merits                 --10
		ammo="Impatiens",                 --10
		hands="Rawhide Gloves",           --15 
		neck="Moonbeam Necklace",         --10
		waist="Audumbla Sash",            --10
		left_ear="Halasz Earring",        --05
		right_ear="Magnetic Earring",     --08
		right_ring="Evanescence Ring",    --05
	}

	-- Idle and initial engaged set
    sets.baseIdle = {right_ring="Defending Ring",left_ring="Karieyh Ring +1",}

	-- JA Sets
	sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
    sets.precast.JA['Futae'] = {hands="Hattori Tekko"}
    sets.precast.JA['Sange'] = {body="Mochizuki Chainmail +3" }
    sets.precast.JA['Provoke'] = sets.baseEnmity

	-- WS Sets
	sets.precast.WS['Blade: Jin'] = set_combine(sets.baseWS, {neck="Breeze Gorget",waist="Breeze Belt",})
    sets.precast.WS['Blade: Ten'] = set_combine(sets.baseWS, {neck="Shadow Gorget",waist="Shadow Belt",})
	sets.precast.WS['Blade: Ku'] = set_combine(sets.baseWS, {neck="Shadow Gorget",waist="Shadow Belt",})
	sets.precast.WS['Blade: Shun'] = set_combine(sets.baseWS, {neck="Breeze Gorget",waist="Breeze Belt",})
	sets.precast.WS['Blade: Kamu'] = set_combine(sets.baseWS, {neck="Breeze Gorget",waist="Breeze Belt",})
    sets.precast.WS['Blade: Hi'] = set_combine(sets.baseWS, {neck="Shadow Gorget",waist="Shadow Belt",})
	sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {neck="Breeze Gorget",waist="Breeze Belt",})

    -- Fast cast sets for spells
    sets.precast.FC = {right_ear="Loquac. Earring",left_ear="Etiolation Earring",neck="Orunmila's Torque",ammo="Impatiens"}

	-- Midcast Sets for spells that need special handling
    sets.midcast['Utsusemi'] = set_combine(sets.interrupt, {neck="Magoraga Beads"})

-------------------------------------------------------------------------------------------------------------------
-- Setup various toggle modes
-------------------------------------------------------------------------------------------------------------------
	--Setup gearMode
	sets.gearMode = {}
    sets.gearMode.index = {'Tank','DPS'}
    gearMode_ind = 2
	
	--Setup weaponMode
	sets.weaponMode = {}
	sets.weaponMode.index = {'Tank','DPS'}
	weaponMode_ind = 2

	--Setup modeMod
	sets.modeMod = {}
	sets.modeMod.index = {'Engage','CP'}
	modeMod_ind = 1

	--Setup autoBuff
	sets.autoBuff = {}
	sets.autoBuff.index = {'Off','On'}
	autoBuff_ind = 1

	--Setup elementMode
	sets.ninSpell = {}
	sets.ninSpell.index = {'Earth','Water','Wind','Fire','Ice','Thunder'}
	ninSpell_ind = 1

	update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.weaponMode.index[weaponMode_ind],sets.modeMod.index[modeMod_ind])
	update_currNinSpell(sets.ninSpell.index[ninSpell_ind])
end

-------------------------------------------------------------------------------------------------------------------
function job_setup()
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
    send_command('bind ^= gs c ninspell')
    send_command('bind ^insert gs c toggleninspell')
    send_command('bind ^delete gs c togglebackninspell')

	--Other initial setup
	select_default_macro_book()

	--Set style lock
	windower.send_command('wait 2; input /lockstyleset 9')
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
        return
    end
	
	if spellMap == 'Utsusemi' then
		-- Stop me from casting utsusemi if i have 3+ shadows
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
		-- If i have 2 or 1 shadows, auto cancel shadows (lower tier utsusemi doesn't overwrite higher tier)
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Select default macro book on initial load or subjob change.
-------------------------------------------------------------------------------------------------------------------
function select_default_macro_book()
    if player.sub_job == 'WAR' then
        set_macro_page(1, 3)
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
		update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.weaponMode.index[weaponMode_ind],sets.modeMod.index[modeMod_ind])
		add_to_chat(122,'-- GearMode:' .. sets.gearMode.index[gearMode_ind] .. ' --')
	end
	
	-- Change current weapon mode
	if cmdParams[1]:lower() == 'toggleweaponmode' then
        weaponMode_ind = weaponMode_ind + 1
        if weaponMode_ind > #sets.weaponMode.index then 
			weaponMode_ind = 1 
		end
		update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.weaponMode.index[weaponMode_ind],sets.modeMod.index[modeMod_ind])
		add_to_chat(122,'-- WeaponMode:' .. sets.weaponMode.index[weaponMode_ind] .. ' --')
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
		update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.weaponMode.index[weaponMode_ind],sets.modeMod.index[modeMod_ind])
		add_to_chat(122,'-- ModeMod:' .. sets.modeMod.index[modeMod_ind] .. ' --')
	end
	
	-- Handle autoMovement Detection
	if cmdParams[1]:lower() == 'moveaction' then
		if moving then
			equip(sets.moveSpeed)
		end
		if not moving then
			evalState_equipGear()
		end
	end

	-- Handle autoWeap Equip
	if cmdParams[1]:lower() == 'autoweap' then
		equip(sets.Weapons)
		add_to_chat(122,'-- Offhand is empty. Equipping weapons! --')
	end

	-- Toggle current ninja spell element
	if cmdParams[1]:lower() == 'toggleninspell' then
		ninSpell_ind = ninSpell_ind + 1
		if ninSpell_ind > #sets.ninSpell.index then
			ninSpell_ind = 1
		end
		update_currNinSpell(sets.ninSpell.index[ninSpell_ind])
	end
	if cmdParams[1]:lower() == 'togglebackninspell' then
		ninSpell_ind = ninSpell_ind - 1
		if ninSpell_ind < 1 then
			ninSpell_ind = #sets.ninSpell.index
		end 
		update_currNinSpell(sets.ninSpell.index[ninSpell_ind])
	end

	-- Cast current element ninja spell
	if cmdParams[1]:lower() == 'ninspell' then
		send_command('@input /ma '.. castSpell ..' <t>')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Elemental Mode Handling
-------------------------------------------------------------------------------------------------------------------
function update_currNinSpell(currSpell)
	if currSpell == 'Earth' then
		castSpell = '"Doton: Ni"'
	elseif currSpell == 'Water' then
		castSpell = '"Suiton: Ni"'
	elseif currSpell == 'Wind' then
		castSpell = '"Huton: San"'
	elseif currSpell == 'Fire' then
		castSpell = '"Katon: Ni"'
	elseif currSpell == 'Ice' then
		castSpell = '"Hyoton: San"'
	elseif currSpell == 'Thunder' then
		castSpell = '"Raiton: Ni"'
	end
	
	add_to_chat(122,'-- ninSpell set to ' .. sets.ninSpell.index[ninSpell_ind] .. ' --')
end

-------------------------------------------------------------------------------------------------------------------
-- Idle / Engaged set handling
-------------------------------------------------------------------------------------------------------------------
function update_IdleEngagedSets(gearMode, weaponMode, modeModifier)
	if gearMode == 'DPS' then
		sets.idle = set_combine(sets.baseMelee, sets.baseIdle)
		sets.engaged = sets.baseMelee
	elseif gearMode == 'Tank' then
		sets.idle = set_combine(sets.baseTank, sets.baseIdle)
		sets.engaged = sets.baseTank
	end
	
	if modeModifier == 'CP' then
		if sets.gearMode.index[gearMode_ind] == 'Tank' then
			sets.idle = set_combine(sets.baseTank, sets.baseIdle, {back="Mecisto. Mantle"})
			sets.engaged = set_combine(sets.baseTank, {back="Mecisto. Mantle"})
		elseif sets.gearMode.index[gearMode_ind] == 'DPS' then
			sets.idle = set_combine(sets.baseMelee, sets.baseIdle, {back="Mecisto. Mantle"})
			sets.engaged = set_combine(sets.baseMelee, {back="Mecisto. Mantle"})
		end
	elseif modeModifier == 'NoEngage' then
		sets.idle = set_combine(sets.baseIdle, sets.baseTank, {left_ear="Etiolation Earring", right_ear="Magnetic Earring"})
		sets.engaged = set_combine(sets.baseTank)
	elseif modeModifer == 'Engage' then
		if sets.gearMode.index[gearMode_ind] == 'Tank' then
			sets.idle = set_combine(sets.baseTank, sets.baseIdle, {back="Mecisto. Mantle"})
			sets.engaged = set_combine(sets.baseTank, {back="Mecisto. Mantle"})
		elseif sets.gearMode.index[gearMode_ind] == 'DPS' then
			sets.idle = set_combine(sets.baseMelee, sets.baseIdle, {back="Mecisto. Mantle"})
			sets.engaged = set_combine(sets.baseMelee, {back="Mecisto. Mantle"})
		end
	end

	if weaponMode == 'DPS' then
		sets.weapons = {main="Eletta Katana",sub="Jushimatsu"}
	elseif weaponMode == 'Tank' then
		sets.weapons = {main="Eletta Katana",sub="Jushimatsu"}
	end
	
	evalState_equipGear()
end

-------------------------------------------------------------------------------------------------------------------
-- Equip gear based on state
-------------------------------------------------------------------------------------------------------------------
function evalState_equipGear()
	if player.status == 'Idle' then
		equip(sets.idle)
--		equip(sets.weapons)
    else
		equip(sets.engaged)
--		equip(sets.weapons)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Auto tic ~once per second
-------------------------------------------------------------------------------------------------------------------
slowTick = 0
castingTic = 0
castInProgress = false

windower.raw_register_event('postrender',function()
	slowTick = slowTick + 1;
	if slowTick > 60 then
		-- requip weapons if monsters are assholes
		if player.equipment.sub == "empty" then
			send_command('input //gs c autoweap')
		end
		
		-- autoBuff spells here. Won't cast if you're moving or already casting something else.
		if sets.autoBuff.index[autoBuff_ind] == 'On' then
			if not moving then
				-- Shadows
				if not castInProgress then
					if not buffactive['Copy Image'] then
						add_to_chat(122,'-- Shadows down. Trying to recast...--')
						send_command('input /ma "Utsusemi: Ni" <me>')
						castInProgress = true
						castingTic = castingTic + 1
					end
				end
			end
				
			-- Don't try to cast a spell when we're mid-cast for something else	
			if castingTic > 0 then
				castingTic = castingTic + 1
			end
			if castingTic == 8 then
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


