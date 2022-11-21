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
		waist="Sailfi Belt +1",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		ring1="Epona's Ring",
		ring2="Niqmaddu Ring",
		back=gear.STRCape,
	}
	sets.baseTank = {                     --Total: 54 | DT44 | PDT10
		ammo="Staunch Tathlum +1",        --DT03
		head="Nyame Helm",                --DT07
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +3",      --DT13
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
	sets.magicEvaTank = {                 --DT--        --MEva/ResistAll--
		ammo="Yamarang",                                --015/00
		head="Nyame Helm",                --DT07        --123/00
		body="Runeist's Coat +3",                       --094/39
		hands="Nyame Gauntlets",          --DT07        --112/00
		legs="Nyame Flanchard",           --DT08        --150/00
		feet="Erilaz Greaves +3",         --DT11        --157/35
		neck="Futhark Torque +2",         --DT07        --030/00
		waist="Engraved Belt",							--000/20(+10)
		ear1="Erilaz Earring +1",         --DT04		--011/00
		ear2="Eabani Earring",							--008/00
		ring1="Moonlight Ring",           --DT05		
		ring2="Defending Ring",           --DT10
		back=gear.EnmityCape,							--030/00
	}
	sets.superTank = {
		ammo="Yamarang",
		head="Nyame Helm",                --DT07
		body="Runeist's Coat +3",
		hands="Nyame Gauntlets",          --DT07
		legs="Nyame Flanchard",           --DT08
		feet="Nyame Sollerets",           --DT07
		neck="Futhark Torque +2",         --DT07
		waist="Engraved Belt",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		ring1="Moonlight Ring",           --DT05
		ring2="Defending Ring",           --DT10
		back=gear.EnmityCape,             --PDT10
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
	sets.baseEnmity = {                             --Toal: 95+23   DT:43+25  (+ from epeo)
		ammo="Aqreqaq Bomblet",           --2
		head="Halitus Helm",              --8
		body="Emet Harness +1",           --10                      P06
		hands="Kurys Gloves",             --9                       02
		legs="Erilaz Leg Guards +3",      --13                      13
		feet="Erilaz Greaves +3",         --6                       P05
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
		head="Erilaz Galea +3",                     --20
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
		--ammo="",
		--head="",            			  
		--body="",
		hands="Runeist's Mitons +3",      --15
		legs="Carmine Cuisses +1",        --18
		--feet="",
		neck="Incanter's Torque",         --10
		waist="Olympus Sash",             --05
		ear1="Andoaa Earring",        	  --05
		ear2="Mimir Earring",        	  --10
		ring1="Stikini Ring +1",      	  --08
		ring2="Stikini Ring +1",     	  --08
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
		waist="Orpheus's Sash",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		ring1="Locus Ring",
		ring2="Mujin Band",
		back=gear.LungeCape,
	}
	sets.precast.FC = {
		ammo="Impatiens",
		head="Rune. Bandeau +3",   --14
		body="Erilaz Surcoat +3",  --13
		hands="Leyline Gloves",    --08
		legs="Agwu's Slops",       --07
		feet="Carmine Greaves +1", --08
		neck="Orunmila's Torque",  --05
		waist="Kasiri Belt",
		ear1="Etiolation Earring", --01
		ear2="Loquac. Earring",    --05
		ring1="Kishar Ring",       --04
		ring2="Defending Ring",
		back=gear.CASTCape,        --10
	}

	-- Random one-off sets or small sets
    sets.baseIdle = set_combine(sets.baseTank, {ring2="Defending Ring",ring1="Karieyh Ring +1",ammo="Homiliary"}) 
	sets.moveSpeed = {legs="Carmine Cuisses +1"}
	sets.wakeUp = {head="Frenzy Sallet"}
	sets.obi = {waist="Hachirin-no-Obi"}
	sets.oSash = {waist="Orpheus's Sash"}
	sets.TH = {waist='Chaac Belt', head='Wh. Rarab Cap +1', ammo='Per. Lucky Egg', hands="Herculean Gloves"}
	sets.emDuration = {legs="Futhark Trousers +3",head="Erilaz Galea +3",}
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
    sets.precast.JA['Rayke'] = {feet="Futhark Boots +2"}
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.baseEnmity, {body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.baseEnmity, {hands="Futhark Mitons +3"})
    sets.precast.JA['Vivacious Pulse'] = set_combine(sets.baseEnmity, {head="Erilaz Galea +3"})
	sets.precast.JA['Weapon Bash'] = set_combine(sets.tank, sets.TH)

	-- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Resolution'] = set_combine(sets.baseWS, {legs="Samnuha Tights", ring1="Epona's Ring", ammo="Seeth. Bomblet +1"})
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
    sets.midcast['Regen'] = set_combine(sets.baseTank, sets.emDuration, {head="Rune. Bandeau +3",neck="Sacro Gorget",waist="Sroda Belt",ear2="Erilaz Earring +1"})
	sets.midcast['Cure'] = set_combine(sets.baseTank, {waist="Sroda Belt"})
    sets.midcast['Refresh'] = set_combine(sets.baseTank, sets.emDuration, {waist="Gishdubar Sash", head="Erilaz Galea +3",})
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

	--[[ magicMode = {
		["index"] = 0,
		[0] = {name="Burst", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[1] = {name="Burst", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[2] = {name="MaxAcc", nukeSet=(set_combine(sets.interrupt, sets.emSkill))},
	} ]]

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
	if not currRune then
		currRune = 'Tenebrae'
	end

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

function extendedUserUnload()
	windower.send_command('lua unload runehelper')
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
	if player.sub_job == 'DRK' and spell.english == 'Flash' and auto.fite[auto.fite.index] == 'Off' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 then
			eventArgs.cancel = true
			send_command('input /ma "Stun" ' .. tostring(spell.target.raw))
		end
	end

	-- Don't laugh, it kind of works in a pinch?
	if player.sub_job == 'SCH' and auto.fite[auto.fite.index] == 'On' and strategemCount() >= 1 then
		local spellsToAoe = "Regen IV,Phalanx"
		if spellsToAoe:contains(spell.english) and not buffactive['Accession'] then
			eventArgs.cancel = true
			send_command('input /ja "Accession" <me>')
			send_command:schedule(2, 'input /ma "'..spell.english..'" <me>')
		end
	end

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
            equip(sets.obi)
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

	-- extended handling of mode changes
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

	-- spike health for omen healing objective
	if cmdParams[1]:lower() == 'spikehealth' then
		equip(sets.naked)
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
	-- auto equip selected weapon set
	if player.equipment.main == "empty" then
		send_command('input /equip main "'..weaponMode[weaponMode.index].set.main..'"')
	end
	if player.equipment.sub == "empty" then
		send_command('input /equip sub "'..weaponMode[weaponMode.index].set.sub..'"')
	end

	-- handle auto wake on sleep with frenzy sallet
	if buffactive['Sleep'] and player.status == 'Engaged' then
		send_command('input //gs equip sets.wakeUp')
	elseif player.equipment.head == "Frenzy Sallet" and not buffactive['Sleep'] then
		send_command('input /equip head "'..gearMode[gearMode.index].engaged.head..'"')
	end

	-- If auto.fite mode don't do buffs when you should be pulling
	if auto.fite[auto.fite.index] == 'On' and not player.status == 'Engaged' then
		return
	end

	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		-- auto rune
		if auto.rune[auto.rune.index] == 'On' and buffCheck(currRune, 3) then
			windower.send_command('rh userune')
			return
		end

		-- normal buffs to maintain
		if buffCheck('Aquaveil') then
			send_command('input /ma "Aquaveil" <me>')
			return
		end
		if buffCheck('Enmity Boost', 'Crusade') then
			send_command('input /ma "Crusade" <me>')
			return
		end
		if buffCheck('Phalanx') then
			send_command('input /ma "Phalanx" <me>')
			return
		end

		-- Temper when engaged or not in 'supertank' gearmode
		if player.status == engaged or gearMode[gearMode.index].name ~= 'SuperTank' and buffCheck('Multi Strikes', 'Temper') then
			send_command('input /ma "Temper" <me>')
			return
		end

		-- Cocoon when in /blu tank mode
		if gearMode[gearMode.index].name:contains('Tank') and player.sub_job == 'BLU' and buffCheck('Defense Boost', 'Cocoon') then
			send_command('input /ma "Cocoon" <me>')
			return
		end

		-- LOL /SCH
		if player.sub_job == 'SCH' then
			if buffCheck('Light Arts') then
				send_command('input /ja "Light Arts" <me>')
				return				
			end

			if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and not onCooldown("Sublimation") then
				send_command('input /ja "Sublimation" <me>')
				return
			end
			if buffactive['sublimation: complete'] and player.mpp < 40 and not onCooldown("Sublimation") then
				add_to_chat(122,'-- MP below 40% - Popping Sublimation! --')
				send_command('input /ja "Sublimation" <me>')
				return
			end

			if buffCheck('Regen', 'Regen IV') then
				send_command('input /ma "Regen IV" <me>')
				return
			end

			if buffCheck('Refresh') then
				send_command('input /ma "Refresh" <me>')
				return
			end
		end

		-- auto.fite only buffs
		if auto.fite[auto.fite.index] == 'On' then
			if buffCheck('Protect', 'Protect IV') then
				send_command('input /ma "Protect IV" <me>')
				return
			end
			if buffCheck('Shell', 'Shell V') then
				send_command('input /ma "Shell V" <me>')
				return
			end

			if player.hpp < 80 and buffCheck('Regen', 'Regen IV') then
				send_command('input /ma "Regen IV" <me>')
				return
			end

			-- Use vivacious pulse when below 80% mp(if using tenebrae) or hp(if using others)
			if not onCooldown('Vivacious Pulse') then
				if (buffactive['Tenebrae'] and player.mpp < 80) or (not buffactive['Tenebrae'] and player.hpp < 80) then
					send_command('input /ja "Vivacious Pulse" <me>')
					return
				end
			end

			--[[ -- TESTING TIMEDBUFFS
			if timerBuffs ~= nil then
				for k,v in timerBuffs do
					if time.os() > v.lastCast + v.interval then
						send_command('input /ma "'..v.buff..'" '..k)
						timerBuffs[k].lastCast = time.os()
					end
				end
			end

			timerBuffs = {
				['Ygnas'] = {buff="Refresh", interval=300, lastCast=0}
			} ]]

		end
	end
end