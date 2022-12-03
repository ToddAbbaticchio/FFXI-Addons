-- Ver 1.3.0
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
    local recast = 0

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

--[[ function onCooldown(actionName)
	local recastId = res.job_abilities:with('en', actionName) and res.spells:with('en', actionName).recastId or nil
    if recastId then
        local recastTime = ffxi.windower.get_ability_recasts()[recastId] or nil
        if recastTime and recastTime > 0 then
            return true
        end
    end

	local recastId = res.spells:with('en', actionName) and res.spells:with('en', actionName).recastId or nil
    if recastId then
        local recastTime = ffxi.windower.get_spell_recasts()[recastId] or nil
        if recastTime and recastTime > 0 then
            return true
        end
    end

    if not recastId then
        writeLog('Couldnt find recastId for ' .. actionName .. ' is not in the spell or jobability tables!', 1)
    end

    return false
end ]]

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

function evalWindows(now)
    -- close burst window when time runs out
    if burstWindow and burstWindowCloseTime and now >= burstWindowCloseTime then
        burstWindow = false
    end
    
    -- open/close skillchainWindow
    if not skillchainWindow and now >= skillchainWindowOpenTime and now <= skillchainWindowCloseTime then
        skillchainWindow = true
    end
end

function tryCleanQueue(category, param)
    local actionName = nil
    local queueAction = nil
    ---
    if category == 3 then
        actionName = res.weapon_skills[param].en or nil
        queueAction = actionQueue.ws[1] or nil
        if actionName and queueAction and queueAction:contains(actionName) then
            table.remove(actionQueue.ws, 1)
            return
        end
    end
    ---
    if category == 4 then
        actionName = res.spells[param].en or nil
        queueAction = actionQueue.burst[1] or nil
        if actionName and queueAction then
            if queueAction:contains(actionName) then
                table.remove(actionQueue.burst, 1)
                return
            end
        end
        queueAction = actionQueue.other[1] or nil
        if actionName and queueAction then
            if queueAction:contains(actionName) then
                table.remove(actionQueue.other, 1)
                return
            end
        end
    end

    if category == 6 then
        actionName = res.job_abilities[param].en or nil
        queueAction = actionQueue.other[1] or nil
        if actionName and queueAction then
            if queueAction:contains(actionName) then
                table.remove(actionQueue.other, 1)
                return
            end
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
    if pulledMonster or not isAutofiteTarget(monster) or now < pullRateTimer then
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
            if wsCommand:contains('Starlight') then
                windower.chat.input(wsCommand .. ' <me>')
            else
                windower.chat.input(wsCommand .. '<t>')
            end
        end
    end
end

-- afReact handling
function afReactHandler(player)
    if actionInProgress then
        return
    end

    local now = os.time()
    -- if burst window is open / we have burst commands queued, only try bursting
    if burstWindow and #actionQueue.burst >= 1 then
        --local response = afReact[skillchainName].response
        --windower.chat.input(response)
        windower.chat.input(actionQueue.burst[1])
        return
    end

    -- if skillchain window open, close it before trying other reactions
    if skillchainWindow and #actionQueue.ws >= 1 then
        if player.tp > 1000 then
            --local response = afReact[wsName].response
            --windower.chat.input(response)
            windower.chat.input(actionQueue.ws[1])
        end
        return
    end

    -- process commands in reactionQueue
    if #actionQueue.other >= 1 then
        windower.chat.input(actionQueue.other[1])
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
    local target = windower.ffxi.get_mob_by_target('t') or nil

    if not actor or not player then
        return
    end

    local category = action.category
    local param = action.param
    
    -- Specific handling for actions we initiated
    if actor.id == player.id then
        -- a ws/spell/ja completes
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

        -- a spell starts or is interrupted
        if category == 8 then
            if param == 28787 then
                actionInProgress = true
                coroutine.schedule(handleActionInProgress:prepare(), 0.5)
                return
            end
            actionInProgress = true
            return
        end
    end

    -- Specific handling for actions on our target (check for weaponskills and skillchains in afReact table)
    local actionTargetId = action.targets[1] and action.targets[1].id or nil
    if actionTargetId and target.id and actionTargetId == target.id then
        -- weaponskills
        if category == 3 then
            -- if a WS lands on our target while window(s) are open, they be closed. (if it makes a chain it just reopens a new window right after)
            if burstWindow or skillchainWindow then
                local now = os.time()
                burstWindowCloseTime = now
                skillchainWindowCloseTime = now
                burstWindow = false
                skillchainWindow = false
            end

            -- Check for skillchain; Check if skillchain in afReact table
            local skillchainId = action.targets[1].actions[1].add_effect_message or nil
            local skillchainName = scTable[skillchainId] and scTable[skillchainId].name or nil
            local reaction = afReact[skillchainName] or nil
            if skillchainName and reaction then
                burstWindowCloseTime = os.time() + 8
                burstWindow = true
                table.insert(actionQueue.burst, reaction.response)
                if reaction.response2 then
                    table.insert(actionQueue.burst, reaction.response2)
                end
                return
            end

            -- Check if wsname in afReact table
            local wsName = res.weapon_skills[param].en or nil
            local reaction = afReact[wsName] or nil
            if wsName and reaction then
                skillchainWindowOpenTime = os.time() + 3
                skillchainWindowCloseTime = os.time() + 8
                table.insert(actionQueue.ws, reaction.response)
                return
            end
        end
    end
    
    -- Specific handling for actions started by enemy
    if target and target.Id and target.Id == actor.Id then
        if category == 7 and param == 24931 then
            local abilityName = res.monster_abilities[act.targets[1].actions[1].param].en or nil
            local reaction = afReact[abilityName] or nil
            if abilityName and reaction and reaction.actor == 'enemy' then
                table.insert(actionQueue.other, reaction.response)
                --windower.send_command('input '..response)
            end
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
    local now = os.time()
    actionQueue = {}
    actionQueue.burst = {}
    actionQueue.ws = {}
    actionQueue.other = {}
    burstWindowCloseTime = now
    skillchainWindowCloseTime = now
    burstWindow = false
    skillchainWindow = false
end)