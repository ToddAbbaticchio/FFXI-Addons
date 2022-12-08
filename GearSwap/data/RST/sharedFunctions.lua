-------------------------------------------------------------------------------------------------------------------
-- Some global vars (best idea everrrrrrrrrrr)
-------------------------------------------------------------------------------------------------------------------
engaged = 1
idle = 0
res = require 'resources'

red = "\\cs(255,0,0)"
green = "\\cs(0,255,0)"
white = "\\cs(255,255,255)"
lightBlue = "\\cs(102,255,255)"
purple = "\\cs(101,31,255)"

eleWeaponSkills = S{
	--[[daggger]]       'Gust Slash', 'Cyclone', 'Energy Steal', 'Energy Drain', 'Aeolian Edge',
	--[[sword]]         'Burning Blade', 'Red Lotus Blade', 'Shining Blade', 'Seraph Blade', 'Sanguine Blade', 'Atonement',
	--[[greatsword]]    'Frost Bite', 'Freeze Bite', 'Herculean Slash',
	--[[axe]]           'Cloud Splitter', 'Primal Rend',
	--[[scythe]]        'Dark Harvest', 'Shadow of Death', 'Infernal Scythe',
	--[[polearm]]       'Thunder Thrust', 'Raiden Thrust',
	--[[katana]]        'Blade: Teki', 'Blade: To', 'Blade: Chi', 'Blade: Ei', 'Blade: Yu',
	--[[greatkatana]]   'Tachi: Goten', 'Tachi: Kagero', 'Tachi: Jinpu', 'Tachi: Koki',
	--[[club]]          'Shining Strike', 'Seraph Strike', 'Flash Nova',
	--[[staff]]         'Rock Crusher', 'Earth Crusher', 'Starburst', 'Sunburst', 'Cataclysm', 'Vidohunir', 'Garland of Bliss', 'Omniscience',
	--[[ranged]]        'Flaming Arrow', 'Hot Shot', 'Wildfire', 'Trueflight', 'Leaden Salute'
}
multiStepAction = {}

-------------------------------------------------------------------------------------------------------------------
-- Job/User setup and keybinds
-------------------------------------------------------------------------------------------------------------------
function job_self_command(cmdParams, eventArgs)
	-- Mode toggle commands -----------------------------------------------------------------
	if cmdParams[1]:lower() == 'toggleweaponmode' then
		if extendedTWM then
			extendedTWM(cmdParams, eventArgs)
		end

		weaponMode.index = weaponMode.index + 1
		if weaponMode[weaponMode.index] ~= nil and weaponMode[weaponMode.index].hidden ~= nil and weaponMode[weaponMode.index].hidden == true then
			weaponMode.index = weaponMode.index + 1
		end
		if weaponMode.index > #weaponMode then
			weaponMode.index = 0;
		end
		
		updateSetsFromModes('weapon')
		modeHud('update')
		evalState_equipGear()
	end
	
	-- Change current gear mode
	if cmdParams[1]:lower() == 'togglegearmode' then
		if extendedTGM then
			extendedTGM(cmdParams, eventArgs)
		end
		
		gearMode.index = gearMode.index + 1
		if gearMode[gearMode.index] ~= nil and gearMode[gearMode.index].hidden ~= nil and gearMode[gearMode.index].hidden == true then
			gearMode.index = gearMode.index + 1
		end
		if gearMode.index > #gearMode then
			gearMode.index = 0
		end

		updateSetsFromModes('gear')
		modeHud('update')
		evalState_equipGear()
	end

	-- Change current magic mode
	if cmdParams[1]:lower() == 'togglemagicmode' then
		magicMode.index = magicMode.index + 1
		if magicMode.index > #magicMode then
			magicMode.index = 0
		end

		if extendedTMM then
			extendedTMM(cmdParams, eventArgs)
		end

		updateSetsFromModes('magic')
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

	if useElementalWheelHud then
		if cmdParams[1]:lower() == 'elewheelup' then
			eleMode.index = eleMode.index + 1
			if eleMode.index > #eleMode then
				eleMode.index = 0
			end
			eleHud('update')
		end
		if cmdParams[1]:lower() == 'elewheeldown' then
			eleMode.index = eleMode.index - 1
			if eleMode.index < 0 then
				eleMode.index = #eleMode
			end
			eleHud('update')
		end
	end

	-- Forward self commands on to the job_SelfCommand function in the job specific .lua, if it exists
	if extendedJobSelfCommand ~= nil then
		extendedJobSelfCommand(cmdParams, eventArgs)
	end

	if cmdParams[1]:lower() == 'test' then
		add_to_chat(1, 'test: '..tostring(test))
		--isMonsterNear('Skeea')
	end

	if cmdParams[1]:lower() == 'ignorelastmatch' then
		ignoreList = ignoreList..','..lastMatch
	end
end

function user_setup()
	--Setup common binds for ALL jobs
	send_command('bind F9 gs c toggleGearMode')
	send_command('bind ^F9 gs c toggleWeaponMode')
	send_command('bind !F9 gs c toggleMagicMode')
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
	send_command('unbind ^=')
	send_command('unbind !=')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind F9')
	send_command('unbind ^F9')
	send_command('unbind !F9')
	send_command('unbind F10')
	send_command('unbind F11')
	send_command('unbind ^F11')
	send_command('unbind !F11')
	send_command('unbind F12')

	if extendedUserUnload ~= nil then
		extendedUserUnload()
	end

	if eleWheelText ~= nil then
		eleHud('dispose')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- OUR CUSTOM UTILITY FUNCTIONSSSSSSS
-------------------------------------------------------------------------------------------------------------------
function evalState_equipGear()
	if extendedEvalState_equipGear then
		extendedEvalState_equipGear()
	end
	
	if player.status == 'engaged' then
		equip(sets.engaged, sets.weapons)
	else
		equip(sets.idle, sets.weapons)
	end
	if moving then
		equip(sets.moveSpeed)
	end
end

function updateSetsFromModes(mode)
	if mode == 'gear' then
		sets.idle = gearMode[gearMode.index].idle
		sets.engaged = gearMode[gearMode.index].engaged
		return
	end
	if mode == 'weapon' then
		sets.weapons = weaponMode[weaponMode.index].set
		return
	end
	if mode == 'magic' then
		local currModeSet = magicMode[magicMode.index].set or nil
		if currModeSet == nil then
			add_to_chat(122, 'Check magicMode table format')
			return
		end

		for magicType,gearSet in pairs(currModeSet) do
			sets.midcast[magicType] = gearSet
		end
	end

	-- if not specified update all
	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
end

function setModeIndex(mode, index)
	if mode == 'gear' then
		gearMode.index = index
	end
	if mode == 'weapon' then
		weaponMode.index = index
	end

	updateSetsFromModes(mode)
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

function bestEleWsBelt(spell)
	-- This assumes the actual gearset for the WS calls out your best option for waist
	-- that isn't either oSash or obi. returning nil just won't override the defined set
	-- waist option during postmidcast

	-- have both defined
	if sets.obi ~= nil and sets.oSash ~= nil then
		local obiCheck = dayWeatherIntensity(spell.element)

		-- at 2 or 3 intensity obi always beats oSash
		if obiCheck >= 2 then
			return sets.obi
		end

		-- at 1 intensity obi wins beyond 7 yalms. oSash wins inside 7
		if obiCheck == 1 then
			local dist = spell.target.distance or nil
			if dist and dist <= 7 then
				return sets.oSash
			else
				return sets.obi
			end
		end
		
		-- no intensity: oSash within 10 yalms BiS Int/MAB belt outside that
		if spell.target.distance <= 10 then
			return sets.oSash
		end

		return nil
	end

	-- just have obi defined and bonus exists
	if sets.obi ~= nil and dayWeatherIntensity(spell.element) > 0 then
		return sets.obi
	end

	-- just have oSash defined and within 10 yalms
	if sets.oSash ~= nil and spell.target.distance <= 10 then
		return sets.oSash
	end

	-- nothing defined, no belt override set returned
	return nil
end

function buffIdActive(buffId)
	local currentBuffs = windower.ffxi.get_player().buffs
	for _,id in pairs(currentBuffs) do
		if id == buffId then
			return true
		end
	end
	return false
end

function betterBuffActive(buffName, buffCount)
	local buffId = res.buffs:with('en', buffName) and res.buffs:with('en', buffName).id

	for k,v in pairs(res.buffs) do
		if v.en == buffName then
			buffId = v.id
			break
		end
	end

	if buffId == nil then
		add_to_chat(1, 'Could not find a match for buff: '..buffName..' in resource files! Check spelling!')
		return true -- return true to prevent cast spamming
	end

	if not buffCount then
		buffCount = 1
	end
	local currentBuffs = windower.ffxi.get_player().buffs
	local foundCount = 0
	for _,id in pairs(currentBuffs) do
		if id == buffId then
			foundCount = foundCount + 1
		end
	end
	
	if foundCount >= buffCount then
		return true
	end
	return false
end

function onCooldown(actionName)
	for k,v in pairs(res.job_abilities) do
		if v.en == actionName and v.recast_id ~= 0 then
			local recast = windower.ffxi.get_ability_recasts()[v.recast_id] or nil
			if recast == nil then
				break
			end
			if recast > 0 then
				return true
			end
			if recast == 0 then
				return false
			end
		end
	end

	for k,v in pairs(res.spells) do
		if v.en == actionName and v.recast_id ~= 0 then
			local recast = windower.ffxi.get_spell_recasts()[v.recast_id] or nil
			if recast == nil then
				break
			end
			if recast > 0 then
				return true
			end
			if recast == 0 then
				return false
			end
		end
	end

	add_to_chat(1, 'Didnt find a match for actionName: '..actionName..' in res.job_abilities or res.spells!')
	return true --return true to stop attempts to spam ability
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
    local playerInfo = windower.ffxi.get_player()
	local singleStratCooldown
	local maxStrategems
	local schLevel

	if playerInfo.main_job == 'SCH' then
		schLevel = playerInfo.main_job_level
	elseif playerInfo.sub_job == 'SCH' then
		schLevel = playerInfo.sub_job_level
	else
		add_to_chat(122, 'Not main or sub sch! No strategems for you!')
		return
	end

	if schLevel == 99 and playerInfo.job_points.sch.jp_spent >= 550 then
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

function checkMagicalHasteCap()
	local hasteBuffs = "33,214,580"
	local currentBuffs = windower.ffxi.get_player().buffs
	local count = 0
	for _,id in pairs(currentBuffs) do
		if hasteBuffs:contains(id) then
			count = count + 1
		end
	end

	if count >= 2 then
		return true
	end
	return false
end

function mpCheck(spellName)
	local spellmp = res.spells:with('en', spellName) and res.spells:with('en', spellName).mp_cost or nil
	if spellmp and player.mp >= spellmp then
		return true
	end
	return false
end

function isMonsterNear(monsterName)
	local monsters = windower.ffxi.get_mob_array()
	add_to_chat(1, type(monsters))
	local foundMonster = monsters:where('name', monsterName) or nil
	if foundMonster then
		send_command('input /p ~~ZOMG its '..monsterName..' <call>~~')
	end
	--[[ for _,monster in pairs(monsters) do
        if monster.name == monsterName then
           send_command('input /p ~~ZOMG its '..monsterName..' <call>~~')
            return
        end
    end ]]
end

function tellXYZ(monsterName)
	if ignoreList == nil then ignoreList = "" end

	local monsters = windower.ffxi.get_mob_array()
	local pos = windower.ffxi.get_mob_by_target('me')
    local playerX = math.floor(pos.x)
	local playerY = math.floor(pos.y)
	local xDirection
	local yDirection

	lastMatch = ""
	local closestDist = 999
	local matchX = 0
	local matchY = 0

	for _,monster in pairs(monsters) do
        if monster.name == monsterName and not ignoreList:contains(monster.id) then
            if monster.distance < closestDist then
				lastMatch = monster.id
				matchX = math.floor(monster.x)
				matchY = math.floor(monster.y)
			end
        end
    end

	if lastMatch ~= "" then
		--add_to_chat(1, matchX..'/'..math.floor(pos.x)..' || '..matchY..'/'..math.floor(pos.y)..'  -  Closest '..monsterName..' id: '..lastMatch)

		if matchX > playerX then
			xDirection = "North"
		else
			xDirection = "South"
		end
		if matchY > playerY then
			yDirection = "East"
		else
			yDirection = "West"
		end

		add_to_chat(1, xDirection..yDirection..' || '..matchX..'/'..playerX..' || '..matchY..'/'..playerY..'  -  Closest '..monsterName..' id: '..lastMatch)
	end
end

-- Not good for buffs (like regen - it'll spam even though the target already has regen on)
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
				end
				
				if partyMember.hpp < mostRipHp then
					mostRipHp = partyMember.hpp
					mostRipName = partyMember.name
				end
			end
		end
	end
	
	if mostRipName == "" then
		return false
	else
		send_command('input '..action..' '..mostRipName)
	end
end

function buffCheck(...)
	local buffName = nil
	local abilName = nil
	local count = nil
	local args = {...}

	if args[1] and not args[2] then
		if not betterBuffActive(args[1], 1) and not onCooldown(args[1]) then
			return true
		end
		return false
	end

	if args[2] and not args[3] then
		if type(args[2]) == 'string' then
			if not betterBuffActive(args[1], 1) and not onCooldown(args[2]) then
				return true
			end
			return false
		end
		if type(args[2]) == 'number' then
			if not betterBuffActive(args[1], args[2]) and not onCooldown(args[1]) then
				return true
			end
			return false
		end
	end

	if args[3] and type(args[3] == 'number') then
		if not betterBuffActive(args[1], args[3]) and not onCooldown(args[2]) then
			return true
		end
		return false
	end

	write_to_chat(1, 'Syntax error calling buffCheck! '..tostring(args))
	return false
end

function tryAutoSpellStep(spell)
    for spellFamily,spellList in pairs(spellSteps) do
		if spell.en:startswith(spellFamily) then
			local triedSpell = table.find(spellList, spell.en) or nil
			local currIndex = triedSpell and triedSpell + 1 or nil
			local swapSpell = currIndex and spellList[currIndex] or nil
			while swapSpell and onCooldown(swapSpell) do
				currIndex = currIndex + 1
				swapSpell = spellList[currIndex]
			end
			send_command('/'..swapSpell)
		end
	end
end

function tryCleanQueue(category, param)
    local actionName = nil
    local queueAction = multiStepAction[1] or nil
    ---
    if category == 3 then
        actionName = res.weapon_skills[param] and res.weapon_skills[param].en or nil
        if actionName and queueAction and queueAction:contains(actionName) then
            table.remove(multiStepAction, 1)
            return
        end
    end
    ---
    if category == 4 then
		actionName = res.spells[param] and res.spells[param].en or nil
        if actionName and queueAction then
            if queueAction:contains(actionName) then
                table.remove(multiStepAction, 1)
                return
            end
        end
        if actionName and queueAction then
            if queueAction:contains(actionName) then
                table.remove(multiStepAction, 1)
                return
            end
        end
    end

    if category == 6 then
        actionName = res.job_abilities[param] and res.job_abilities[param].en or nil
        if actionName and queueAction then
            if queueAction:contains(actionName) then
                table.remove(multiStepAction, 1)
                return
            end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Cast Phases
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	--add_to_chat(1, 'Spell: '..spell.name..' SpellType: '..spell.type..' TargetDistance: '..spell.target.distance)
	
	-- don't try to do stuff if we can't do stuff (stop gearswap from switching gear if we can't act)
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] or (spell.type:contains('Magic') and buffactive['Silence']) or (spell.type == 'JobAbility' and buffactive['Amnesia']) then
        add_to_chat(167, 'Action stopped: A status ailment prevents using '..spell.name..'!')
        eventArgs.cancel = true
        return
    end
	if spell.type:contains('Magic') then
		if not mpCheck(spell.name) then
			add_to_chat(167, 'Action stopped: Not enough MP to cast '..spell.name..'!')
        	eventArgs.cancel = true
        	return
		end
		if spell.target.distance > 24 then
			add_to_chat(167, 'Action stopped: Target is out of range for '..spell.name..'!')
			eventArgs.cancel = true
			return
		end
	end
	if spell.type == 'WeaponSkill' then
		local isRanged = ranged_weaponskills:contains(spell.name)
		if (spell.target.distance > 25 and isRanged) or (spell.target.distance > 6 and not isRanged) then
			add_to_chat(167, 'Action stopped: Target is out of range for '..spell.name..'!')
			eventArgs.cancel = true
			return
		end
	end
	
	-- if weaponskill: face target and check/apply belt override conditions
	if spell.type == 'WeaponSkill' then
		faceTarget()
		if eleWeaponSkills:contains(spell.name) then
			local checkBelt = bestEleWsBelt(spell)
			if checkBelt ~= nil then
				equip(checkBelt)
			end
		end
	end

	-- Utsusemi helper
	if spell.english:contains('Utsusemi') then
		if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
			eventArgs.cancel = true
		end
		if buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
			send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
		end
	end

	-- If on cooldown and in spellStep table, tryAutoStepSpell
    if spell.type:contains('Magic') and onCooldown(spell.name) and spellSteps then
        eventArgs.cancel = true
        tryAutoSpellStep(spell)
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
	
	if eleWeaponSkills:contains(spell.name) or spell.type:contains('Magic') then
		if dayWeatherIntensity(spell.element) >= 2 and sets.obi then
			-- use hachi if bonus is 20% or better
			equip(sets.obi)
		elseif spell.target.distance < (7 - spell.target.model_size) and sets.oSash then
			-- use orpheus if distance is more than 7 - target size
			equip(sets.oSash)
		end
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
-- Mode Display HUDs
-------------------------------------------------------------------------------------------------------------------
function modeHud(action)
	if action == 'update' then
		-- hud doesn't exist yet.  create it!
		if modeHudWindow == nil then
			hud = require('texts')
			modeHud_xPos = 1200
			modeHud_yPos = 0
			modeHudWindow = texts.new("")	
		end

		local hudText = L{}
		-- add current weapon and gear modes
		if weaponMode then
			local wmColor = weaponMode[weaponMode.index].color or white
			hudText:append('WeaponMode: '..wmColor..weaponMode[weaponMode.index].name..white)
		end
		if gearMode then
			local gmColor = gearMode[gearMode.index].color or white
			hudText:append('GearMode: '..gmColor..gearMode[gearMode.index].name..white)
		end
		if magicMode then
			local maColor = magicMode[magicMode.index].color or white
			hudText:append('MagicMode: '..maColor..magicMode[magicMode.index].name..white)
		end
		
		-- if extendedModeHud function exists in main job .lua, call that
		if (extendedModeHud) ~= nil then
			hudText = extendedModeHud(hudText)
		end
		
		-- add auto.buff and auto.fite status
		local autoBuff = auto.buff[auto.buff.index]
		local autoFite = auto.fite[auto.fite.index]
		hudText:append('auto.Buff: '..getModeColor(autoBuff))
		hudText:append('auto.Fite: '..getModeColor(autoFite))

		hud.text(modeHudWindow, hudText:concat('  |  '))
		hud.visible(modeHudWindow, true)
		hud.pos(modeHudWindow, modeHud_xPos, modeHud_yPos)
		hud.bg_alpha(modeHudWindow, 100)
	end

	if action == 'remove' then
		texts.visible(modeHudWindow, false)
	end
end
function getModeColor(mode)
	if mode == 'On' then
		return green..mode..white
	end
	if mode == 'Off' then
		return red..mode..white
	end
	if mode:contains('Heal') then
		return green..mode..white
	end
	if mode:contains('Burst') or mode:contains('Nuke') then
		return purple..mode..white
	end
end

function eleHud(action)
	if action == 'create' then
		useElementalWheelHud = true
		send_command('bind ^insert gs c elewheelup')
    	send_command('bind ^delete gs c elewheeldown')
	
		eleIconSize = 75
		eleIconXpos = 1500
		eleIconYpos = 75
		iconPath = windower.addon_path..'\\data\\RST\\icons\\'
		
		-- create prim eleIcon
		windower.prim.create('eleWheelIcon')
		windower.prim.set_color('eleWheelIcon', 255, 255, 255, 255)
		windower.prim.set_fit_to_texture('eleWheelIcon', false)
		windower.prim.set_texture('eleWheelIcon', iconPath..eleMode[eleMode.index].element..'.png')
		windower.prim.set_visibility('eleWheelIcon', true)
		windower.prim.set_position('eleWheelIcon', eleIconXpos, eleIconYpos)
		windower.prim.set_size('eleWheelIcon', eleIconSize, eleIconSize)

		-- setup ele table because life hacks
		ele = {}
		ele.find = {}
		ele.list = S{'Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water'}
		ele.weak_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Ice', ['Ice']='Wind', ['Wind']='Earth', ['Earth']='Lightning', ['Lightning']='Water', ['Water']='Fire'}
		ele.strong_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Water', ['Ice']='Fire', ['Wind']='Ice', ['Earth']='Wind', ['Lightning']='Earth', ['Water']='Lightning'}
		ele.find.mainspell_of = {['Light']="Cure IV", ['Dark']="Impact", ['Fire']="Fire V", ['Earth']="Earth V",['Water']="Water V", ['Wind']="Aero V", ['Ice']="Blizzard V", ['Lightning']="Thunder V"}
		ele.find.skillchain_of = {['Light']="Fusion", ['Dark']="Gravitation", ['Fire']="Fusion", ['Earth']="Gravitation",['Water']="Distortion", ['Wind']="Fragmentation", ['Ice']="Distortion", ['Lightning']="Fragmentation"}
		ele.find.storm_of = {['Light']="Aurorastorm", ['Dark']="Voidstorm", ['Fire']="Firestorm", ['Earth']="Sandstorm",['Water']="Rainstorm", ['Wind']="Windstorm", ['Ice']="Hailstorm", ['Lightning']="Thunderstorm"}
		ele.find.storm2_of = {['Light']="Aurorastorm II",['Dark']="Voidstorm II", ['Fire']="Firestorm II", ['Earth']="Sandstorm II", ['Water']="Rainstorm II", ['Wind']="Windstorm II",['Ice']="Hailstorm II", ['Lightning']="Thunderstorm II"}
		ele.find.helix_of = {['Light']="Luminohelix", ['Dark']="Noctohelix", ['Fire']="Pyrohelix", ['Earth']="Geohelix",['Water']="Hydrohelix", ['Wind']="Anemohelix", ['Ice']="Cryohelix", ['Lightning']="Ionohelix"}
		ele.find.helix2_of = {['Light']="Luminohelix II", ['Dark']="Noctohelix II", ['Fire']="Pyrohelix II", ['Earth']="Geohelix II",['Water']="Hydrohelix II", ['Wind']="Anemohelix II", ['Ice']="Cryohelix II", ['Lightning']="Ionohelix II"}
		ele.spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit", ['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}
		ele.rune_of = {['Light']='Lux', ['Dark']='Tenebrae', ['Fire']='Ignis', ['Ice']='Gelus', ['Wind']='Flabra', ['Earth']='Tellus', ['Lightning']='Sulpor', ['Water']='Unda'}

		-- create texts eleText
		texts = require('texts')
		eleWheelText = texts.new('${element}\n${msg1}\n${msg2}')
		texts.visible(eleWheelText, true)
		eleWheelText.element = eleMode[eleMode.index].element
		eleWheelText.msg1 = eleMode[eleMode.index].msg1
		eleWheelText.msg2 = eleMode[eleMode.index].msg2
		texts.pos(eleWheelText, eleIconXpos, eleIconYpos + 80)
		texts.bg_alpha(eleWheelText, 0)
		hudFadeTime = os.time()
	end
	
	if action == 'update' then
		windower.prim.set_texture('eleWheelIcon', iconPath..eleMode[eleMode.index].element..'.png')
		texts.visible(eleWheelText, true)
		eleWheelText.element = eleMode[eleMode.index].element
		eleWheelText.msg1 = eleMode[eleMode.index].msg1
		eleWheelText.msg2 = eleMode[eleMode.index].msg2
		hudFadeTime = os.time()
	end

	if action == 'dispose' then
		windower.prim.delete('eleWheelIcon')
		texts.destroy(eleWheelText)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Buff table updating
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
	if state.Buff[buff] == nil and active then
		state.Buff[buff] = true
	else
		state.Buff[buff] = nil
	end

	if extendedJobBuffChange ~= nil then
		extendedJobBuffChange(buff, active)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- THE LOOOOOOOOOOOP
-------------------------------------------------------------------------------------------------------------------
-- initial vars for autoCast looping
local lastCycleTime = os.time()

-- initial vars for movement detection / movespeed swap
local playerInfo = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index)
local mov = {
	counter = 0,
	x = playerInfo.x or 0,
	y = playerInfo.y or 0,
	z = playerInfo.z or 0
}
moving = false

windower.raw_register_event('prerender',function()
    -- determine if we're moving or not, handle movespeed gear swaps
	mov.counter = mov.counter + 1;
    if mov.counter > 2 then
        local playerInfo = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index) or nil
		if playerInfo and playerInfo.x and mov.x then
            local movement = math.sqrt((playerInfo.x - mov.x) ^ 2 + (playerInfo.y - mov.y) ^ 2 + (playerInfo.z - mov.z) ^ 2) > 0.1
            if movement and not moving then
				moving = true
                if sets.NightMovement ~= nil and sets.DayMovement ~= nil then
					if world.time >= (17*60) or world.time <= (7*60) then
						windower.send_command('input //gs equip sets.NightMovement')
					else
						windower.send_command('input //gs equip sets.DayMovement')
					end
				elseif sets.moveSpeed ~= nil then
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
        if playerInfo and playerInfo.x then
            mov.x = playerInfo.x
            mov.y = playerInfo.y
            mov.z = playerInfo.z
        end
        mov.counter = 0
	end

	-- everytime os.time updates (once a second) call autoActions() if it exists
	local now = os.time()
	if now > lastCycleTime then
		lastCycleTime = os.time()

		-- if using elemental wheel, fade text after 3 seconds
		if hudFadeTime ~= nil and (lastCycleTime - hudFadeTime > 3) then
			texts.visible(eleWheelText, false)
		end
		
		if autoActions and not midaction() then
			if #multiStepAction >= 1 then
				send_command('input '..multiStepAction[1])
				return
			end
			autoActions()
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
	if extendedZoneChange ~= nil then
		extendedZoneChange()
	end
end)

windower.register_event('action',function(action)
	if not action then return end
	
	local actor = windower.ffxi.get_mob_by_id(action.actor_id) or nil
	if not actor or not player or not action then
		return
	end

	local category = action.category
    local param = action.param
	if actor.id == player.id then
    	-- a ws/spell/ja completes
		if category == 3 or category == 4 or category == 6 then
            tryCleanQueue(category, param)
        end
    end

	if extendedActionEvent ~= nil then
		extendedActionEvent(action, actor, category, param)
	end
end)