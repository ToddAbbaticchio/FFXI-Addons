-- afVer 1.3.7
-------------------------------------------------------------------------------------------------------------------
-- Global Variables!  Wheeeeeeeeee!
-------------------------------------------------------------------------------------------------------------------
scTable = T{
	[288] = {name='Light', elements={'Light','Thunder','Wind','Fire'}},
	[289] = {name='Darkness', elements={'Dark','Ice','Water','Earth'}},
	[290] = {name='Gravitation', elements={'Dark','Earth'}},
	[291] = {name='Fragmentation', elements={'Thunder','Wind'}},
	[292] = {name='Distortion', elements={'Ice','Water'}},
	[293] = {name='Fusion', elements={'Light','Fire'}},
	[294] = {name='Compression', elements={'Dark'}},
	[295] = {name='Liquefaction', elements={'Fire'}},
	[296] = {name='Induration', elements={'Ice'}},
	[297] = {name='Reverberation', elements={'Water'}},
	[298] = {name='Transfixion', elements={'Light'}},
	[299] = {name='Scission', elements={'Earth'}},
	[300] = {name='Detonation', elements={'Wind'}},
	[301] = {name='Impaction', elements={'Thunder'}},
	[767] = {name='Radiance', elements={'Light','Thunder','Wind','Fire'}},
	[768] = {name='Umbra', elements={'Dark','Ice','Water','Earth'}},
	[769] = {name='Radiance', elements={'Light','Thunder','Wind','Fire'}},
	[770] = {name='Umbra', elements={'Dark','Ice','Water','Earth'}},
}

--startCats = L{7,8,9,12}
--finishCats = L{2,3,5}

-------------------------------------------------------------------------------------------------------------------
-- Utility Functions
-------------------------------------------------------------------------------------------------------------------
-- Simulate key presses
function pressKey(theKey, pauseDuration)
    windower.send_command('setkey ' .. theKey .. ' down')
    coroutine.sleep(pauseDuration)
    windower.send_command('setkey ' .. theKey .. ' up')
    coroutine.sleep(pauseDuration)
end

-- WriteLog stuff. If logLevel < LogMode, show message
function writeLog(message, logLevel)
    if logMode == nil then
        logMode = 1
    end
    if logMode >= logLevel then
        windower.add_to_chat(207, '-- ' .. message .. ' --')
    end
end

-- feed a targetID to get the targetIndex
function getMobIndex(lookupId)
    local monsters = windower.ffxi.get_mob_array()
    for index,monster in pairs(monsters) do
        if monster.id == lookupId then
            return index
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Logic Functions
-------------------------------------------------------------------------------------------------------------------
-- determine if target is a valid 'autoFite' target
function isAutofiteTarget(monster)
    if monster and monster.name:contains(jobVars.target.pull) and monster.distance < jobVars.pullDistance and monster.valid_target and monster.hpp == 100 then
        return true
    end
    return false
end

-- feed current playerInfo table and a buff name. Returns true if buff is active, false if not
function buffActive(currBuffs, buffName)
    -- If buffName contains multiple buffNames, split them and process each one
    if string.find(buffName, ",") then
        local atLeastOneActive = false
        for singleBuffName in string.gmatch(buffName, "[^,]+") do
            for _, v in pairs(currBuffs) do
                if buffTable[v] ~= nil and buffTable[v] == singleBuffName then
                    atLeastOneActive = true
                end
            end
        end
        if atLeastOneActive == true then
            return true
        end
    else
        -- Else just check the single buffName we passed in
        for _, v in pairs(currBuffs) do
            if buffTable[v] ~= nil and buffTable[v] == buffName then
                return true
            end
        end
    end
    return false
end

function onCooldown(actionName)
	for k,v in pairs(res.job_abilities) do
		if v.en == actionName and v.recast_id then
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
		if v.en == actionName and v.recast_id then
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

	writeLog('Didnt find a match for actionName: '..actionName..' in res.job_abilities or res.spells!', 1)
	return true --return true to stop attempts to spam ability
end

-- determine if current action is our pull action
function isPullAction(category, param)
    if not active or mode ~= 'pull' then
        return
    end

    if category == 4 then
        if jobVars.pullCommand:contains(res.spells[param].en) then
            return true
        end
    end

    if category == 6 then
        if jobVars.pullCommand:contains(res.job_abilities[param].en) then
            return true
        end
    end
    
    return false
end

function initializeQueues()
    afReact = jobVars.afReact or nil
    if not afReact then
        return
    end

    -- burstWindow / chainWindow initialization and functions
    burstWindow = {open=0, close=0}
    function burstWindow.set(self, scTime)
        self['open'] = scTime
        self['close'] = scTime + 8
        writeLog('set burstWindow with open:'..self.open..' and close: '..self.close, 3)
    end
    chainWindow = {open=0, close=0}
    function chainWindow.set(self, wsTime)
        self['open'] = wsTime + 3
        self['close'] = wsTime + 7
        writeLog('set chainWindow with open:'..self.open..' and close: '..self.close, 3)
    end

    -- queue initialization and functions
    burstQueue = {}
    wsQueue = {}
    generalQueue = {}
    function burstQueue.add(self, action)
        writeLog('burstQueue:add - '..action, 3)
        table.insert(self, action)
    end
    function burstQueue.remove(self)
        local action = self[1] or nil
        if action then
            writeLog('burstQueue:remove '..action, 3)
        end
        table.remove(self, 1)
    end
    function burstQueue.execute(self)
        local action = self[1] or nil
        if action then
            writeLog('burstQueue:execute '..action, 3)
        end
        windower.chat.input(action)
    end

    function wsQueue.add(self, action)
        writeLog('wsQueue:add - '..action, 3)
        table.insert(self, action)
    end
    function wsQueue.remove(self)
        local action = self[1] or nil
        if action then
            writeLog('wsQueue:remove '..action, 3)
        end
        table.remove(self, 1)
    end
    function wsQueue.execute(self)
        local action = self[1] or nil
        if action then
            writeLog('wsQueue:execute '..action, 3)
        end
        windower.chat.input(self[1])
    end

    function generalQueue.add(self, action)
        writeLog('generalQueue:add - '..action, 3)
        table.insert(self, action)
    end
    function generalQueue.remove(self)
        local action = self[1] or nil
        if action then
            writeLog('generalQueue:remove '..action, 3)
        end
        table.remove(self, 1)
    end
    function generalQueue.execute(self)
        local action = self[1] or nil
        if action then
            writeLog('generalQueue:execute '..action, 3)
        end
        windower.chat.input(self[1])
    end
end

function tryCleanQueue(category, param)
    local actionName = nil
    local queueAction = nil
    ---
    if category == 3 then
        actionName = res.weapon_skills[param].en or nil
        queueAction = wsQueue[1] or nil
        if actionName and queueAction and queueAction:contains(actionName) then
            wsQueue:remove()
            return
        end
    end
    ---
    if category == 4 then
        actionName = res.spells[param].en or nil
        queueAction = burstQueue[1] or nil
        if actionName and queueAction and queueAction:contains(actionName) then
            burstQueue:remove()
            return
        end
        queueAction = generalQueue[1] or nil
        if actionName and queueAction and queueAction:contains(actionName) then
            generalQueue:remove()
            return
        end
    end

    if category == 6 then
        actionName = res.job_abilities[param].en or nil
        queueAction = generalQueue[1] or nil
        if actionName and queueAction and queueAction:contains(actionName) then
            generalQueue:remove()
            return
        end
    end
end

function handleActionInProgress()
    actionInProgress = false
end

-------------------------------------------------------------------------------------------------------------------
-- Combat Functions
-------------------------------------------------------------------------------------------------------------------
-- Turn to face target. (take that stupid pathing bats!)
function faceTarget(theTarget)
    -- if no target passed, try to use current target
    if theTarget == nil then
        theTarget = windower.ffxi.get_mob_by_target('t') or nil
        if not theTarget then
            return false
        end
    end

    local toFace = windower.ffxi.get_mob_by_id(theTarget.id) or nil
    if toFace == nil then
        return false
    end
    
    local player = windower.ffxi.get_mob_by_target('me')
    local delta = {
        Y = (player.y - toFace.y),
        X = (player.x - toFace.x)
    }
    local angleInDegrees = (math.atan2(delta.Y, delta.X) * 180 / math.pi) * - 1
    local mult = 10 ^ 0
    windower.ffxi.turn(((math.floor(angleInDegrees * mult + 0.5) / mult) + 180):radian())
    return true
end

function engageMonster(targetId, targetIndex)
    if targetIndex == nil then
        targetIndex = getMobIndex(targetId)
    end
 
    local engagePacket = packets.new('outgoing', 0x01A, {
        ["Target"] = targetId,
        ["Target Index"] = targetIndex,
        ["Category"] = 0x02
    })
    packets.inject(engagePacket)
end

-- Run forward (in the currently facing direction for duration seconds)
function approachTarget(target, maxDistance, moveDuration)
    if target.distance > maxDistance then
        windower.ffxi.run(true)
        windower.ffxi.run:schedule(moveDuration, false)
    end
end

-- perform the pull action!
function tryPull(monster)
    local now = os.time()
    local stopPullAttempt = pulledMonster or not isAutofiteTarget(monster) or now < pullRateTimer or false
    if stopPullAttempt then
        return
    end
    writeLog('Trying to pull: '..monster.name..' validTarget: '..tostring(monster.valid_target)..' at distance: '..monster.distance..' (pull distance set to: '..jobVars.pullDistance, 3)
    windower.chat.input(jobVars.pullCommand..monster.id)
end

-- Find valid targets and try to pull them
function findTargetV2()
    -- if we've pulled something, engage
    if pulledMonster then
        engageMonster(pulledMonster)
        return
    end

    -- iterate monster table, attempt pulls on valid targets
    local monsters = windower.ffxi.get_mob_array()
    for _,monster in pairs(monsters) do
        if isAutofiteTarget(monster) and not pulledMonster then
            tryPull(monster)
            return
        end
    end
end

-- Autobuff!
function autoBuffHandler()
    if jobVars.autoBuffs ~= nil then
        local currentBuffs = windower.ffxi.get_player().buffs
        for action, buffName in pairs(jobVars.autoBuffs) do
            if not buffActive(currentBuffs, buffName) and not onCooldown(action) then
                windower.chat.input(spellAbilityTable[action].command .. ' "' .. action .. '" <me>')
                break
            end
        end
    end
end

-- Weaponskillsssss
function wsHandler()
    -- if last openingWS wasn't more than 8 seconds ago, hold off. (this is reset every time target changes)
    if myLastWsTime and myLastWsTime + 10 > os.time() then
        writeLog('It hasnt been 10 seconds since my lastWS! --preserveBurstWindow-- ', 3)
        return
    end
        
    local player = windower.ffxi.get_player()
    if jobVars.maintainAftermath == true then
        if buffActive(player.buffs, "Aftermath: Lv.3") == false then
            if player.vitals.tp == 3000 then
                windower.chat.input(wsCommand .. '<t>')
            end
        else
            if player.vitals.tp >= jobVars.targetTp then
                windower.chat.input(wsCommand .. '<t>')
            end
        end
    else
        if player.vitals.tp >= jobVars.targetTp then
            windower.chat.input(wsCommand .. '<t>')
        end
    end
end

-- afReact handling
function afReactHandler()
    local now = os.time()
    local inBurstWindow = now >= burstWindow.open and now < burstWindow.close or false
    local inChainWindow = now >= chainWindow.open and now < chainWindow.close or false

    if actionInProgress then
        writeLog('inChainWindow: '..tostring(inChainWindow)..' inBurstWindow: '..tostring(inBurstWindow)..' BUT actionInProgress: '..tostring(actionInProgress)..' skipping this cycle!', 3)
        return
    end
    writeLog('inChainWindow: '..tostring(inChainWindow)..' inBurstWindow: '..tostring(inBurstWindow), 3)

    -- if burst window is open and we have burst commands queued...
    if #burstQueue >= 1 then
        if inBurstWindow then
            burstQueue:execute()
            return
        end
        -- if burst window is closed remove command from queue
        burstQueue:remove()
    end
    
    -- if skillchain window open, close it before trying other reactions
    if #wsQueue >= 1 then
        if inChainWindow then
            local tp = windower.ffxi.get_player().vitals.tp or nil
            if tp and tp >= 1000 then
                wsQueue:execute()
                return
            end
        end
        -- if skillchain window is closed remove command from queue
        wsQueue:remove()
    end
    
    -- Finally, process commands in generalQueue
    if #generalQueue >= 1 then
        generalQueue:execute()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Event Listeners
-------------------------------------------------------------------------------------------------------------------
windower.register_event('action',function (action)
    if not active or not action then
        return
    end
    local actor = windower.ffxi.get_mob_by_id(action.actor_id) or nil
    local player = windower.ffxi.get_player() or nil
    if not actor or not player then
        return
    end
    local category = action.category
    local param = action.param
    
    -- ACTIONS WE INITIATED -----
    if actor.id == player.id then
        -- we use a weaponskill - checking for preserveBurstWindow
        if category == 3 then
            local wsName = res.weapon_skills[param] and res.weapon_skills[param].en or nil
            local damageDealt = action.targets[1].actions[1].param or nil
            local reaction = afReact[wsName] or nil
            if wsName and damageDealt and reaction and reaction.actor == 'self' and reaction.response == 'preserveBurstWindow' then
                myLastWsTime = os.time()
                writeLog('I used '..wsName..' and Im set to preserveBurstWindow! myLastWsTime set to: '..myLastWsTime, 3)
            end
        end
        -- we start a spell or one is interrupted
        if category == 8 then
            if param == 28787 then
                actionInProgress = true
                coroutine.schedule(handleActionInProgress:prepare(), 0.5)
                return
            end
            actionInProgress = true
            return
        end
        -- we complete a ws/spell/ja
		if category == 3 or category == 4 or category == 6 then
            actionInProgress = true
            coroutine.schedule(handleActionInProgress:prepare(), 0.5)
            tryCleanQueue(category, param)
            -- if it was our pull action and completed, set pulledMonster var
            if isPullAction(category, param) then
                pulledMonster = action.targets[1].id or nil
                pullRateTimer = os.time() + 10
                return
            end
        end
    end

    -- from here on having a target is required
    local target = windower.ffxi.get_mob_by_target('t') or nil
    if not target then
        return
    end

    -- ACTIONS ON OUR TARGET (initiated by us or others) -----
    local actionOnTarget = action.targets[1] and action.targets[1].id and target.id and target.id == action.targets[1].id or false
    if actionOnTarget and category == 3 or category == 4 or category == 11 then --(3 = ws, 4 = spells, 11 = trust ws)
        -- did it hit, and should we react to it?
        local wsName = res.weapon_skills[param] and res.weapon_skills[param].en or nil
        local damageDealt = action.targets[1].actions[1].param or nil
        local wsReaction = afReact[wsName] or nil
        if wsName and damageDealt then
            chainWindow:set(os.time())
            if wsReaction then
                wsQueue:add(reaction.response)
                return
            end
        end
            
        -- did it create a skillchain, and should we react to that?
        local scId = action.targets[1].actions[1].add_effect_message or nil
        local scName = scTable[scId] and scTable[scId].name or nil
        local reaction = afReact[scName] or nil
        if scName and reaction then
            chainWindow:set(os.time())
            burstWindow:set(os.time())
            burstQueue:add(reaction.response)
            if reaction.response2 then
                burstQueue:add(reaction.response2)
                return
            end
        end
    end

    -- ACTIONS BY OUR TARGET -----
    local enemyAction = target.id and target.id == actor.id or false
    if enemyAction and category == 7 and param == 24931 then
        local actionId = action.targets[1].actions[1].param or nil
        local actionName = res.monster_abilities[actionId].en or nil
        local reaction = actionName and afReact[actionName] or nil
        if actionName and reaction and reaction.actor == 'enemy' then
            generalQueue:add(reaction.response)
            return
        end
    end
end)

windower.register_event('chat message', function(message, player, mode, is_gm)
    local whitelist = "Risca,Walshie,Walshette,Shinyhelmet,Lornkeit,Iyenga,Mikanora,Hisuwei"
    local secret = "spag"
    
    if mode == 3 and whitelist:contains(player) then
        local words = {}
        for word in message:gmatch("%w+") do
            table.insert(words, word)
        end
        
        if not words[1] == secret then
            return
        end

        -- invites - example: /t Risca spag invite
        if words[2]:lower() == 'invite' then
            if windower.ffxi.get_party().p5 then
                windower.send_command('input /t '..player..' Party is full bro!')
                return
            else
                windower.send_command('input /pcmd add '..player)
                windower.send_command:schedule(.5, 'input /t '..player..' Invite sent!')
                return
            end
        end
        
        -- leader request - example: /t Risca spag leaderme
        if words[2]:lower() == 'leaderme' then
            windower.send_command('input /pcmd leader '..player)
            windower.send_command:schedule(.5, 'input /t '..player..' You are the captain now.')
            return
        end
        
        -- dismiss trusts - example: /t Risca spag riptrusts
        if words[2]:lower() == 'riptrusts' then
            if active then
                windower.send_command('input /t '..player..' Nah - not while Im pulling.')
            else
                windower.send_command('input /returntrust all')
                windower.send_command:schedule(.5, 'input /t '..player..' RIP in peace trusts...')
            end
            return
        end

        -- stopaf example: /t Risca spag stopaf
        if words[2]:lower() == 'stopaf' then
            if active then
                windower.send_command('input //af stop')
                windower.send_command:schedule(.5, 'input /t '..player..' Stopped!')
            else
                windower.send_command('input /t '..player..' Cant stop if Im not going!')
            end
            return
        end

        -- startaf example: /t Risca spag startaf start Locus || /t Risca spag startaf assist Walshette
        if words[2]:lower() == 'startaf' then
            if (words[3]:lower() == 'start' or words[3]:lower() == 'assist') and words[4] ~= null then
                if active then
                    windower.send_command('input //af stop')
                    coroutine.sleep(1)
                end
            
                windower.send_command('input //af '..words[3]..' '..words[4])
                windower.send_command:schedule(1, 'input /t '..player..' Input: //af '..words[3]..' '..words[4])
            else
                windower.send_command('input /t '..player..' Syntax looks bad. Try something like:')
                windower.send_command:scheudule(1, 'input /t '..player..' "/t Risca spag start start Locus" OR "/t Risca spag start assist Walshette"')
            end
            return
        end

        -- some debug stuff:
        if words[2]:lower() == 'youbroke' then
            local me = windower.ffxi.get_player()
            local currTarget = windower.ffxi.get_mob_by_target('bt').name
            local battleTarget = windower.ffxi.get_mob_by_target('t').name
            
            windower.send_command('input /t '..player..' in_combat: '..tostring(me.in_combat)..' engaged: '..me.status..' currTarget: '..currTarget..' battleTarget: '..battleTarget)
            return
        end
    end
end)

windower.register_event('target change', function()
    initializeQueues()
end)