include('RST\\sharedFunctions.lua')

-------------------------------------------------------------------------------------------------------------------
-- dumb name.  is required.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and gear vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
	gear.nukeCape = {name="Lugh's Cape", augments={'"Regen"+5'}}
	gear.fcCape = {name="Lugh's Cape", augments={'"Fast Cast"+10'}}

	sets.burst = {                         --Total: 47/15 +13 from jp 
		main = "Akademos",                  --10
		sub = "Enki Strap",
		ammo = "Pemphredo Tathlum",
		head = "Pedagogy Mortarboard +3",   --4*
		body = "Merlinic Jubbah",           --11
		hands = "Amalric Gages +1",         --6*
		legs = "Merlinic Shalwar",          --09
		feet = "Agwu's Pigaches",           --06
		neck = "Argute Stole +1",           --07
		waist = "Eschan Stone",
		ear1 = "Malignance Earring",
		ear2 = "Barkaro. Earring",
		ring1 = "Freke Ring",
		ring2 = "Mujin Band",               --5/5*
		back=gear.nukeCape,					-- 13 from jp gifts?
	}

	sets.freeCast = {
		ammo = "Pemphredo Tathlum",
		head = "Pedagogy Mortarboard +3",
		body = "Agwu's Robe",
		hands = "Amalric Gages +1",
		legs = "Agwu's Slops",
		feet = "Agwu's Pigaches",
		neck = "Argute Stole +1",
		waist = "Eschan Stone",
		left_ear = "Malignance Earring",
		right_ear = "Barkaro. Earring",
		left_ring = "Freke Ring",
		right_ring = "Stikini Ring +1",
		back=gear.nukeCape,
	}

	sets.cure = {
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

	sets.magicAcc = {
		ammo = "Pemphredo Tathlum",
		head = "Arbatel Bonnet +2",
		body = "Agwu's Robe",
		hands = "Arbatel Bracers +3",
		legs = "Chironic Hose",
		feet = "Arbatel Loafers +3",
		neck = "Argute Stole +1",
		waist = "Eschan Stone",
		ear1 = "Malignance Earring",
		ear2 = "Arbatel Earring +1",
		ring1 = "Stikini Ring +1",
		ring2 = "Stikini Ring +1",
		back=gear.nukeCape,
	}

	sets.emSkill = {head="Befouled Crown", neck="Incanter's Torque", waist="Olympus Sash", ear1="Mimir Earring", ear2="Andoaa Earring", body="Telchine Chas.",}
	sets.enfeebSkill = {neck="Incanter's Torque", head="Befouled Crown", ring1="Kishar Ring"}
	
	sets.precast.FC = {									-- TOTAL: 73
		ammo = "Impatiens",
		head = "Merlinic Hood",							--08
		body = "Pinga Tunic",							--13
		hands = "Agwu's Gages",							--06
		legs = "Agwu's Slops",							--07
		feet = "Merlinic Crackows",						--05
		neck = "Orunmila's Torque",						--05
		waist = "Embla Sash",							--05
		left_ear = "Malignance Earring",				--04
		right_ear = "Loquac. Earring",					--05
		left_ring = "Kishar Ring",						--04
		right_ring = "Jhakri Ring",						--01
		back=gear.fcCape,								--10
	}
	
	sets.damageTaken = {
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Loricate Torque +1",
        --ear1="Loquacious Earring",
        --ear2="Etiolation Earring",
        ring2 = "Defending Ring",
        --back="Fi Follet Cape +1",
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
	
	sets.baseIdle = {
        --main = "Daybreak",
		--sub = "Genmei Shield",
		ammo = "Homiliary",
        head = "Befouled Crown",
        body = "Agwu's Robe",
        hands= "Nyame Gauntlets",
        legs= "Assiduity Pants +1",
        feet= "Nyame Sollerets",
        neck = "Sibyl Scarf",
        --ear1="Loquacious Earring",
        --ear2="Etiolation Earring",
        ring1 = "Karieyh Ring +1",
        ring2 = "Stikini Ring +1",
        waist = "Fucho-no-Obi",
        --back="Fi Follet Cape +1",
	}
	
	sets.moveSpeed = {feet="Herald's Gaiters"}
	sets.obi = {waist="Hachirin-no-Obi"}
	sets.oSash = {waist="Orpheus's Sash"}
    sets.sublimation = {waist="Embla Sash"}
	sets.staffSet = {main="Akademos",sub="Enki Strap"}
	sets.LightArtsWeapons = {main="Daybreak",sub="Genmei Shield"}
	
    -- JA Sets
	sets.precast.JA['Tabula Rasa'] = {--[[ legs="Peda. Pants +3" ]]}
    sets.precast.JA['Enlightenment'] = {--[[ body="Peda. Gown +3" ]]}
	sets.grimoireEffect = {head="Pedagogy Mortarboard +3", --[[ feet="Acad. Loafers +3" ]]}
	sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
	sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}
	sets.buff['Ebullience'] = {head="Arbatel Bonnet +2"}
	sets.buff['Rapture'] = {head="Arbatel Bonnet +2"}
    
	sets.precast.FC['Cure'] = set_combine(sets.precast.FC, {back="Pahtli Cape"})
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash",})
	sets.emDuration = {waist="Embla Sash", legs="Telchine Braconi", body="Telchine Chas.", feet="Telchine Pigaches", hands="Telchine Gloves"}

	sets.midcast['Elemental Magic'] = sets.burst
	sets.midcast['Enhancing Magic'] = set_combine(sets.emSkill, sets.emDuration)
	sets.midcast['Enfeebling Magic'] = set_combine(sets.magicAcc, sets.enfeebSkill, {hands='Regal Cuffs', ring1='Kishar Ring'})
	sets.midcast['Cure'] = {hands="Telchine Gloves",}
	
	sets.absorbSpells = set_combine(sets.midcast['Enfeebling Magic'], {main="Rubicundity",sub="Culminus",waist="Fucho-no-Obi", left_ring="Evanescence Ring", feet="Merlinic Crackows", head="Pixie Hairpin +1", neck="Erra Pendant"})
	sets.midcast['Aspir'] = sets.absorbSpells
	sets.midcast['Drain'] = sets.absorbSpells

	-- These should all be under 'Enhancing Magic' but dont get picked up for some reason
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {head="Arbatel Bonnet +2", main="Bolelabunga", sub="Genmei Shield"})
	sets.midcast['Refresh'] = sets.midcast['Enhancing Magic']
	sets.midcast['Haste'] = sets.midcast['Enhancing Magic']
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {feet="Dream Boots +1"})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {hands="Dream Mittens +1"})
	sets.midcast['Deodorize'] = sets.midcast['Enhancing Magic']
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="Normal", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseIdle)},
		[1] = {name="DmgTaken", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseIdle)},
		[2] = {name="MaxRefresh", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseIdle)},
        [3] = {name="Sublimation", hidden=true, idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseIdle)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="AllowSwap", set={main="Akademos", sub="Enki Strap"}},
		[1] = {name="LockStaff", set={main="Akademos", sub="Enki Strap"}},
	}

	--Setup magicMode
	magicMode = {
		["index"] = 0,
		[0] = {
			['name'] = "Burst",
			['set'] = {
				['Elemental Magic'] = set_combine(sets.interrupt, sets.burst)
			},
		},
		[1] = {
			['name'] = "FreeCast",
			['set'] = {
				['Elemental Magic'] = set_combine(sets.interrupt, sets.freeCast)
			},
		},
		[2] = {
			['name'] = "HighAcc",
			['set'] = {
				['Elemental Magic'] = set_combine(sets.interrupt, sets),
				['Enfeebling Magic'] = set_combine(sets.interrupt, sets.magicAcc, sets.enfeebSkill)
			},
		},
	}

    --Setup eleMode for elemental wheel HUD
    eleMode = {
        ["index"] = 0,
		[0] = {element="Dark"},
		[1] = {element="Light"},
		[2] = {element="Earth"},
		[3] = {element="Water"},
		[4] = {element="Wind"},
		[5] = {element="Fire"},
		[6] = {element="Ice"},
		[7] = {element="Lightning"},
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
			[1] = "AutoHeal",
			[2] = "AutoBurst",
		}
	}

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
	eleHud('create')
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
    spellSteps = {
		-- ['Spell Family'] = { [0]='Highest Tier', [1]='Next Tier'... }
		['Stone'] = {[0]='Stone V', [1]='Stone IV', [2]='Stone III', [3]='Stone II', [4]='Stone'},
		['Water'] = {[0]='Water V', [1]='Water IV', [2]='Water III', [3]='Water II', [4]='Water'},
		['Aero'] = {[0]='Aero V', [1]='Aero IV', [2]='Aero III', [3]='Aero II', [4]='Aero'},
		['Fire'] = {[0]='Fire V', [1]='Fire IV', [2]='Fire III', [3]='Fire II', [4]='Fire'},
		['Blizzard'] = {[0]='Blizzard V', [1]='Blizzard IV', [2]='Blizzard III', [3]='Blizzard II', [4]='Blizzard'},
		['Thunder'] = {[0]='Thunder V', [1]='Thunder IV', [2]='Thunder III', [3]='Thunder II', [4]='Thunder'},
		['Aspir'] = {[0]='Aspir II', [1]='Aspir'},
		['Sleep'] = {[0]='Sleep II', [1]='Sleep'},
		['Cure'] = {[0]='Cure IV', [1]='Cure III', [2]='Cure II', [3]='Cure'}
	}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Job specific keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	send_command('bind ^= gs c elewheelhelix')
	send_command('bind != gs c elewheelstorm')

    
    --Set default macro book / page
    set_macro_page(1, 4)

	--Set style lock
	windower.send_command('wait 2; input /lockstyleset 5')
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	--add_to_chat(001, '-- Spell: '..spell.name..' Type: '..spell.type..' --')

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

	--[[ if auto.fite[auto.fite.index] == 'On' then
		if spell.english:contains(' V') and strategemCount() > 3 then
			if not (buffactive['Ebullience']) then
				eventArgs.cancel = true
				send_command('/ebullience')
				send_command:schedule(0.5, 'input /ma "'..spell.name..'" '..tostring(spell.target.raw))
				return
			end
		end
	end ]]
end

function job_post_precast(spell, action, spellMap, eventArgs)
	-- if spelltype matches current grimoire, use grimoire effect gear
	if (spell.type == "WhiteMagic" and (buffactive["Light Arts"] or buffactive["Addendum: White"])) or (spell.type == "BlackMagic" and (buffactive["Dark Arts"] or buffactive["Addendum: Black"])) then
		equip(sets.grimoireEffect)
	end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
    -- placeholder
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
    -- check for / equip buff dependant midcast gear
	for buff,active in pairs(state.Buff) do
		if active and sets.buff[buff] then
			equip(sets.buff[buff])
        end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
    local command = cmdParams[1]:lower()
	local currElement = eleMode[eleMode.index].element
	
	if command:contains('elewheel') then
		if command == 'elewheelstorm' then
			local action = ele.find.storm2_of[currElement] or nil
			if action then
				send_command('/'..action)
				return
			end
		end
	
		if command == 'elewheelmainspell' then
			local action = ele.find.mainspell_of[currElement] or nil
			if action then
				send_command('/'..action)
				return
			end
		end
	
		if command == 'elewheelhelix' then
			local action = ele.find.helix_of[currElement] or nil
			if action then
				send_command('/'..action)
				return
			end
		end
	
		if command == 'elewheelskillchain' then
			local action = ele.find.skillchain_of[currElement] or nil
			if action then
				send_command('input //gs c make'..action..'skillchain')
				return
			end
		end
	end

    -- skill chain commands
    if command:contains('skillchain') then
		local startAfIndex = auto.fite.index
		local startAbIndex = auto.buff.index
		auto.fite.index = 0
		auto.buff.index = 0
		modeHud('update')

		if cmdParams[1]:lower() == 'makefusionskillchain' then
			send_command('input /p ~~ '..string.char(0xFD, 0x02, 0x02, 0x1E, 0xC1, 0xFD)..' ~~')
			send_command('/immanence')
            send_command:schedule(1, '/fire')
            send_command:schedule(5, '/immanence')
            send_command:schedule(6, '/thunder')
		end
		if cmdParams[1]:lower() == 'makedistortionskillchain' then
			send_command('input /p ~~ '..string.char(0xFD, 0x02, 0x02, 0x1E, 0xC0, 0xFD)..' ~~')
			send_command('/immanence')
            send_command:schedule(1, '/luminohelix')
            send_command:schedule(8, '/immanence')
            send_command:schedule(9, '/stone')
		end
		if cmdParams[1]:lower() == 'makefragmentationskillchain' then
			send_command('input /p ~~ '..string.char(0xFD, 0x02, 0x02, 0x1E, 0xBF, 0xFD)..' ~~')
			send_command('/immanence')
            send_command:schedule(1, '/blizzard')
            send_command:schedule(5, '/immanence')
            send_command:schedule(6, '/water')
		end
		if cmdParams[1]:lower() == 'makegravitationskillchain' then
			send_command('input /p ~~ '..string.char(0xFD, 0x02, 0x02, 0x1E, 0xBE, 0xFD )..' ~~')
			send_command('/immanence')
            send_command:schedule(1, '/aero')
            send_command:schedule(5, '/immanence')
            send_command:schedule(6, '/noctohelix')
		end

		auto.fite.index = startAfIndex
		auto.buff.index = startAbIndex
		modeHud('update')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific and/or extension functions
-------------------------------------------------------------------------------------------------------------------
function extendedJobBuffChange(buff, active)
    if buff == 'sublimation: activated' and active then
		preSubGearModeIndex = gearMode.index
        gearMode.index = 3
		modeHud('update')
	end
	if buff == 'sublimation: activated' and not active then
		if preSubGearModeIndex then
			gearMode.index = preSubGearModeIndex
			modeHud('update')
		end
	end
end

function extendedTWM(cmdParams, eventArgs)
	if weaponMode[weaponMode.index] == 'LockStaff' then
		equip(sets.weapons)
		disable(main, sub)
	else
		enable(main, sub)
		equip(sets.weapons)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	--add_to_chat(122, 'autoActions heartbeat')
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

    -- auto.buff mode on
	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
        -- Sublimation Handling
        if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and not onCooldown('Sublimation') then
            send_command('input /ja "Sublimation" <me>')
        end
        if buffactive['sublimation: complete'] and player.mpp < 25 and not onCooldown('Sublimation') then
            add_to_chat(122,'-- MP below 25% - Popping Sublimation! --')
            send_command('input /ja "Sublimation" <me>')
        end

        -- Myrkr!
        if player.mpp < 40 and player.tp > 2500 then
            add_to_chat(122,'-- Myrkr! --')
            send_command('input /ws "Myrkr" <me>')
        end

        -- Full time buffs
		if buffCheck('Klimaform') then
            send_command('/klimaform')
        end
		if buffCheck('Haste') then
			send_command('/haste')
		end

		-- Maintain storm if not in an auto.fite mode
		if auto.fite[auto.fite.index] == 'Off' and not moving then
			if not buffactive[ele.find.storm_of[eleMode[eleMode.index].element]] then
				send_command('/'..ele.find.storm2_of[eleMode[eleMode.index].element])
			end
		end
    end

    -- auto.fite modes 
	if auto.fite[auto.fite.index] == 'AutoBurst' and not actionInProgress and not moving then
		-- maintain addendum: black
		if not buffactive['Addendum: Black'] then
			send_command('/darkarts')
			return
		end

		-- aspir
		local targetName = windower.ffxi.get_mob_by_target('t') and windower.ffxi.get_mob_by_target('t').name or nil
		if targetName and player.mp < 1000 and targetName:contains('Crab') and (not onCooldown('Aspir II') or not onCooldown('Aspir')) then
			send_command('/aspir2')
			return
		end

		-- AoE regen5 (3 strats because +1 to get addendum: black back on after)
		if strategemCount() >= 3 and not buffactive['Regen'] then
			table.insert(multiStepAction, '/ja "Light Arts" <me>')
			table.insert(multiStepAction, '/ja "Perpetuance" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Regen V" <me>')
			return
		end

		-- AoE storm2 of eleMode
		if strategemCount() >= 3 and not buffactive[ele.find.storm_of[eleMode[eleMode.index].element]] then
			table.insert(multiStepAction, '/ja "Light Arts" <me>')
			table.insert(multiStepAction, '/ja "Perpetuance" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "'..ele.find.storm2_of[eleMode[eleMode.index].element]..'" <me>')
		end

		--[[ if strategemCount() >= 3 and not buffactive['Protect'] then
			table.insert(multiStepAction, '/ja "Light Arts" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Protect V" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Shell V" <me>')
		end ]]
	end

	if auto.fite[auto.fite.index] == 'AutoHeal' and not moving then
		-- maintain addendum: white
		if not buffactive['Addendum: White'] then
			send_command('/lightarts')
			return
		end

		partyLowHP(50, '/ma "Cure IV"')

		-- AoE regen5
		if strategemCount() >= 2 and not buffactive['Regen'] then
			table.insert(multiStepAction, '/ja "Perpetuance" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Regen V" <me>')
			return
		end

		-- AoE Phalanx
		if strategemCount() >= 2 and not buffactive['Phalanx'] then
			table.insert(multiStepAction, '/ja "Perpetuance" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Phalanx" <me>')
			return
		end

		-- AoE Adloquium
		if strategemCount() >= 2 and not buffactive['Regain'] then
			table.insert(multiStepAction, '/ja "Perpetuance" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Adloquium" <me>')
			return
		end

		-- AoE storm2 of eleMode
		if strategemCount() >= 2 and not buffactive[ele.find.storm_of[eleMode[eleMode.index].element]] then
			table.insert(multiStepAction, '/ja "Perpetuance" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "'..ele.find.storm2_of[eleMode[eleMode.index].element]..'" <me>')
			return
		end

		-- AoE Prot5
		if strategemCount() >= 2 and not buffactive['Protect'] then
			table.insert(multiStepAction, '/ja "Perpetuance" <me>')
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Protect V" <me>')
			return
		end

		-- AoE Shell5
		if strategemCount() >= 1 and not buffactive['Shell'] then
			table.insert(multiStepAction, '/ja "Accession" <me>')
			table.insert(multiStepAction, '/ma "Shell V" <me>')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Day change
-------------------------------------------------------------------------------------------------------------------
--[[ windower.register_event('day change', function()
	sets.eleMode.index = world.day_element
	update_eleMode(sets.eleMode.index)
end) ]]