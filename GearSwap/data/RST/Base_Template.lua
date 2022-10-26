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
		[3] = {name="G-Axe", set={main="Kaja Chopper", sub="Utu Grip"}},
		[4] = {name="DW-Swords", set={main="Naegling", sub="Reikiko"}},
	}

	--Setup magicMode
	magicMode = {
		["index"] = 0,
		[0] = {name="Burst", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[1] = {name="FreeNuke", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[2] = {name="MaxAcc", nukeSet=(set_combine(sets.interrupt, sets.emSkill))},
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

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Job specific keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
    --add_to_chat(001, '-- Spell: '..spell.english..' Type: '..spell.type..' --')
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
    -- placeholder
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
    --[[ if active then
		if showSpellInfo == 1 then add_to_chat(122,'-- Buff: '..buff..' BuffState: true --') end
		state.Buff[buff] = true
	else
		if showSpellInfo == 1 then add_to_chat(122,'-- Buff: '..buff..' BuffState: false --') end
		state.Buff[buff] = nil
	end ]]

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

end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	-- These commands happen no matter what -----------------------------------------------------------------------
	-- auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- These commands only happen when auto.buff mode is 'On'  ----------------------------------------------------
	-- Use case: things like spell buffs or short lived JA cooldowns with decent uptime. Things you don't
	-- want to manually click every minute or two while you're actually playing
	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		--[[
		-- EXAMPLE -- 
		if not buffactive['Phalanx'] then
			send_command('input /ma "Phalanx" <me>')
			return
		end

		if if not buffIdActive(33) and checkMagicalHasteCap() == false then
			send_command('input /ma "Haste II" <me>')
		end

		]]
	end

	-- These commands only happen when auto.fite mode is 'On'  ----------------------------------------------------
	-- Use case: things like auto 2 hour on cooldown, or other important JAs. Not stuff you'd want to let
	-- the script control if you were actually at the keyboard and playing.
	if auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving then
		
	end
end