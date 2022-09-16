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
		
		evalState_equipGear()
		windower.add_to_chat(122,'-- WeaponMode:'..weaponMode[weaponMode.index].name..' --')
	end
	-- Change current gear mode
	if cmdParams[1]:lower() == 'togglegearmode' then
		gearMode.index = gearMode.index + 1
		if gearMode.index > #gearMode then
			gearMode.index = 0
		end

		sets.idle = gearMode[gearMode.index].idle
		sets.engaged = gearMode[gearMode.index].engaged
		evalState_equipGear()
		windower.add_to_chat(122,'-- GearMode:'..gearMode[gearMode.index].name..' --')
	end
	
	-- Toggle autoBuff on / off
	if cmdParams[1]:lower() == 'toggleautobuff' then
		auto.buff.index = auto.buff.index + 1
		if auto.buff.index > #auto.buff then
			auto.buff.index = 0
		end
		windower.add_to_chat(122,'-- autoBuff:'..auto.buff[auto.buff.index]..' --')
	end

	-- Toggle autoFite mode
	if cmdParams[1]:lower() == 'toggleautofite' then
		auto.fite.index = auto.fite.index + 1
		if auto.fite.index > #auto.fite then
			auto.fite.index = 0
		end
		windower.add_to_chat(122,'-- autoFite:'..auto.fite[auto.fite.index]..' --')
	end

	-- Forward self commands on to the job_SelfCommand function in the job specific .lua, if it exists
	if extendedJobSelfCommand ~= nil then
		extendedJobSelfCommand(cmdParams, eventArgs)
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
	if extendedUser_Setup ~= nil then
		extendedUser_Setup()
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

	send_command('unbind !1')
	send_command('unbind !2')
	send_command('unbind !3')
	send_command('unbind !4')
	send_command('unbind !5')
	send_command('unbind !6')
end

-------------------------------------------------------------------------------------------------------------------
-- UTILITY FUNCTIONSSSSSSS
-------------------------------------------------------------------------------------------------------------------
function evalState_equipGear()
	-- if this gearMode contains a sub, overwrite the specified sub in weaponMode
	if gearMode[gearMode.index].engaged.sub ~= nil then
		sets.weapons = {main=weaponMode[weaponMode.index].set.main, sub=gearMode[gearMode.index].engaged.sub}
	else
		sets.weapons = weaponMode[weaponMode.index].set
	end
	
    sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged

	if moving then
		if player.status == 'Engaged' then
			equip(sets.engaged, sets.weapons, sets.moveSpeed)
		else
			equip(sets.idle, sets.weapons, sets.moveSpeed)
		end
	else
		if player.status == 'Engaged' then
			equip(sets.engaged, sets.weapons)
		else
			equip(sets.idle, sets.weapons)
		end
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

function dayWeatherIntensity(spellElement)
    local intensity = 0
    if world.day_element == spellElement then
        intensity = intensity + 1
    end
    
    if world.weather_element == spellElement then
        intensity = intensity + get_weather_intensity()
    end
    
    return intensity
end

function buffIdActive(buffId)
	local currentBuffs = windower.ffxi.get_player().buffs
	for _, v in pairs(currentBuffs) do
		if v == buffId then
			return true
		end
	end
	return false
end

function readyCharges()
    local recastTimers = windower.ffxi.get_ability_recasts()
    local readyRecast = recastTimers[102]
    local maxCharges = 3
    local recastTime = 15
    local fullRechargeTime = maxCharges * recastTime
    local currentCharges = math.floor(maxCharges - maxCharges * readyRecast / fullRechargeTime)
    return currentCharges
end

function setKeyBind(keys, command)
	if not keys or not command then
		add_to_chat(122,'setKeyBind: missing keys/command.')
		return
	end

	send_command('bind '..keys..' '..command)
end

-------------------------------------------------------------------------------------------------------------------
-- Cast Phases
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	-- don't try to do stuff if we can't do stuff (stop gearswap from switching gear if we can't act)
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
		evalState_equipGear()
        return
    end

	-- if weaponskill make sure we're facing the target
	if spell.type == 'WeaponSkill' then
		faceTarget()
	end

	-- If not a WS and elementalObi could help, equip it
	if spell.type ~= 'WeaponSkill' and dayWeatherIntensity(spell.element) > 0 then
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
	-- i don't have any universal midcast settings... but its here for later!
	
	-- if an extendedJobMidcast() exists in the job lua, call it
	if extendedJobMidcast ~= nil then
		extendedJobMidcast(spell, action, spellMap, eventArgs)
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
        local player = windower.ffxi.get_mob_by_index(player.index)
        if player and player.x and mov.x then
            local movement = math.sqrt( (player.x-mov.x)^2 + (player.y-mov.y)^2 + (player.z-mov.z)^2 ) > 0.1
            if movement and not moving then
				moving = true
                windower.send_command('input //gs equip sets.moveSpeed')
            elseif not movement and moving then
				moving = false
                if player.status == engaged then
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
end)

windower.register_event('action',function (act)
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