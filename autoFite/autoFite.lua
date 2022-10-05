_addon.name = 'autoFite'
_addon.author = 'Risca'
_addon.version = '1.1.7'
_addon.commands = {'autoFite', 'af'}

packets = require('packets')
require('logger')
require('coroutine')
require('vectors')
require('buffTable')
require('spellAbilityTable')
require('helperFunctions')
require('jobVars')

idle = 0
engaged = 1
logMode = 1

-----------------------------------------------------------------------------------------------------------
--  USER SETUP HERE  --------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
function initializeSessionVars(job, ...)
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
        if jobVars.target.assist == nil then
            jobVars.target.assist = assistTarget
        end
    end
    wsCommand = '/ws "' .. jobVars.ws .. '" '

    local startMsg = 'autoFite started!  Mode: '..mode..' pullTarget: '..jobVars.target.pull
    if jobVars.target.assist then
        startMsg = startMsg..' assistTarget: '..jobVars.target.assist
    end
    writeLog(startMsg ,1)
end

-- Main action handler - Decides what we should do
function autoFite()
    local player = windower.ffxi.get_player()
    -- Pull mode logic
    if mode == "pull" then
        if player.status == idle and findingTarget == false then
            findingTarget = true
            findTargetV2()
            findingTarget = false
        end

        if player.status == engaged then
            startEngageAttemptTime = nil
            detectedPullAction = false
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
        
        if player.status == idle then
            if assistTarget and assistTarget.distance > 1 then
                approachTarget(assistTarget, 1, 0.3)
            end
            if assistTarget and assistTarget.status == engaged then
                local monsterList = windower.ffxi.get_mob_array()
                local enemy = monsterList[assistTarget.target_index]
                engageMonster(enemy.id, enemy.index)
            end
        end

        if player.status == engaged then
            local currentTarget = windower.ffxi.get_mob_by_target('t') or nil
            if currentTarget ~= nil and assistTarget ~= nil then
                if assistTarget and assistTarget.distance < 2 then
                    approachTarget(currentTarget, jobVars.meleeDistance, 0.1)
                end
            elseif currentTarget ~= nil then
                approachTarget(currentTarget, jobVars.meleeDistance, 0.1)
            end
            faceTarget()
            wsHandler()
        end
    end

    -- check buffs regardless of mode (but not if we're stopped)
    if player.status == engaged then
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
        windower.chat.input('//lua u autoFite')
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

    -- Some testing / debug commands because apparently we hate having a working console
    if afAction:lower() == 'distance' then
        windower.add_to_chat(200, '-- Distance from target: ' .. windower.ffxi.get_mob_by_target('t').distance .. ' meleeDistance: '..jobVars.meleeDistance..' --')
        windower.add_to_chat(200, '-- Distance from assist: ' .. windower.ffxi.get_mob_by_name(jobVars.target.assist).distance)
    end

    if afAction:lower() == 'test' then
        local toFace = windower.ffxi.get_mob_by_target('t') or nil
        if toFace == nil then
            return
        end
        local player = windower.ffxi.get_mob_by_target('me')
        local delta = {
            Y = (player.y - toFace.y),
            X = (player.x - toFace.x)
        }
        local angleInDegrees = (math.atan2(delta.Y, delta.X) * 180 / math.pi) * - 1
        local mult = 10 ^ 0
        windower.ffxi.turn(((math.floor(angleInDegrees * mult + 0.5) / mult) + 180):radian())
    end

    if afAction:lower() == 'fix' then
        pressKey('enter',0.1)
    end
end)

-- Call actionHandler once every second
lastTick = 0
windower.register_event('postrender', function()
    local now = os.time()
    if now > lastTick and active == true then
        lastTick = now
        autoFite()
    end
end)

-- zone change event to unload the addon
windower.register_event('zone change', function()
    windower.chat.input('//lua u autoFite')
end)
