-------------------------------------------------------------------------------------------------------------------
-- Some global vars (best idea everrrrrrrrrrr)
-------------------------------------------------------------------------------------------------------------------
engaged = 1
idle = 0

-------------------------------------------------------------------------------------------------------------------
-- Job/User setup and keybinds
-------------------------------------------------------------------------------------------------------------------
function job_self_command(cmdParams, eventArgs)
	-- Mode toggle commands -----------------------------------------------------------------
	if cmdParams[1]:lower() == 'toggleweaponmode' then
		weaponMode.index = weaponMode.index + 1
		if weaponMode.index > #weaponMode then
			weaponMode.index = 0;
		end
		
		if extendedTWM then
			extendedTWM(cmdParams, eventArgs)
		end

		sets.weapons = weaponMode[weaponMode.index].set
		--windower.add_to_chat(122,'-- WeaponMode: '..weaponMode[weaponMode.index].name..' --')
		modeHud('update')
		evalState_equipGear()
	end
	
	-- Change current gear mode
	if cmdParams[1]:lower() == 'togglegearmode' then
		gearMode.index = gearMode.index + 1
		if gearMode.index > #gearMode then
			gearMode.index = 0
		end

		if extendedTGM then
			extendedTGM(cmdParams, eventArgs)
		end

		sets.idle = gearMode[gearMode.index].idle
		sets.engaged = gearMode[gearMode.index].engaged
		--add_to_chat(122,'-- GearMode:'..gearMode[gearMode.index].name..' --')
		modeHud('update')
		evalState_equipGear()
	end
	
	-- Toggle autoBuff on / off
	if cmdParams[1]:lower() == 'toggleautobuff' then
		auto.buff.index = auto.buff.index + 1
		if auto.buff.index > #auto.buff then
			auto.buff.index = 0
		end
		--windower.add_to_chat(122,'-- autoBuff:'..auto.buff[auto.buff.index]..' --')
		modeHud('update')
	end

	-- Toggle autoFite mode
	if cmdParams[1]:lower() == 'toggleautofite' then
		auto.fite.index = auto.fite.index + 1
		if auto.fite.index > #auto.fite then
			auto.fite.index = 0
		end
		--windower.add_to_chat(122,'-- autoFite:'..auto.fite[auto.fite.index]..' --')
		modeHud('update')
	end

	-- Forward self commands on to the job_SelfCommand function in the job specific .lua, if it exists
	if extendedJobSelfCommand ~= nil then
		extendedJobSelfCommand(cmdParams, eventArgs)
	end

	if cmdParams[1]:lower() == 'test' then
		-- debug/testing stuff goes hererereereere
	end
end

function user_setup()
	--Setup common binds for ALL jobs
	send_command('bind F9 gs c toggleGearMode')
	send_command('bind ^F9 gs c toggleWeaponMode')
	send_command('bind F11 gs c toggleAutoBuff')
	send_command('bind !F11 gs c toggleautofite')
	send_command('bind F12 gs reload')
	
	--if an extendedUserSetup() exists in the job lua, call it
	if extendedUserSetup ~= nil then
		extendedUserSetup()
	end
end

function user_unload()
    -- Unbind alllllll the keys.  Anything you add anywhere should get unbound here
	windower.send_command('unbind ^=')
	windower.send_command('unbind !=')
    windower.send_command('unbind ^insert')
    windower.send_command('unbind ^delete')
    windower.send_command('unbind F9')
	windower.send_command('unbind ^F9')
	windower.send_command('unbind F10')
	windower.send_command('unbind F11')
	windower.send_command('unbind ^F11')
	windower.send_command('unbind !F11')
	windower.send_command('unbind F12')

	if extendedUserUnload ~= nil then
		extendedUserUnload()
	end
end

-------------------------------------------------------------------------------------------------------------------
-- UTILITY FUNCTIONSSSSSSS
-------------------------------------------------------------------------------------------------------------------
function evalState_equipGear()
	if extendedEvalState_equipGear then
		extendedEvalState_equipGear()
	end
	
	if player.status == 'Engaged' then
		equip(sets.engaged, sets.weapons)
	else
		equip(sets.idle, sets.weapons)
	end
	if moving then
		equip(sets.moveSpeed)
	end
end

function faceTarget()
	local M = windower.ffxi.get_mob_by_target('t')
	local P = windower.ffxi.get_mob_by_target('me')
    local delta = {Y = (P.y - M.y),X = (P.x - M.x)}
    local angleInDegrees = (math.atan2( delta.Y, delta.X) * 180 / math.pi)*-1
    local mult = 10^0
    windower.ffxi.turn(((math.floor(angleInDegrees * mult + 0.5) / mult)+180):radian())
end

function dayWeatherIntensity(spellElement) -- feed spellElement, get back 0-3.  (matching day = 1, matching weather(s) = 1 or 2)
    local intensity = 0
    if world.day_element == spellElement then
        intensity = intensity + 1
    end
    if world.weather_element == spellElement then
        intensity = intensity + get_weather_intensity()
    end
    return intensity
end

function bestObiElement()
	local elements = {
		[0] = "Wind",
		[1] = "Light",
		[2] = "Fire",
		[3] = "Ice",
		[4] = "Earth",
		[5] = "Lightning",
		[6] = "Water",
		[7] = "Dark"
	}
	
	local maxIntensityEle = world.day_element
	local maxIntensity = 1
	for _,element in pairs(elements) do
		local thisVal = dayWeatherIntensity(element)
		--add_to_chat(122, 'element: '..element..' intensity: '..thisVal)
		if thisVal > maxIntensity then
			maxIntensity = thisVal
			maxIntensityEle = element
		end
	end

	return maxIntensityEle
end

function buffIdActive(buffId) -- is buff active? using buffId not name
	local currentBuffs = windower.ffxi.get_player().buffs
	for _, v in pairs(currentBuffs) do
		if v == buffId then
			return true
		end
	end
	return false
end

function readyCharges() -- for bst ability 'Ready'
    local recastTimers = windower.ffxi.get_ability_recasts()
    local readyRecast = recastTimers[102]
    local maxCharges = 3
    local recastTime = 15
    local fullRechargeTime = maxCharges * recastTime
    local currentCharges = math.floor(maxCharges - maxCharges * readyRecast / fullRechargeTime)
    return currentCharges
end

function strategemCount() -- get number of strategems
    local player = windower.ffxi.get_player()
	local singleStratCooldown
	local maxStrategems
	local schLevel

	if player.main_job == 'SCH' then
		schLevel = player.main_job_level
	elseif player.sub_job == 'SCH' then
		schLevel = player.sub_job_level
	else
		add_to_chat(122, 'Not main or sub sch! No strategems for you!')
		return
	end

	if schLevel == 99 and player.job_points.sch.jp_spent >= 550 then
		singleStratCooldown = 33
		maxStrategems = 5
	elseif schLevel >= 90 then
		singleStratCooldown = 48
		maxStrategems = 5
	elseif schLevel >= 70 then
		singleStratCooldown = 60
		maxStrategems = 4
	elseif schLevel >= 50 then
		singleStratCooldown = 80
		maxStrategems = 3
	elseif schLevel >= 30 then
		singleStratCooldown = 120
		maxStrategems = 2
	elseif schLevel >= 10 then
		singleStratCooldown = 240
		maxStrategems = 1
	end

    local fullRechargeTime = maxStrategems * singleStratCooldown
	local stratsRecast = windower.ffxi.get_ability_recasts()[231]
    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
    return currentCharges
end

function partyLowHP(hpLevel, action)
	local mostRipHp = hpLevel
	local mostRipName = ""
	local partyInfo = windower.ffxi.get_party()
	
	for _,info in pairs(partyInfo) do
		if type(info) == 'table' and info.mob then
			local partyMember = info.mob
			if partyMember.hpp < hpLevel then
				if action == nil then
					return true
				else
					if partyMember.hpp < mostRipHp then
						mostRipHp = partyMember.hpp
						mostRipName = partyMember.name
					end
				end
			end
		end
	end
	if action == nil then
		return false
	else
		send_command('input '..action..' '..mostRipName)
	end
end

function maintainBuff(buffNameOrId, commandString)
	if type(buffNameOrId) == 'string' then
		if not buffactive[buffNameOrId] and not actionInProgress and not moving then
			send_command('input '..commandString)
		end
	elseif type(buffNameOrId) == 'number' then
		if not buffIdActive(buffNameOrId) and notactionInProgress and not moving then
			send_command('input '..commandString)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Cast Phases
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	--add_to_chat(1, 'Spell: '..spell.name..' SpellType: '..spell.type)
	
	-- don't try to do stuff if we can't do stuff (stop gearswap from switching gear if we can't act)
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
		--evalState_equipGear()
        return
    end

	-- if weaponskill make sure we're facing the target
	if spell.type == 'WeaponSkill' then
		faceTarget()
	end

	-- If not a WS and elementalObi could help, equip it
	if not ('WeaponSkill,Rune'):contains(spell.type) and dayWeatherIntensity(spell.element) > 0 then
		equip({waist="Hachirin-no-Obi"})
	end

	-- Utsusemi helper
	if spell.english:contains('Utsusemi') then
		-- if we have 3 or 4+ shadows - don't cast utsusemi.  Cancel it.
		if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
			eventArgs.cancel = true
			add_to_chat(123, '**!! ' .. spell.english .. ' Canceled: [3+ IMAGES] !!**')
		-- if we have 1 or 2 shadows cancel them before the new spell (ichi can't overwrite ni)
		elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
			send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
		end
	end

	-- if an extendedJobPrecast() exists in the job lua, call it
	if extendedJobPrecast ~= nil then
		extendedJobPrecast(spell, action, spellMap, eventArgs)
	end
end

function job_midcast(spell, action, spellMap, eventArgs)

	-- if an extendedJobMidcast() exists in the job lua, call it
	if extendedJobMidcast ~= nil then
		extendedJobMidcast(spell, action, spellMap, eventArgs)
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if extendedJobPostMidcast ~= nil then
		extendedJobPostMidcast(spell, action, spellMap, eventArgs)
	end
	
	-- if spell element matches day or weather element, and it's not an excluded type, use mega obi
	local obiSpellTypes = "BlueMagic,ElementalMagic,HealingMagic"
	if dayWeatherIntensity(spell.element) > 0 and obiSpellTypes:contains(spell.type) then
		add_to_chat(1, 'Hachirin-no-Obi goooooooo!')
		equip({waist="Hachirin-no-Obi"})
	end
end

function job_aftercast(spell, action, spellMap, eventArgs)
	-- i don't have any universal aftercast settings... but its here for later!


	-- if an extendedJobAftercast() exists in the job lua, call it
	if extendedJobAftercast ~= nil then
		extendedJobAftercast(spell, action, spellMap, eventArgs)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Mode Display HUD
-------------------------------------------------------------------------------------------------------------------
function modeHud(action)
    red = '\\cs(255,0,0)'
	green = '\\cs(0,255,0)'
	white = '\\cs(255,255,255)'

	if action == 'update' then
		-- hud doesn't exist yet.  create it!
		if modeHudWindow == nil then
			hud = require('texts')
			modeHud_xPos = 1250
			modeHud_yPos = 0
			modeHudWindow = texts.new("")	
		end

		local hudText = L{}
		-- add current weapon and gear modes
		hudText:append('WeaponMode: '..weaponMode[weaponMode.index].name)
		hudText:append('GearMode: '..gearMode[gearMode.index].name)
		
		-- if extendedModeHud function exists in main job .lua, call that
		if (extendedModeHud) ~= nil then
			hudText = extendedModeHud(hudText)
		end
		
		-- add auto.buff and auto.fite status
		local autoBuff = auto.buff[auto.buff.index]
		local autoFite = auto.fite[auto.fite.index]
		hudText:append('auto.Buff: '..getBoolColor(autoBuff))
		hudText:append('auto.Fite: '..getBoolColor(autoFite))

		hud.text(modeHudWindow, hudText:concat('  |  '))
		hud.visible(modeHudWindow, true)
		hud.pos(modeHudWindow, modeHud_xPos, modeHud_yPos)
		hud.bg_alpha(modeHudWindow, 100)
	end 

	if action == 'remove' then
		texts.visible(modeHudWindow, false)
	end
end

function getBoolColor(bool)
	if bool == 'On' then
		return green..bool..white
	end
	return red..bool..white
end

-------------------------------------------------------------------------------------------------------------------
-- THE LOOOOOOOOOOOP
-------------------------------------------------------------------------------------------------------------------
-- initial vars for autoCast looping
actionInProgress = false
time_start = os.time()
-- initial vars for movement detection / movespeed swap
mov = {counter=0}
moving = false
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

windower.raw_register_event('prerender',function()
    -- determine if we're moving or not, handle movespeed gear swaps
	mov.counter = mov.counter + 1;
    if mov.counter > 2 then
        local player = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index)
		if player and player.x and mov.x then
            local movement = math.sqrt( (player.x-mov.x)^2 + (player.y-mov.y)^2 + (player.z-mov.z)^2 ) > 0.1
            if movement and not moving then
				moving = true
                if sets.NightMovement ~= nil and sets.DayMovement ~= nil then
					if world.time >= (17*60) or world.time <= (7*60) then
						windower.send_command('input //gs equip sets.NightMovement')
					else
						windower.send_command('input //gs equip sets.DayMovement')
					end
				else
					windower.send_command('input //gs equip sets.moveSpeed')
				end
            elseif not movement and moving then
				moving = false
				if windower.ffxi.get_player().status == engaged then
					windower.send_command('input //gs equip sets.engaged')
                else
					windower.send_command('input //gs equip sets.idle')
                end
            end
        end
        if player and player.x then
            mov.x = player.x
            mov.y = player.y
            mov.z = player.z
        end
        mov.counter = 0
	end

	-- everytime os.time updates (once a second) call autoActions() if it exists and handle actionDelay counter
	if os.time() > time_start then
		time_start = os.time()		
		if autoActions ~= nil then
			autoActions()
		end

		-- Compensate for cast animations lasting longer than 'actual' spellcast
		if actionDelay then
			actionDelay = actionDelay + 1
			if actionDelay > 3 then
				actionInProgress = false
				actionDelay = nil
			end
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------
-- EVENT TRIGGERS
-------------------------------------------------------------------------------------------------------------------
windower.register_event('zone change', function()
	-- Turn off autobuff and autofite modes when we zone
	if auto.buff.index == 1 then auto.buff.index = 0 end
	if auto.fite.index == 1 then auto.fite.index = 0 end
	modeHud('update')
end)

windower.register_event('action',function(act)
	if not act then return end

	local actor = windower.ffxi.get_mob_by_id(act.actor_id)
	local self = windower.ffxi.get_player()
	local category = act.category
    local param = act.param
    
    if actor and self and actor.id == self.id then
        -- is a spell, but not a 'spell was interrupted' action
		if category == 8 and param ~= 28787 then
			actionInProgress = true
		end

		-- a spell completes or is interrupted
		if category == 4 or category == 8 and param == 28787 then
			actionInProgress = true
			actionDelay = 1
		end
		
		-- a job ability completes (delay set higher because there is less action downtime after a JA)
		if category == 6 then
			actionInProgress = true
			actionDelay = 3
		end
    end
end)