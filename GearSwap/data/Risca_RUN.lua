include('rTemplate\\sharedFunctions')

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
	gear.STRCape = {name="Ogma's Cape", augments={'STR + 20'}}
	gear.DEXCape = {name="Ogma's Cape", augments={'DEX + 20'}}
	gear.EvaCape = {name="Ogma's Cape", augments={'AGI + 20'}}
	gear.CASTCape = {name="Ogma's Cape", augments={'Spell interruption rate down-10%'}}
	gear.EnmityCape = {name="Ogma's Cape", augments={'Enmity +10', 'HP + 60'}}
	gear.LungeCape = {name="Ogma's Cape", augments={'INT + 20'}}

	sets.baseMelee = {
		ammo="Yamarang",
		head="Adhemar Bonnet +1",                
		body="Ashera Harness",
		hands="Adhemar Wrist. +1",
		legs="Samnuha Tights",
		feet="Herculean Boots",
		neck="Anu Torque",
		--neck="Combatant's Torque",
		waist="Grunfeld Rope",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		ring1="Epona's Ring",
		--ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back=gear.STRCape,
	}
	sets.baseTank = {                     --Total: 54 | DT44 | PDT10
		ammo="Staunch Tathlum +1",        --DT03
		head="Nyame Helm",                --DT07
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +2",      --DT12
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",         --DT07
		waist="Engraved Belt",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		ring1="Moonlight Ring",           --DT05
		ring2="Defending Ring",           --DT10
		back=gear.STRCape,                --PDT10
	}
	sets.evaTank = {
		ammo="Yamarang",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",        
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",         
		neck="Combatant's Torque",
		waist="Kasiri Belt",
		ear1="Eabani Earring",
		ear2="Infused Earring",
		ring1="Vengeful Ring",
		ring2="Moonlight Ring",
		back=gear.EvaCape,
	}
	sets.magicEvaTank = {
		ammo="Yamarang",
		head="Nyame Helm",                --DT07
		body="Runeist's Coat +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",           --DT08
		feet="Erilaz Greaves +2",
		neck="Futhark Torque +2",         --DT07
		waist="Engraved Belt",
		ear1="Erilaz Earring",
		ear2="Eabani Earring",
		ring1="Moonlight Ring",       --DT05
		ring2="Defending Ring",      --DT10
		back=gear.EnmityCape,
	}
	sets.superTank = {
		ammo="Yamarang",
		head="Nyame Helm",                --DT07
		body="Runeist's Coat +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",           --DT08
		feet="Nyame Sollerets",
		neck="Futhark Torque +2",         --DT07
		waist="Engraved Belt",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		ring1="Moonlight Ring",       --DT05
		ring2="Defending Ring",      --DT10
		back=gear.EnmityCape,
	}
	sets.baseWS = {                                 --Total: haha get wrecked
		ammo="Seeth. Bomblet +1",
		head="Lustratio Cap +1",
		body="Lustr. Harness +1",
		hands="Meg. Gloves +2",
		legs="Lustr. Subligar +1",
		feet="Lustra. Leggings +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Karieyh Ring +1",
		ring2="Niqmaddu Ring",
		back=gear.STRCape,
	}
	sets.baseEnmity = {                             --Toal: 95+23   DT:37+25  (+ from epeo)
		ammo="Aqreqaq Bomblet",           --2
		head="Halitus Helm",              --8
		body="Emet Harness +1",           --10                      P06
		hands="Kurys Gloves",             --9                       02
		legs="Erilaz Leg Guards +2",      --11                      P07
		feet="Erilaz Greaves +2",         --6                       P05
		neck="Futhark Torque +2",         --10                      07
		waist="Kasiri Belt",              --3
		ear1="Cryptic Earring",           --4
		ear2="Friomisi Earring",          --2
		ring1="Eihwaz Ring",              --5
		ring2="Supershear Ring",          --5
		back=gear.EnmityCape,             --10                      P10
	}
	sets.interrupt = set_combine(sets.baseTank, {   --Total: 103
		-- level 5 merits                           --10
		ammo="Impatiens",                           --10
		head="Erilaz Galea +2",                     --15
		body="Herculean Vest",                      --10
		hands="Rawhide Gloves",                     --15 
		legs="Carmine Cuisses +1",                  --20
		--feet
		--neck
		waist="Audumbla Sash",                      --10
		ear1="Halasz Earring",                      --05
		ear2="Magnetic Earring",                    --08
		ring1="Evanescence Ring",                   --05
		ring2="Moonlight Ring",
		back=gear.CASTCape,                         --10
	})
	sets.emSkill = {
		ammo="Aqreqaq Bomblet",
		--head="Carmine Mask",            --10
		--body="Manasa Chasuble", ???
		hands="Runeist's Mitons +3",      --15
		legs="Carmine Cuisses +1",        --18
		feet="Carmine Greaves +1",
		neck="Incanter's Torque",         --10
		waist="Olympus Sash",             --05
		ear1="Andoaa Earring",        --05
		ear2="Mimir Earring",        --10
		ring1="Stikini Ring +1",      --08
		ring2="Stikini Ring +1",     --08
		back="Merciful Cape",             --05
	}
	sets.MagicBurst = {
		ammo="Seeth. Bomblet +1",
		head="Agwu's Cap",
		body="Samnuha Coat",
		hands="Agwu's Gages",
		legs="Agwu's Slops",
		feet="Agwu's Pigaches",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		ring1="Locus Ring",
		ring2="Mujin Band",
		back=gear.LungeCape,
	}
	sets.precast.FC = set_combine(sets.baseTank, {
		ammo="Impatiens",
		head="Rune. Bandeau +3",   --14
		body="Agwu's Robe",        --08
		hands="Leyline Gloves",    --08
		legs="Agwu's Slops",       --07
		feet="Carmine Greaves +1", --08
		neck="Orunmila's Torque",  --05
		ear1="Etiolation Earring", --01
		ear2="Loquac. Earring",    --05
		ring1="Kishar Ring",       --04
		ring2="Defending Ring",
		back=gear.CASTCape,        --10
	})

	-- Random one-off sets or small sets
    sets.baseIdle = set_combine(sets.baseTank, {ring2="Defending Ring",ring1="Karieyh Ring +1",ammo="Homiliary"}) 
	sets.moveSpeed = {legs="Carmine Cuisses +1"}
	sets.wakeUp = {head="Frenzy Sallet"}
	sets.Obi = {waist="Hachirin-no-Obi"}
	sets.TH = {waist='Chaac Belt', head='Wh. Rarab Cap +1', ammo='Per. Lucky Egg', hands="Herculean Gloves"}
	sets.emDuration = {legs="Futhark Trousers +3",head="Erilaz Galea +2",}
	sets.MagicFreeCast = set_combine(sets.MagicBurst, {ring1='Shiva Ring +1', ring2="Shiva Ring +1"})
	sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}

	-- JA Sets
	sets.precast.JA['Odyllic Subgerfuge'] = sets.baseEnmity
    sets.precast.JA['Vallation'] = set_combine(sets.baseEnmity, {body="Runeist's Coat +3",})-- legs="Futhark Trousers +3",})
    sets.precast.JA['Valiance'] = set_combine(sets.baseEnmity, {body="Runeist's Coat +3",})-- legs="Futhark Trousers +3",})
	sets.precast.JA['Pflug'] = sets.baseEnmity
    sets.precast.JA['Battuta'] = set_combine(sets.baseEnmity, {head="Fu. Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.baseEnmity, {body="Futhark Coat +3"})
    sets.precast.JA['Lunge'] = sets.MagicBurst
    sets.precast.JA['Swipe'] = sets.MagicBurst
    sets.precast.JA['Gambit'] = {hands="Runeist's Mitons +3"}
    sets.precast.JA['Rayke'] = {feet="Futhark Boots +1"}
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.baseEnmity, {body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.baseEnmity, {hands="Futhark Mitons +3"})
    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.baseEnmity, {head="Erilaz Galea +2"})
	sets.precast.JA['Weapon Bash'] = set_combine(sets.tank, sets.TH)

	-- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Resolution'] = set_combine(sets.baseWS, {legs="Meg. Chausses +2",ring1="Epona's Ring",ammo="Seeth. Bomblet +1"})
    sets.precast.WS['Dimidiation'] = set_combine(sets.baseWS, {back=gear.DEXCape, body="Adhemar Jacket +1", ammo="Knobkierrie"})
	sets.precast.WS['Shockwave'] = {sets.MagicBurst}
	sets.precast.WS['Fell Cleave'] = set_combine(sets.baseWS, {back=gear.DEXCape,ammo="Knobkierrie"})
	sets.precast.WS['Ground Strike'] = set_combine(sets.baseWS, {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {ring2="Rufescent Ring"})
	sets.precast.WS['Requiescat'] = {sets.baseWS}
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.MagicFreeCast, {head="Pixie Hairpin +1",})

	-- Magic sets
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3", waist="Siegel Sash"})
	sets.midcast['Enhancing Magic'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration)
	sets.midcast['Crusade'] = set_combine(sets.baseTank, sets.interrupt, sets.emDuration)
	sets.midcast['Temper'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration)
    sets.midcast['Phalanx'] = set_combine(sets.baseTank, sets.interrupt, sets.emSkill, sets.emDuration, {head="Fu. Bandeau +3", body="Taeon Tabard", hands="Taeon Gloves", feet="Taeon Boots"})
    sets.midcast['Aquaveil'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration, sets.interrupt, {})
    sets.midcast['Regen'] = set_combine(sets.baseTank, sets.emDuration, {head="Rune. Bandeau +3",neck="Sacro Gorget",waist="Sroda Belt",ear2="Erilaz Earring"})
	sets.midcast['Cure'] = set_combine(sets.baseTank, {waist="Sroda Belt"})
    sets.midcast['Refresh'] = set_combine(sets.baseTank, sets.emDuration, {waist="Gishdubar Sash", head="Erilaz Galea +2",})
	sets.midcast['Cocoon'] = sets.baseTank
	sets.midcast['Stoneskin'] = set_combine(sets.baseTank, sets.emSkill, {waist="Siegel Sash",})
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="Tank", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseTank)},
		[1] = {name="SuperTank", idle=(sets.superTank), engaged=(sets.baseTank)},
		[2] = {name="MagicTank", idle=(sets.magicEvaTank), engaged=(sets.magicEvaTank)},
		[3] = {name="EvaTank", idle=sets.evaTank, engaged=sets.evaTank},
		[4] = {name="DPS", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Epeolatry", set={main="Epeolatry", sub="Utu Grip"}},
		[1] = {name="Lionheart", set={main="Lionheart", sub="Utu Grip"}},
		[2] = {name="Aettir", set={main="Aettir", sub="Utu Grip"}},
		[3] = {name="G-Axe", set={main="Lycurgos", sub="Utu Grip"}},
		[4] = {name="DW-Swords", set={main="Naegling", sub="Reikiko"}},
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
		["rune"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		}
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
    magicMaps = {}
    magicMaps.Enmity = S{'Blank Gaze', 'Jettatura', 'Soporific', 'Blitzstrahl', 'Chaotic Eye', 'Flash', 'Foil', 'Stun'}
	magicMaps.Interrupt = S{'Aquaveil', 'Utsusemi: Ichi', 'Utsusemi: Ni', 'Poisonga', 'Sheep Song', 'Geist Wall'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	--Setup my binds
	send_command('bind ^F11 gs c toggleAutoRune')
	send_command('bind ^= rh useRune')
	send_command('bind != rh useBarSpell')
    send_command('bind ^insert rh runesUp')
    send_command('bind ^delete rh runesDown')

	--Set default macro book / page
    if player.sub_job == 'DRK' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'BLU' then
        set_macro_page(2, 1)
    end
	
	--Load runehelper addon
	windower.send_command('lua load runehelper')

	--Handle weapons and stylelock based on subjob
	if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
		--weaponMode.index = 3
		--equip(weaponMode[weaponMode.index].set)
		windower.send_command:schedule(4, 'input /lockstyleset 2')
	else
		--weaponMode.index = 0
		--equip(weaponMode[weaponMode.index].set)
		windower.send_command:schedule(4, 'input /lockstyleset 1')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	--add_to_chat(001, '-- Spell: '..spell.english..' Type: '..spell.type..' --')
	
	-- Spell/ability audibles
	if spell.english == 'Lunge' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
            eventArgs.cancel = true
			send_command('input /ja "Swipe" ' .. tostring(spell.target.raw))
        end
    end
    if spell.english == 'Valiance' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            eventArgs.cancel = true
			send_command('input /ja "Vallation" ' .. tostring(spell.target.raw))
        elseif spell.english == 'Valiance' and buffactive['vallation'] then
            cast_delay(0.2)
            send_command('cancel Vallation')
		end
    end
	
	-- /DRK Spell/ability audibles
	if spell.english == 'Swordplay' and player.sub_job == 'DRK' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            eventArgs.cancel = true
			send_command('input /ja "Last Resort" ' .. tostring(spell.target.raw))
        end
	end
	if player.sub_job == 'DRK' and spell.english == 'Flash' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 then
			eventArgs.cancel = true
			send_command('input /ma "Stun" ' .. tostring(spell.target.raw))
		end
	end

	--[[ if player.sub_job == 'DRK' and spell.english == 'Flash' then
		eventArgs.cancel = true
		send_command('input /ma "Stun" ' .. tostring(spell.target.raw))
	end ]]
	
	-- /BLU Spell/ability audibles
	if player.sub_job == 'BLU' and spell.english == 'Geist Wall' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 then
			eventArgs.cancel = true
			send_command('input /ma "Sheep Song" ' .. tostring(spell.target.raw))
		end
	end
	if player.sub_job == 'BLU' and spell.english == 'Flash' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 then
			eventArgs.cancel = true
			send_command('input /ma "Blank Gaze" ' .. tostring(spell.target.raw))
		end
	end
	
	-- Use the obi on swipe/lunge if it'd help
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    end

    -- Utsusemi helper
	if spell.english:contains('Utsusemi') then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            eventArgs.cancel = true
            add_to_chat(123, '**!! ' .. spell.english .. ' Canceled: [3+ IMAGES] !!**')
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end

	-- Autofite mode audibles
	if auto.fite[auto.fite.index] == 'On' and spell.english:contains('Protect') and not(windower.ffxi.get_ability_recasts()[72] > 0) then
		eventArgs.cancel = true
		send_command('input /ja "Embolden" <me>; wait 2; input /ma "'..spell.name..'" '..tostring(spell.target.raw))
	end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
	if magicMaps.Enmity:contains(spell.english) then
		equip(sets.baseEnmity)
	end
	if magicMaps.Interrupt:contains(spell.english) then
		equip(sets.interrupt)
	end

	if spell.action_type == 'Magic' and buffactive['Embolden'] then
		add_to_chat(122, "Embolden cape gooooo!")
		equip({back="Evasionist's Cape"})
	end
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
		else
			enable('ring1','waist')
			evalState_equipGear()
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)
	if weaponMode[weaponMode.index].name == "Aettir" and gearMode[gearMode.index].name ~= "MagicTank" then
		weaponMode.index = weaponMode.index + 1
		if weaponMode.index > #weaponMode then
			weaponMode.index = 0;
		end
	end
	if weaponMode[weaponMode.index].name == "DW-Swords" and (player.sub_job ~= "NIN" and player.sub_job ~= "DNC") then
		weaponMode.index = weaponMode.index + 1
		if weaponMode.index > #weaponMode then
			weaponMode.index = 0;
		end
	end
end

function extendedJobSelfCommand(cmdParams, eventArgs)
	-- for runeHelper addon
	if cmdParams[1]:lower() == 'toggleautorune' then
		auto.rune.index = auto.rune.index + 1
		if auto.rune.index > #auto.rune then
			auto.rune.index = 0
		end
		--add_to_chat(122,'-- autoRune:'..auto.rune[auto.rune.index]..' --')
		modeHud('update')
	end
	if cmdParams[1]:lower() == 'setrune' then
		--add_to_chat(122,'-- set rune to: '..cmdParams[2]..' --')
		auto.rune.index = 0
		currRune = cmdParams[2]
	end

	-- spike health for omen healing objective
	if cmdParams[1]:lower() == 'spikehealth' then
		equip(sets.naked)
	end

	-- test bag stuff
	if cmdParams[1]:lower() == 'asdf' then
		fileRaw = io.open('C:\\_Games\\FFXI\\Windower\\addons\\GearSwap\\data\\test.lua', "rb")
		add_to_chat(1, tostring(fileRaw))

		itemInfo = require('rTemplate\\items')
		local bags = {0,8,10,11,12} --inventory,wardrobe1-4
		local get_items = windower.ffxi.get_items
		for i=1,#bags do
			for _,item in ipairs(get_items(bags[i])) do
				if item.id > 0 then
					local itemName = itemInfo[item.id].en
					
					if not fileRaw:contains(itemName) then
						add_to_chat(1, itemName..' not being used by supplied .lua')
					end
				end
			end
		end
		add_to_chat(1, '-- Done checking inventory! --')
	end

	if cmdParams[1]:lower() == 'readfile' then
		-- see if the file exists
		function file_exists(file)
			local f = io.open(file, "rb")
			if f then f:close() end
			return f ~= nil
		end
		
		-- get all lines from a file, returns an empty 
		-- list/table if the file does not exist
		function lines_from(file)
			if not file_exists(file) then return {} end
			local lines = L{}
			for line in io.lines(file) do
				lines:append(line)
				--lines[#lines + 1] = line
			end
			return lines
		end
		
		-- tests the functions above
		local file = 'C:\\_Games\\FFXI\\Windower\\addons\\GearSwap\\data\\test.lua'
		local lines = lines_from(file)
		local raw = lines:concat(',')
		-- print all line numbers and their contents
		--[[ for k,v in pairs(lines) do
			print('line[' .. k .. ']', v)
		end ]]

		if lines:contains('Epeolatry') then
			print('file DOES contain epeo!')
		end

	end

	if cmdParams[1]:lower() == 'getfiles' then
		function scandir(directory)
			--local i,t, popen = 0, L{}, io.popen
			local pfile = io.popen('dir "'..directory..'" /b')
			for filename in pfile:lines() do
				print('file: '..filename)
				--t:append(filename)
			end
			pfile:close()
		end

		scandir('C:\\_Games\\FFXI\\Windower\\addons\\GearSwap\\data')
	end

	if cmdParams[1]:lower() == 'togglegearmode' then
		if gearMode[gearMode.index].name == 'DPS' and auto.fite[auto.fite.index] == 'On' then
			add_to_chat('no more idle gear!')
			sets.idle = sets.engaged
		end
	end
	if cmdParams[1]:lower() == 'toggleautofite' then
		if gearMode[gearMode.index].name == 'DPS' and auto.fite[auto.fite.index] == 'On' then
			add_to_chat('no more idle gear!')
			sets.idle = sets.engaged
		end
	end
end

function extendedEvalState_equipGear()
	if gearMode[gearMode.index].name == 'EvaTank' then
		sets.weapons.sub = "Kupayopl"
	else
		if gearMode[gearMode.index].name == 'DW-Swords' then
			sets.weapons.sub = "Reikiko"
		else
			sets.weapons.sub = "Utu Grip"
		end
	end
end

function extendedModeHud(hudText)
	-- job specific location override?
	--modeHud_xPos = 1200
	--modeHud_yPos = 50

	local autoRune = auto.rune[auto.rune.index]
	hudText:append(white..'auto.Rune: '..getBoolColor(autoRune))
	return hudText
end


-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()
	local runeRecast = abilRecast[92]

	-- auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- handle auto wake on sleep with frenzy sallet
	if buffactive['Sleep'] and player.status == "Engaged" then 
		send_command('input //gs equip sets.wakeUp')
	elseif player.equipment.head == "Frenzy Sallet" and not buffactive['Sleep'] then
		if player.status == "Engaged" then
			send_command('input //gs equip sets.engaged')
		else
			send_command('input //gs equip sets.idle')
		end
	end

	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		-- auto rune
		if not currRune then currRune = 'Tenebrae' end
		if buffactive[currRune] ~= 3 and auto.rune[auto.rune.index] == 'On' and runeRecast == 0 then
			windower.send_command('rh userune')
			return
		end

		-- spells when in tank mode
		--if gearMode[gearMode.index].name:contains('Tank') then
			if not buffactive['Aquaveil'] then
				--actionInProgress = true
				add_to_chat(122,'-- Aquaveil is down. Trying to recast... --')
				send_command('input /ma "Aquaveil" <me>')
				return
			end

			if not buffactive['Enmity Boost'] then
				--actionInProgress = true
				add_to_chat(122,'-- Crusade is down. Trying to recast... --')
				send_command('input /ma "Crusade" <me>')
				return
			end

			if not buffactive['Phalanx'] then
				--actionInProgress = true
				add_to_chat(122,'-- Phalanx is down. Trying to recast... --')
				send_command('input /ma "Phalanx" <me>')
				return
			end
			
			if player.sub_job == 'BLU' and not buffactive['Defense Boost'] then
				--actionInProgress = true
				add_to_chat(122,'-- Cocoon is down. Trying to recast... --')
				send_command('input /ma "Cocoon" <me>')
				return
			end
		--end

		-- Temper
		if not buffactive['Multi Strikes'] and (player.status == 'Engaged' or gearMode[gearMode.index].name ~= 'SuperTank') then
			--actionInProgress = true
			add_to_chat(122,'-- Temper is down. Trying to recast... --')
			send_command('input /ma "Temper" <me>')
			return
		end
		
		if not buffactive['Refresh'] and player.mpp < 50 then
			--actionInProgress = true
			add_to_chat(122,'-- Refresh is needed. Trying to recast... --')
			send_command('input /ma "Refresh" <me>')
			return
		end

		-- Autofite only
		if auto.fite[auto.fite.index] == 'On' then
			if not buffactive['Protect'] then
				send_command('/protect4')
			end
			if not buffactive['Shell'] then
				send_command('/shell5')
			end
			if player.hpp < 80 and not buffactive['Regen'] then
				send_command('/regen4')
				return
			end
			if (buffactive['Tenebrae'] and player.mpp < 80) or (not buffactive['Tenebrae'] and player.hpp < 80) then
				send_command('/Vivacious Pulse')
			end
		end
	end
end