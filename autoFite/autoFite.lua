_addon.name = 'autoFite'
_addon.author = 'Risca'
_addon.version = '1.3.3'
_addon.commands = {'autoFite', 'af'}

packets = require('packets')
require('logger')
require('coroutine')
require('vectors')
require('buffTable')
require('spellAbilityTable')
require('autoFiteFunctions')
res = require 'resources'

idle = 0
engaged = 1
logMode = 1

-----------------------------------------------------------------------------------------------------------
--  USER SETUP HERE  --------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
function initializeSessionVars(job, ...)
    require('jobVars')
    -- If a vars table doesn't exist for this job, stop here.
    if vars[job] == nil then
        writeLog('A vars.' .. job .. ' table does not exist! Gotta add one to use autoFite!', 1)
        windower.chat.input('//lua u autoFite')
    end

    local pullTarget = "Locus"
    local assistTarget = nil
    local targetArgs = {...}

    if mode == 'pull' and targetArgs[1] ~= nil then
        pullTarget = targetArgs[1]
    end

    if mode == 'assist' then
        if targetArgs[1] == nil then
            writeLog('Error in initializeSessionVars(): mode = assist, assistTarget = nil', 1)
            return
        end
        assistTarget = targetArgs[1]

        if targetArgs[2] ~= nil then
            pullTarget = targetArgs[2]
        end
    end

    -- Set default values (if not defined in jobVars.lua)
    jobVars = vars[job]
    if jobVars.autoBuffs == nil then
        jobVars.autoBuffs = {}
    end
    if jobVars.maintainAftermath == nil then
        jobVars.maintainAftermath = false
    end
    if jobVars.pullDistance == nil then
        jobVars.pullDistance = 441
    end
    if jobVars.meleeDistance == nil then
        jobVars.meleeDistance = 12
    end
    if jobVars.target == nil then
        jobVars.target = {}
        if jobVars.target.pull == nil then
            jobVars.target.pull = pullTarget
        end        
    end
    if jobVars.target.assist == nil or jobVars.target.assist ~= assistTarget then
        jobVars.target.assist = assistTarget
    end
    wsCommand = '/ws "' .. jobVars.ws .. '" '

    local startMsg = 'autoFite started!  Mode: '..mode..' pullTarget: '..jobVars.target.pull
    if jobVars.target.assist then
        startMsg = startMsg..' assistTarget: '..jobVars.target.assist
    end

    pullRateTimer = 0

    -- af react initial vars if table exists
    afReact = jobVars.afReact or nil
    actionQueue = {}
    actionQueue.burst = {}
    actionQueue.ws = {}
    actionQueue.other = {}
    burstWindow = false
    burstWindowCloseTime = 0
    skillchainWindow = false
    skillchainWindowOpenTime = 0
    skillchainWindowCloseTime = 0
    

    writeLog(startMsg, 1)
end

-- Main action handler - Decides what we should do
function autoFite()
    local player = windower.ffxi.get_player()

    -- Pull mode logic
    if mode == "pull" then
        if player.status == idle and not findingTarget then
            findingTarget = true
            findTargetV2()
            findingTarget = false
        end

        if player.status == engaged then
            pulledMonster = nil
            faceTarget()
            if jobVars.ws ~= nil then
                wsHandler()
            end

            -- If target moves out of range
            local monster = windower.ffxi.get_mob_by_target('t') or nil
            if monster and monster.distance >= jobVars.meleeDistance then
                writeLog('Engaged, but enemy too far away! Pulling!', 3)
                tryPull(monster)
            end
        end
    end

    -- Assist mode logic
    if mode == "assist" then
        local assistTarget = windower.ffxi.get_mob_by_name(jobVars.target.assist) or nil
        if not assistTarget then
            writeLog('Cant get targetInfo for assistTarget: '..jobVars.target.assist..' - This is a problem.', 1)
        end

        if player.status == idle then
            while assistTarget.distance > 1 do
                windower.ffxi.follow(assistTarget.index)
                assistTarget.distance = windower.ffxi.get_mob_by_name(jobVars.target.assist).distance
            end 
            windower.ffxi.follow() -- follow with no target stops follow
            
            if assistTarget.status == engaged then
                local monsterList = windower.ffxi.get_mob_array()
                local enemy = monsterList[assistTarget.target_index] or nil
                if enemy and enemy.id then
                    engageMonster(enemy.id, enemy.index)
                end
            end
        end

        if player.status == engaged then
            local currentTarget = windower.ffxi.get_mob_by_target('t') or nil
            if currentTarget and assistTarget.distance < 2 then
                approachTarget(currentTarget, jobVars.meleeDistance, 0.1)
            end
            
            faceTarget()
            wsHandler()
        end
    end

    -- check buffs regardless of mode (but not if we're stopped)
    if player.status == engaged then
        if afReact then
            afReactHandler(player)
        end
        autoBuffHandler()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- registered event handling
-------------------------------------------------------------------------------------------------------------------
-- addon commands
windower.register_event('addon command', function(...)
    local arg = {...}
    local afAction = arg[1]

    local startCommands = "start,active,on,go"
    if startCommands:contains(afAction:lower()) then
        mode = 'pull'
        active = true
        findingTarget = false
        local job = windower.ffxi.get_player().main_job
        local pullTarget = nil
        local assistTarget = nil
        if arg[2] ~= nil then
            pullTarget = arg[2]
        end
        initializeSessionVars(job, pullTarget)
    end

    if afAction:lower() == 'assist' then
        mode = 'assist'
        active = true
        local job = windower.ffxi.get_player().main_job
        local pullTarget = nil
        local assistTarget = nil
        if arg[2] ~= nil then
            assistTarget = arg[2]
        end
        if arg[2] ~= nil then
            pullTarget = arg[3]
        end
        if assistTarget == nil then
            writeLog('You must specify an assist target!', 1)
            return
        end
        initializeSessionVars(job, assistTarget, pullTarget)
    end

    local stopCommands = "stop,disable,end,no,off"
    if stopCommands:contains(afAction:lower()) then
        active = false
        --windower.chat.input('//lua u autoFite')
    end

    if afAction:lower() == 'logmode' then
        logMode = logMode + 1
        if logMode > 3 then
            logMode = 1
        end
        writeLog('logMode set to: ' .. logMode .. '! (1-MostlySilent, 2-SlightlyChatty, 3-DebugTime)', 1)
    end

    if afAction:lower() == 'reload' then
        windower.chat.input('//lua r autoFite')
    end

    if afAction:lower() == 'help' then
        local message = [[-----------------------------------------------------------------------------------------------
- Start in pull mode:
    //af <start/active/on/go> <targetname>
    targetname can be a partial name and will match any monsters that contain <targetname>
    //af start Apex would pull Apex Bats, Apex Crabs, and anything else with Apex in the name
- Start in assist mode:
    //af assist <assisttarget>
    assistTarget is case sensitive and must be an exact matched
    '//af assist Risca' would engage and fight anything Risca engages
- For information re: the various tell command options use:
    //af helptells
-----------------------------------------------------------------------------------------------]]
        for _,line in ipairs(message:split('\n')) do
            windower.add_to_chat(207, line)
        end
    end

    -- Some testing / debug commands because apparently we hate having a working console
    if afAction:lower() == 'distance' then
        windower.add_to_chat(200, '-- Distance from target: ' .. windower.ffxi.get_mob_by_target('t').distance .. ' meleeDistance: '..jobVars.meleeDistance..' --')
        windower.add_to_chat(200, '-- Distance from assist: ' .. windower.ffxi.get_mob_by_name(jobVars.target.assist).distance)
    end

    if afAction:lower() == 'test' then
       
    end

    if afAction:lower() == 'fix' then
        pressKey('enter',0.1)
    end

end)

-- Call actionHandler once every second
local loopTime = 0
local tickDelay = 1
windower.register_event('postrender', function()
    local now = os.time()
    if active and now >= loopTime then
        evalWindows(now)
        autoFite()
        loopTime = os.time() + tickDelay
    end
end)

-- zone change event to unload the addon
windower.register_event('zone change', function()
    windower.chat.input('//lua u autoFite')
end)
