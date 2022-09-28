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
        windower.add_to_chat(200, '-- ' .. message .. ' --')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Logic Functions
-------------------------------------------------------------------------------------------------------------------
-- determine if target is a valid 'autoFite' target
function isAutofiteTarget(monster)
    if monster ~= nil and monster.name:contains(jobVars.target.pull) and monster.distance < jobVars.pullDistance and monster.valid_target then
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

-- feed an action name (spell or ja). Returns true if onCooldown, false if not
function onCooldown(actionName)
    -- make sure the action is in our megaTable
    if (spellAbilityTable[actionName] == nil) then
        writeLog('The action: ' .. actionName .. ' is not in the spell_ability_table!', 1)
        return true
    end

    -- determine correct recast function to check
    local actionInfo = spellAbilityTable[actionName]
    local actionRecastId = actionInfo.recastId
    if actionInfo.command == "/ma" then
        recast = windower.ffxi.get_spell_recasts()[actionRecastId]
    end
    if actionInfo.command == "/ja" then
        recast = windower.ffxi.get_ability_recasts()[actionRecastId]
    end
    if recast ~= nil and recast > 0 then
        return true
    end
    return false
end

-- determine if current action is our pull action
function isPullAction(actionId)
    for name, value in pairs(spellAbilityTable) do
        if value.id == actionId and jobVars.pullCommand:contains(name) then
            return true
        end
    end
    return false
end

-------------------------------------------------------------------------------------------------------------------
-- Combat Functions
-------------------------------------------------------------------------------------------------------------------
-- Turn to face target. (take that stupid pathing bats!)
function faceTarget()
    if windower.ffxi.get_mob_by_target('t') == nil then
        return false
    end

    local M = windower.ffxi.get_mob_by_target('t')
    local P = windower.ffxi.get_mob_by_target('me')
    local delta = {
        Y = (P.y - M.y),
        X = (P.x - M.x)
    }
    local angleInDegrees = (math.atan2(delta.Y, delta.X) * 180 / math.pi) * -1
    local mult = 10 ^ 0
    windower.ffxi.turn(((math.floor(angleInDegrees * mult + 0.5) / mult) + 180):radian())
    return true
end

-- Run forward (in the currently facing direction for duration seconds)
function approachTarget(duration, target)
    if windower.ffxi.get_mob_by_target('t') == nil then
        writeLog('Attempted to call approachTarget() but dont have a valid target!',3)
        return
    end

    local approachTarget = windower.ffxi.get_mob_by_target('t')
    if mode == 'assist' then
        local assistTarget = windower.ffxi.get_mob_by_name(jobVars.target.assist)
        if not assistTarget then
            writeLog('Attempted to call approachTarget() but dont have a valid assistTarget. Aborting adventure mode!',3)
            return
        end

        local facedTarget = faceTarget()
        if approachTarget.distance > jobVars.meleeDistance and assistTarget.distance <= 25 and facedTarget then
            windower.ffxi.run(true)
            windower.ffxi.run:schedule(duration, false)
        end
    end
end

-- perform the pull action!
function tryPull(monster)
    -- give a default value in this is the first pull attempt
    if lastPullTime == nil then
        lastPullTime = 1
    end

    -- don't pull if it hasn't been 10 seconds since our last successful pull command
    local currTime = os.time()
    if currTime - lastPullTime < 10 then
        writeLog('Pull command canceled! Hasnt been 10 seconds yet!', 3)
        return
    end

    -- don't pull if its not a valid target
    if not isAutofiteTarget(monster) then
        writeLog('Pull command canceled! Not a valid target! '..monster.name, 3)
        return
    end

    -- do pull if we made it here
    writeLog('Trying to pull: '..monster.name..' validTarget: '..tostring(monster.valid_target)..' at distance: '..monster.distance..' (pull distance set to: '..jobVars.pullDistance, 3)
    windower.chat.input(jobVars.pullCommand..monster.id)
end

-- Find valid targets and try to pull them
function findTargetV2()
    local player = windower.ffxi.get_player()
    if detectedPullAction == nil then detectedPullAction = false end

    -- the actual pullin' bits
    if not player.in_combat and not detectedPullAction then
        -- if <bt> isn't dead, grab it
        if windower.ffxi.get_mob_by_target('bt') ~= nil then
            local bt = windower.ffxi.get_mob_by_target('bt')
            if bt.hpp > 0 then
                tryPull(bt)
                coroutine.sleep(0.5)
            end
        end

        -- pick a new pullTarget
        local monsters = windower.ffxi.get_mob_array()
        for _,monster in pairs(monsters) do
            if isAutofiteTarget(monster) and not detectedPullAction then
                tryPull(monster)
                coroutine.sleep(0.5)
            end
        end
    end

    if detectedPullAction and player.status ~= engaged then
        if startEngageAttemptTime == nil then
            startEngageAttemptTime = os.time()    
        end 
        if os.time() > startEngageAttemptTime + 10 then
            detectedPullAction = false
            startEngageAttemptTime = nil
            writeLog('Attempting to engage for 10+ seconds without succes.  Bail out!', 3)
        else 
            writeLog('Attempting to engage!', 3)
            windower.chat.input('/attack <bt>')
        end
    end
end

-- Autobuff!
function autoBuffHandler()
    if jobVars.autoBuffs ~= nil then
        local currentBuffs = windower.ffxi.get_player().buffs
        for action, buffName in pairs(jobVars.autoBuffs) do
            --writeLog('action: '..action..' buffName: '..buffName, 1)
            local onCoolDown = onCooldown(action)
            local isActive = buffActive(currentBuffs, buffName)

            if not onCoolDown and not isActive then
                -- writeLog('action: '..action..' is not active and not on cooldown! attempting to cast!', 1)
                windower.chat.input(spellAbilityTable[action].command .. ' "' .. action .. '" <me>')
                break
            end
        end
    end
end

-- Weaponskillsssss
function wsHandler()
    local player = windower.ffxi.get_player()
    if jobVars.maintainAftermath == true then
        if buffActive(player.buffs, "Aftermath: Lv.3") == false then
            if player.vitals.tp == 3000 then
                -- windower.chat.input(wsCommand..targetId)
                windower.chat.input(wsCommand .. '<t>')
            end
        else
            if player.vitals.tp >= jobVars.targetTp then
                -- windower.chat.input(wsCommand..targetId)
                windower.chat.input(wsCommand .. '<t>')
            end
        end
    else
        if player.vitals.tp >= jobVars.targetTp then
            if wsCommand:contains('Starlight') then
                windower.chat.input(wsCommand .. ' <me>')
            else
                -- windower.chat.input(wsCommand..targetId)
                windower.chat.input(wsCommand .. '<t>')
            end
        end
    end
end

-- Spam TAB key until we find a target with the correct name
--[[ function findTarget(targetName)
    --pullInProgress = true
    writeLog('-- findTarget loop entered. pullInProgress set to true --', 3)

    windower.send_command('setkey right down')
    local searchTarget = windower.ffxi.get_mob_by_target('t')
    while (searchTarget == nil) or ((not searchTarget.name:contains(targetName)) or searchTarget.distance > jobVars.pullDistance) do
        pressKey('TAB', 0.1)
        searchTarget = windower.ffxi.get_mob_by_target('t')
    end
    windower.send_command('setkey right up')
        
    -- Found valid target! Pull it!
    targetId = searchTarget.id
    if not targetPulled then
        windower.chat.input(jobVars.pullCommand .. '<t>')
    end

    -- Now we should be in_combat, but not engaged
    if windower.ffxi.get_player().in_combat == true then
        if windower.ffxi.get_player().status == idle then
            if allowApproach == true then
                approachTarget()
            end
        end

        -- In range!  Swords out
        if windower.ffxi.get_mob_by_target('<t>').distance < jobVars.meleeDistance then
            writeLog('FunctionStart: startFite - Attempting to engage!', 3)
            windower.chat.input('/attack on')
        end
    end

    --pullInProgress = false
    writeLog('pullInProgress set to false', 3)
end ]]

-------------------------------------------------------------------------------------------------------------------
-- Event Listeners
-------------------------------------------------------------------------------------------------------------------
windower.register_event('action',function (act)
    if not windower.ffxi.get_mob_by_id(act.actor_id) then
        -- bail if we can't pull a valid actor for an action
        return
    end

    local actor = windower.ffxi.get_mob_by_id(act.actor_id)
	local self = windower.ffxi.get_player()
	local category = act.category
    local param = act.param
   
    if actor.id == self.id and active then
        if category == 8 or category == 4 then
            if isPullAction(param) == true then
                -- casting success
                if category == 4 then
                    writeLog('Pull command complete', 3)
                    lastPullTime = os.time()
                    detectedPullAction = true
                end
            end
        end

        -- pulled with ranged attack
        if category == 2 then
            writeLog('Pulled <t> with ranged attack!', 3)
            detectedPullAction = true
        end

        -- action is a ja and matches pull command
        if category == 6 then
            if isPullAction(param) == true then
                writeLog('Pull command complete', 3)
                detectedPullAction = true
            end
        end
    end
end)


windower.register_event('chat message', function(message, player, mode, is_gm)
    local whitelist = "Add,Names,Here,Like,This"
    local secret = "spag"
    
    if mode == 3 and whitelist:contains(player) then
        local words = {}
        for word in message:gmatch("%w+") do
            table.insert(words, word:lower())
        end
        
        if not words[1] == secret then
            return
        end

        -- invites - example: /t Risca spag invite
        if words[2] == 'invite' then
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
        if words[2] == 'leaderme' then
            windower.send_command('input /pcmd leader '..player)
            windower.send_command:schedule(.5, 'input /t '..player..' You are the captain now.')
            return
        end
        
        -- dismiss trusts - example: /t Risca spag riptrusts
        if words[2] == 'riptrusts' then
            if active then
                windower.send_command('input /t '..player..' Nah - not while Im pulling.')
            else
                windower.send_command('input /returntrust all')
                windower.send_command:schedule(.5, 'input /t '..player..' RIP in peace trusts...')
            end
            return
        end

        -- stopaf example: /t Risca spag stopaf
        if words[2] == 'stopaf' then
            if active then
                windower.send_command('input //af stop')
                windower.send_command:schedule(.5, 'input /t '..player..' Stopped!')
            else
                windower.send_command('input /t '..player..' Cant stop if Im not going!')
            end
            return
        end

        -- startaf example: /t Risca spag startaf start Locus || /t Risca spag startaf assist Walshette
        if words[2] == 'startaf' then
            if (words[3] == 'start' or words[3] == 'assist') and words[4] ~= null then
                if active then
                    windower.send_command('input //af stop')
                    windower.send_command:schedule(.5, 'input /t '..player..' Stopped!')
                    coroutine.sleep(1)
                end
            
                windower.send_command('input //af '..words[3]..' '..words[4])
                windower.send_command:schedule(.5, 'input /t '..player..' Input: //af '..words[3]..' '..words[4])
            else
                windower.send_command('input /t '..player..' Syntax looks bad. Try something like:')
                windower.send_command:scheudule(.5, 'input /t '..player..' "/t Risca spag start start Locus" OR "/t Risca spag start assist Walshette"')
            end
            return
        end
    end
end)