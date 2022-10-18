-- Ver 1.2.2

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
    if pulledMonster or not isAutofiteTarget(monster) then
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

-------------------------------------------------------------------------------------------------------------------
-- Event Listeners
-------------------------------------------------------------------------------------------------------------------
windower.register_event('action',function (act)
    if not active then
        return
    end

    local actor = windower.ffxi.get_mob_by_id(act.actor_id) or nil
    local player = windower.ffxi.get_player() or nil
    if actor == nil or player == nil then
        return
    end

	local category = act.category
    local param = act.param
    if actor.id == player.id then
        -- cat4: spellCastComplete cat6: jaComplete
        if (category == 4 or category == 6) and isPullAction(category, param) then
            pulledMonster = act.targets[1].id or nil
        end
        
        -- pulled with ranged attack (don't do this.  really i should take it out)
        if category == 2 then
            pulledMonster = act.targets[1].id or nil
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