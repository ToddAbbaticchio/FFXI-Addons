_addon.name = 'autoFite'
_addon.author = 'Risca'
_addon.version = '1.1.7'
_addon.commands = {'autoFite', 'af'}

--settings = config.load(defaults)
require('logger')
require('coroutine')
require('vectors')
require('buffTable')
require('spellAbilityTable')
require('helperFunctions')
    

-----------------------------------------------------------------------------------------------------------
--  USER SETUP HERE  --------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
function initializeSessionVars(job, ...)
    local pullTarget = "Apex"
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

    vars = {}
    vars.BLU = {
        autoBuffs = {
            ["Warcry"] = "Warcry",
            ["Berserk"] = "Berserk",
            ["Nat. Meditation"] = "Attack Boost",
            ["Erratic Flutter"] = "Haste",
            --["Cocoon"] = "Defense Boost",
        },
        ws = "Savage Blade",
        targetTp = 1000,
        pullCommand = '/ma "Glutinous Dart" '
    }

    vars.RUN = {
        autoBuffs = {
            --["Aquaveil"] = "Aquaveil",
            --["Crusade"] = "Enmity Boost",
            --["Phalanx"] = "Phalanx",
            --["Temper"] = "Multi Strikes",
            ["Swordplay"] = "Swordplay",
            ["Last Resort"] = "Last Resort",
            ["Battuta"] = "Battuta",
            --["Valiance"] = "Valiance,One for All",
            --["One for All"] = "Valiance,One for All"
        },
        maintainAftermath = false,
        --ws = "Dimidiation",
        ws = "Resolution",
        targetTp = 1000,
        pullCommand = '/ma "Flash" ',
    }

    vars.SCH = {
        autoBuffs = {
            --["Dark Arts"] = "Addendum: Black"
            ["Light Arts"] = "Addendum: White"
        },
        --ws = "Myrkr",
        ws = "Starlight",
        targetTp = 3000,
        pullCommand = '/ma "Dia II" '
    }

    vars.PUP = {
        autoBuffs = {
            ["Light Maneuver"] = "Light Maneuver",
            ["Dark Maneuver"] = "Dark Maneuver",
            ["Ice Maneuver"] = "Ice Maneuver",
            -- ["Berserk"] = "Berserk",
            -- ["Warcry"] = "Warcry,Blood Rage",
            -- ["Aggressor"] = "Aggressor",
            ["Swordplay"] = "Swordplay",
            ["Valiance"] = "Valiance",
            ["Vallation"] = "Valiance,Vallation"
        },
        -- ws = "Stringing Pummel",
        ws = "Howling Fist",
        -- ws = "Shijin Spiral",
        targetTp = 1750,
        pullCommand = '/ma "Flash" '
        -- pullDistance = 369,
    }

    vars.COR = {
        autoBuffs = {
            ["Chaos Roll"] = "Chaos Roll",
            ["Corsair's Roll"] = "Corsair's Roll",
            ["Haste Samba"] = "Haste Samba"
        },
        ws = "Savage Blade",
        targetTp = 2000,
        pullCommand = '/ra '
    }

    vars.WAR = {
        autoBuffs = {
            ["Berserk"] = "Berserk",
            ["Warcry"] = "Warcry,Blood Rage",
            ["Blood Rage"] = "Warcry,Blood Rage",
            ["Aggressor"] = "Aggressor"
        },
        ws = "Upheaval",
        targetTp = 1500,
        pullCommand = '/ja "Provoke" ',
        pullDistance = 369,
        target = {
            ["pull"] = "Part of monster name",
        },
    }

    vars.SMN = {
        autoBuffs = {},
        ws = "Myrkr",
        targetTp = 3000,
        meleeDistance = 12,
        pullCommand = '/ma "Stone" '
    }

    vars.RDM = {
        autoBuffs = {},
        ws = "Savage Blade",
        targetTp = 1000,
        pullCommand = '/ma "Diaga" '
    }
    -----------------------------------------------------------------------------------------------------------
    --  END USER SETUP  ---------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------

    -- If a vars table doesn't exist for this job, stop here.
    if vars[job] == nil then
        writeLog('A vars.' .. job .. ' table does not exist! Gotta add one to use autoFite!', 1)
        windower.chat.input('//lua u autoFite')
    end

    -- Set default values (if not defined above in a settings section, default value is inserted.)
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

    -- Set other default values
    allowApproach = false
    idle = 0
    engaged = 1
    logMode = 3
    active = true
    pullInProgress = false
    wsCommand = '/ws "' .. jobVars.ws .. '" '

    if jobVars.target.assist then
        writeLog('autoFite started!  Mode: '..mode..' active: '..tostring(active)..' pullTarget: '..jobVars.target.pull..' assistTarget: '..jobVars.target.assist,1)
    else
        writeLog('autoFite started!  Mode: '..mode..' active: '..tostring(active)..' pullTarget: '..jobVars.target.pull,1)
    end
end

-- Main action handler - Decides what we should do
function doStuff(mode, currStatus)
    job = windower.ffxi.get_player().main_job

    -- Main mode logic
    if mode == "pull" then
        if active == true then
            if currStatus == idle then
                pullInProgress = true
                findTargetV2()
                pullInProgress = false
            end

            if currStatus == engaged then
                startEngageAttemptTime = nil
                detectedPullAction = false
                local monster = windower.ffxi.get_mob_by_target('t')
                faceTarget()
                if jobVars.ws ~= nil then
                    wsHandler()
                end

                -- If target moves out of range
                if monster.distance >= jobVars.meleeDistance then
                    writeLog('Engaged, but enemy too far away! Pulling!', 3)
                    tryPull(monster)
                end
            end
        end
    end

    -- Assist mode logic
    if mode == "assist" then
        if active == true then
            local assistTarget = windower.ffxi.get_mob_by_name(jobVars.target.assist)
            
            if currStatus == idle then
                if assistTarget.status == engaged then
                    if windower.ffxi.get_mob_by_target('t') ~= nil and not isAutofiteTarget(windower.ffxi.get_mob_by_target('t')) then
                        pressKey('escape', 0.1)
                    end
                    windower.chat.input:schedule(0.5, "/assist " .. assistTarget.name)
                    windower.chat.input:schedule(1.5, '/attack on')
                end
            end

            if currStatus == engaged then
                local currentTarget = windower.ffxi.get_mob_by_target('t')
                if currentTarget.distance > jobVars.meleeDistance then
                    approachTarget(0.1, 'enemy')
                else
                    faceTarget()
                    wsHandler()
                end
            end
        end
    end

    if windower.ffxi.get_player().status == engaged then
        autoBuffHandler()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- registered event handling
-------------------------------------------------------------------------------------------------------------------
-- addon commands
windower.register_event('addon command', function(...)
    mode = 'pull'
    local arg = {...}
    local afAction = arg[1]

    local startCommands = "start,active,on,go"
    if startCommands:contains(afAction:lower()) then
        local job = windower.ffxi.get_player().main_job
        local pullTarget = nil
        if arg[2] ~= nil then
            pullTarget = arg[2]
        end
        initializeSessionVars(job, pullTarget)
    end

    if afAction:lower() == 'assist' then
        mode = 'assist'
        local job = windower.ffxi.get_player().main_job
        local assistTarget = nil
        local pullTarget = nil
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
        writeLog('autoFite deactivated!', 1)
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
    if afAction:lower() == 'fixtab' then
        pressKey('TAB', 0.05)
    end

    -- Some testing / debug commands because apparently we hate having a working console

    if afAction:lower() == 'distance' then
        windower.add_to_chat(200, '-- Distance: ' .. windower.ffxi.get_mob_by_target('t').distance .. ' meleeDistance: '..jobVars.meleeDistance..' --')
    end
    if afAction:lower() == 'approach' then
        if approachTarget == false then
            approachTarget = true
            writeLog('-- approachTarget: True --', 1)
        else
            approachTarget = false
            writeLog('-- approachTarget: False --', 1)
        end
    end
    if afAction:lower() == 'test' then
        local monster = windower.ffxi.get_mob_by_target('t')
        writeLog('TargetID: '..monster.id, 1)
        --windower.chat.input(jobVars.pullCommand..monster.id)
    end
    if afAction:lower() == 'bt' then
        if windower.ffxi.get_mob_by_target('bt') ~= nil then
            local monster = windower.ffxi.get_mob_by_target('bt')
            writeLog('TargetID: '..monster.id..' health: '..monster.hpp, 1)
        end
        --windower.chat.input(jobVars.pullCommand..monster.id)
    end
    if afAction:lower() == 'adistance' then
        local aTarget = windower.ffxi.get_mob_by_name(jobVars.target.assist)
        writeLog('AssistTarget: '..aTarget.name..' distance: '..aTarget.distance, 3)
        --windower.chat.input(jobVars.pullCommand..monster.id)
    end
end)

-- the loop that controls everything (now with bonus mosly useless autorecovery bits)
startTime = 0
errRecovery = 0
windower.register_event('postrender', function()
    if os.time() > startTime and active == true then
        local currentStatus = windower.ffxi.get_player().status
        if pullInProgress == false then
            doStuff(mode, currentStatus)
        end
        startTime = os.time()
    end
end)

-- zone change event to unload the addon
windower.register_event('zone change', function()
    windower.chat.input('//lua u  autoFite')
end)