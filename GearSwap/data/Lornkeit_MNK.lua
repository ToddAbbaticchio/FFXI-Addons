include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
    
    sets.baseMelee = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves", 
        legs="Samnuha Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        ear1="Sherida Earring",
        ear2="Cessance Earring",
        ring1="Gere Ring",
        ring2="Epona's Ring", 
        back="Segomo's Mantle",
        waist="Windbuffet Belt +1",
    }

    -- Random one-off sets or small sets
    sets.baseIdle = {      
    }

    sets.moveSpeed = {}
    sets.wakeUp = {}
    sets.Obi = {} --{waist="Hachirin-no-Obi"}

    sets.TH = {}
   
    sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}

    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.baseWS = {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        neck="Fotia Gorget",
        ear1="Ishvara Earring",
        ear2="Moonshade Earring",
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        ring1="Rajas Ring",
        ring2="Apate Ring",
        back="Segomo's Mantle",
        waist="Fotia Belt",
        legs="Hizamaru Hizayoroi +2",
        feet="Malignance Boots",
    }

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.baseWS, {

    })

end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS-Base", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},		
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="NA", set={main="Karambit", sub=""}},
        
	}

	--Setup autoBuff
	auto = {
		["buff"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
		["fite"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
	}

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()

end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	--Setup my binds
	

	--Set default macro book / page

	
	--Load job-specific addons

    --windower.send_command:schedule(4, 'input /lockstyleset 181')	
end

function extendedUserUnload()

end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)

end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)	

end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()   
    local me = windower.ffxi.get_player()    
--[[
    if not buffactive['Food'] then
        send_command('input /item "Grape Daifuku" <me>')
        return
    end]]--
end