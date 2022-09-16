----------------------------------------------------------------------------------------
--  __  __           _                     __   _____                        _
-- |  \/  |         | |                   / _| |  __ \                      | |
-- | \  / | __ _ ___| |_ ___ _ __    ___ | |_  | |__) |   _ _ __  _ __   ___| |_ ___
-- | |\/| |/ _` / __| __/ _ \ '__|  / _ \|  _| |  ___/ | | | '_ \| '_ \ / _ \ __/ __|
-- | |  | | (_| \__ \ ||  __/ |    | (_) | |   | |   | |_| | |_) | |_) |  __/ |_\__ \
-- |_|  |_|\__,_|___/\__\___|_|     \___/|_|   |_|    \__,_| .__/| .__/ \___|\__|___/
--                                                         | |   | |
--                                                         |_|   |_|
-----------------------------------------------------------------------------------------
--[[

    Originally Created By: Faloun
    Programmers: Arrchie, Kuroganashi, Byrne, Tuna
    Testers:Arrchie, Kuroganashi, Haxetc, Patb, Whirlin, Petsmart
    Contributors: Xilkk, Byrne, Blackhalo714

    ASCII Art Generator: http://www.network-science.de/ascii/
    
]]

-- Initialization function for this job file.
-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include("Mote-Include.lua")
end

function user_setup()
    -- Alt-F10 - Toggles Kiting Mode.

    --[[
        F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
        
        These are for when you are fighting with or without Pet
        When you are IDLE and Pet is ENGAGED that is handled by the Idle Sets
    ]]
    state.OffenseMode:options("MasterPet", "Master", "Trusts")

    --[[
        Ctrl-F9 - Cycle Hybrid Mode (the defensive half of all 'hybrid' melee modes).
        
        Used when you are Engaged with Pet
        Used when you are Idle and Pet is Engaged
    ]]
    state.HybridMode:options("Normal", "Acc", "TP", "DT", "Regen", "Ranged")

    --[[
        Alt-F12 - Turns off any emergency mode
        
        Ctrl-F10 - Cycle type of Physical Defense Mode in use.
        F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
    ]]
    state.PhysicalDefenseMode:options("PetDT", "MasterDT")

    --[[
        Alt-F12 - Turns off any emergency mode

        F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
    ]]
    state.MagicalDefenseMode:options("PetMDT")

    --[[ IDLE Mode Notes:

        F12 - Update currently equipped gear, and report current status.
        Ctrl-F12 - Cycle Idle Mode.
        
        Will automatically set IdleMode to Idle when Pet becomes Engaged and you are Idle
    ]]
    state.IdleMode:options("Idle", "MasterDT")

    --Various Cycles for the different types of PetModes
    state.PetStyleCycleTank = M {"NORMAL", "DD", "MAGIC", "SPAM"}
    state.PetStyleCycleMage = M {"NORMAL", "HEAL", "SUPPORT", "MB", "DD"}
    state.PetStyleCycleDD = M {"NORMAL", "BONE", "SPAM", "OD", "ODACC"}

    --The actual Pet Mode and Pet Style cycles
    --Default Mode is Tank
    state.PetModeCycle = M {"TANK", "DD", "RANGED", "MAGE"}
    --Default Pet Cycle is Tank
    state.PetStyleCycle = state.PetStyleCycleTank

    --Toggles
    --[[
        Alt + E will turn on or off Auto Maneuver
    ]]
    state.AutoMan = M(false, "Auto Maneuver")

    --[[
        //gs c toggle autodeploy
    ]]
    state.AutoDeploy = M(false, "Auto Deploy")

    --[[
        Alt + D will turn on or off Lock Pet DT
        (Note this will block all gearswapping when active)
    ]]
    state.LockPetDT = M(false, "Lock Pet DT")

    --[[
        Alt + (tilda) will turn on or off the Lock Weapon
    ]]
    state.LockWeapon = M(false, "Lock Weapon")

    --[[
        //gs c toggle setftp
    ]]
    state.SetFTP = M(false, "Set FTP")

   --[[
        This will hide the entire HUB
        //gs c hub all
    ]]
    state.textHideHUB = M(false, "Hide HUB")

    --[[
        This will hide the Mode on the HUB
        //gs c hub mode
    ]]
    state.textHideMode = M(false, "Hide Mode")

    --[[
        This will hide the State on the HUB
        //gs c hub state
    ]]
    state.textHideState = M(false, "Hide State")

    --[[
        This will hide the Options on the HUB
        //gs c hub options
    ]]
    state.textHideOptions = M(false, "Hide Options")

    --[[
        This will toggle the HUB lite mode
        //gs c hub lite
    ]]  
    state.useLightMode = M(false, "Toggles Lite mode")

    --[[
        This will toggle the default Keybinds set up for any changeable command on the window
        //gs c hub keybinds
    ]]
    state.Keybinds = M(false, "Hide Keybinds")

    --[[ 
        This will toggle the CP Mode 
        //gs c toggle CP 
    ]] 
    state.CP = M(false, "CP") 
    --CP_CAPE = "Aptitude Mantle +1" 
	 CP_CAPE = "Mecistopins Mantle"

    --[[
        Enter the slots you would lock based on a custom set up.
        Can be used in situation like Salvage where you don't want
        certain pieces to change.

        //gs c toggle customgearlock
        ]]
    state.CustomGearLock = M(false, "Custom Gear Lock")
    --Example customGearLock = T{"head", "waist"}
    customGearLock = T{}

    send_command("bind !f7 gs c cycle PetModeCycle")
    send_command("bind ^f7 gs c cycleback PetModeCycle")
    send_command("bind !f8 gs c cycle PetStyleCycle")
    send_command("bind ^f8 gs c cycleback PetStyleCycle")
    send_command("bind !e gs c toggle AutoMan")
    send_command("bind !d gs c toggle LockPetDT")
    send_command("bind !f6 gs c predict")
    send_command("bind ^` gs c toggle LockWeapon")
    send_command("bind home gs c toggle setftp")
    send_command("bind PAGEUP gs c toggle autodeploy")
    send_command("bind PAGEDOWN gs c hide keybinds")
    send_command("bind end gs c toggle CP") 
    send_command("bind = gs c clear")

    select_default_macro_book()

    -- Adjust the X (horizontal) and Y (vertical) position here to adjust the window
    pos_x = 0
    pos_y = 0
    setupTextWindow(pos_x, pos_y)
    
end

function file_unload()
    send_command("unbind !f7")
    send_command("unbind ^f7")
    send_command("unbind !f8")
    send_command("unbind ^f8")
    send_command("unbind !e")
    send_command("unbind !d")
    send_command("unbind !f6")
    send_command("unbind ^`")
    send_command("unbind home")
    send_command("unbind PAGEUP")
    send_command("unbind PAGEDOWN")       
    send_command("unbind end")
    send_command("unbind =")
end

function job_setup()
    include("PUP-LIB.lua")
end

function init_gear_sets()
    --Table of Contents
    ---Gear Variables
    ---Master Only Sets
    ---Hybrid Only Sets
    ---Pet Only Sets
    ---Misc Sets

    -------------------------------------------------------------------------
    --  _____                  __      __        _       _     _
    -- / ____|                 \ \    / /       (_)     | |   | |
    --| |  __  ___  __ _ _ __   \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___
    --| | |_ |/ _ \/ _` | '__|   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
    --| |__| |  __/ (_| | |       \  / (_| | |  | | (_| | |_) | |  __/\__ \
    -- \_____|\___|\__,_|_|        \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
    -------------------------------------------------------------------------
    --[[
        This section is best ultilized for defining gear that is used among multiple sets
        You can simply use or ignore the below
    ]]
    --Animators = {}
    --Animators.Range = "Animator P II"
    --Animators.Melee = "Animator P +1"
	--Animators.Melee = "Animator P"

    --Adjust to your reforge level
    --Sets up a Key, Value Pair
    Artifact_Foire = {}
    Artifact_Foire.Head_PRegen = "Pup. Taj"		--"Foire Taj +1"
    Artifact_Foire.Body_WSD_PTank = "Pup. Tobe"	--"Foire Tobe +1"
    Artifact_Foire.Hands_Mane_Overload = "Pup. Dastanas"	--"Foire Dastanas +1"
    Artifact_Foire.Legs_PCure = "Pup. Churidars"		--"Foire Churidars +1"
    Artifact_Foire.Feet_Repair_PMagic = "Pup. Babouches"	--"Foire Babouches +1"

    Relic_Pitre = {}
    Relic_Pitre.Head_PRegen = "Pitre Taj"		--"Pitre Taj +2" --Enhances Optimization
    Relic_Pitre.Body_PTP = "Pitre Tobe +1"		--"Pitre Tobe +2" --Enhances Overdrive
    Relic_Pitre.Hands_WSD = "Pitre Dastanas +1"		--"Pitre Dastanas +2" --Enhances Fine-Tuning
    Relic_Pitre.Legs_PMagic = "Pitre Churidars +3"	--"Pitre Churidars +2" --Enhances Ventriloquy
    Relic_Pitre.Feet_PMagic = "Pitre Babouches +3"	--"Pitre Babouches +1" --Role Reversal

    Empy_Karagoz = {}
    Empy_Karagoz.Head_PTPBonus = "Cirque Cappello +1"	--"Karagoz Capello"
    Empy_Karagoz.Body_Overload = "Cirque Farsetto +1"  --"Karagoz Farsetto"
    Empy_Karagoz.Hands = "Cirque Guanti +1"					--"Karagoz Guanti"
    Empy_Karagoz.Legs_Combat = "Cirq. Pantaloni +1"			--"Karagoz Pantaloni +1"
    Empy_Karagoz.Feet_Tatical = "Cirque Scarpe +1"		--"Karagoz Scarpe +1"

    Visucius = {}
    Visucius.PetDT = {
        name = "Visucius's Mantle",
        augments = {
            "Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20",
            "Accuracy+20 Attack+20",
            "Pet: Accuracy+4 Pet: Rng. Acc.+4",
            'Pet: "Regen"+10',
            "Pet: Damage taken -5%"
        }
    }
    Visucius.PetMagic = {
        name = "Visucius's Mantle",
        augments = {
            "Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20",
            "Accuracy+20 Attack+20",
            "Pet: Accuracy+4 Pet: Rng. Acc.+4",
            'Pet: "Regen"+10',
            "Pet: Damage taken -5%"
        }
    }

    --------------------------------------------------------------------------------
    --  __  __           _               ____        _          _____      _
    -- |  \/  |         | |             / __ \      | |        / ____|    | |
    -- | \  / | __ _ ___| |_ ___ _ __  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- | |\/| |/ _` / __| __/ _ \ '__| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  | | (_| \__ \ ||  __/ |    | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|  |_|\__,_|___/\__\___|_|     \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                                  __/ |
    --                                                 |___/
    ---------------------------------------------------------------------------------
    --This section is best utilized for Master Sets
    --[[
        Will be activated when Pet is not active, otherwise refer to sets.idle.Pet
    ]]
    sets.idle = {
		main="Oatixur",
		--ranged="Neo Animator",
		--head={ name="Pitre Taj", augments={'Enhances "Optimization" effect',}},
		head={ name="Rawhide Mask", augments={'Attack+15','Pet: Mag. Acc.+20','Pet: "Mag.Atk.Bns."+15',}},
		body="Hiza. Haramaki +2",
		hands="Mpaca's Gloves",
		legs="Assid. Pants +1",
		--legs="Mpaca's Hose",
		feet="Hermes' Sandals",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
		waist="Fucho-no-Obi",
		left_ear="Infused Earring",
		right_ear="Reraise Earring",
		ring1={name="Chirich Ring +1", bag="wardrobe4"},
		ring2={name="Chirich Ring +1", bag="wardrobe5"},
		--left_ring={name="Stikini Ring +1", bag="wardrobe4"},
		--right_ring={name="Stikini Ring +1", bag="wardrobe5"},
		back="Solemnity Cape",
	}

    -------------------------------------Fastcast
    sets.precast.FC = {
       -- Add your set here 
		head="Haruspex Hat",		--8%
		body="Taeon Tabard",		--4%
		legs={ name="Herculean Trousers", augments={'AGI+9','"Fast Cast"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}, 	--2%
		feet="Regal Pumps +1",		--4% +1-3%
		left_ear="Enchntr. Earring +1",		--2%
		back="Swith Cape",	 		--Enhances "Fast Cast" effect  
    }

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {
		legs="Doyen Pants",
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        legs="Doyen Pants",
		feet="Kaykaus Boots +1", --0/7
        ear2="Mendi. Earring", --0/5
    })

    -------------------------------------Midcast
    sets.midcast = {} --Can be left empty

    sets.midcast.FastRecast = {
       -- Add your set here 
    }

    -------------------------------------Kiting
    sets.Kiting = {feet = "Hermes' Sandals"}

    -------------------------------------JA
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
			neck = "Magoraga Beads", 
			body = "Passion Jacket",
			back="Mujin Mantle",
		})

	--sets.midcast.FC.Utsusemi = {back = "Mujin Mantle"} Need to fix to work somehow?

    -- Precast sets to enhance JAs
    sets.precast.JA = {} -- Can be left empty

    sets.precast.JA["Tactical Switch"] = {feet = Empy_Karagoz.Feet_Tatical}

    sets.precast.JA["Ventriloquy"] = {legs = Relic_Pitre.Legs_PMagic}

    sets.precast.JA["Role Reversal"] = {feet = Relic_Pitre.Feet_PMagic}

    sets.precast.JA["Overdrive"] = {body = Relic_Pitre.Body_PTP}

    sets.precast.JA["Repair"] = {
		main="Gnafron's Adargas",
        ammo = "Automat. Oil +3",
		body="Pup. Tobe",
        feet = Artifact_Foire.Feet_Repair_PMagic,
		ear1 = "Guignol Earring",
		left_ring="Overbearing Ring",
    }

    sets.precast.JA["Maintenance"] = set_combine(sets.precast.JA["Repair"], {})

    sets.precast.JA.Maneuver = {
		main="Midnights",
        neck = "Buffoon's Collar +1",
        body = Empy_Karagoz.Body_Overload,
        hands = Artifact_Foire.Hands_Mane_Overload,
        back = "Visucius's Mantle",
        ear1 = "Burana Earring"
    }

    sets.precast.JA["Activate"] = {
		back = "Visucius's Mantle",
		feet="Mpaca's Boots",
		}

    sets.precast.JA["Deus Ex Automata"] = sets.precast.JA["Activate"]

    sets.precast.JA["Provoke"] = {}

    --Waltz set (chr and vit)
    sets.precast.Waltz = {
       -- Add your set here 
	    head="Tali'ah Turban +2",
		body="Tali'ah Manteel +2",
		hands="Tali'ah Gages +2",
		legs="Nyame Flanchard",
		feet="Rawhide Boots",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Porous Rope",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		left_ear="Enchntr. Earring +1",
		right_ear="Enervating Earring",
		left_ring="Tali'ah Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Refraction Cape",
    }

    sets.precast.Waltz["Healing Waltz"] = {}

    -------------------------------------WS
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
       -- Add your set here 
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Hiza. Hizayoroi +2",
		feet="Mpaca's Boots",
		neck="Shulmanu Collar",
		waist="Eschan Stone",
		waist="Moonbow Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},   
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Stringing Pummel"] = set_combine(sets.precast.WS, {
		feet={ name="Ryuo Sune-Ate +1", augments={'STR+12','Attack+25','Crit. hit rate+4%',}},
		--waist="Prosilio Belt +1",
	})

    sets.precast.WS["Stringing Pummel"].Mod = set_combine(sets.precast.WS, {
		
		
	})

    sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {
		--waist="Prosilio Belt +1",
		feet={ name="Ryuo Sune-Ate +1", augments={'STR+12','Attack+25','Crit. hit rate+4%',}},
	})

    sets.precast.WS["Shijin Spiral"] = set_combine(sets.precast.WS, {
            -- Add your set here
    })

    sets.precast.WS["Howling Fist"] = set_combine(sets.precast.WS, {
		--waist="Windbuffet Belt +1",
		neck="Pup. Collar +2",
	})

	sets.precast.WS["Shoulder Tackle"] = set_combine(sets.precast.WS, {
		waist="Eschan Stone",
		neck="Sanctity Necklace",
		left_ring="Beithir Ring",
	})

	sets.precast.WS["Asuran Fists"] = set_combine(sets.precast.WS, {
		left_ear="Telos Earring",
	})

	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
        ear1="Moonshade Earring",
			head={ name="Herculean Helm", augments={'"Dual Wield"+2','"Mag.Atk.Bns."+2','Accuracy+12 Attack+12','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
			--body="Mummu Jacket +2",
			--hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
			legs={ name="Herculean Trousers", augments={'AGI+9','"Fast Cast"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
			feet={ name="Herculean Boots", augments={'Haste+2','DEX+4','Magic Damage +10','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
			neck="Stoicheion Medal",
			waist="Orpheus's Sash",
			left_ear="Ishvara Earring",
			right_ear="Hecate's Earring",
			--left_ring="Epaminondas's Ring",
			--right_ring="Dingir Ring",
			back="Argocham. Mantle",
		
        })

    -------------------------------------Idle
    --[[
        Pet is not active
        Idle Mode = MasterDT
    ]]
    sets.idle.MasterDT = {
       -- Add your set here 
		main="Sakpata's Fists",		--Cure received potency +15%
		head="Mpaca's Cap",			--PDT -7%
		body="Hiza. Haramaki +2",	--Enhances Counter, Regen +12
		hands="Mpaca's Gloves",		--PDT -8%
		legs="Mpaca's Hose",		--PDT -9%
		feet="Mpaca's Boots",		--PDT -6%
		neck="Loricate Torque",		--DT -5%
		waist="Moonbow Belt +1",		--DT -6%
		left_ear="Infused Earring",	--Resists Stun
		right_ear="Eabani Earring",	--EVA +7
		left_ring="Fortified Ring",		--MDT -5%, Enemy crit hit rate -7%
		right_ring="Defending Ring",		--DT -10%
		back="Solemnity Cape",	   		--DT -4%
    }		--DT -24%, PDT -35%, MDT -5%

    -------------------------------------Engaged
    --[[
        Offense Mode = Master
        Hybrid Mode = Normal
    ]]
    sets.engaged.Master = {
       -- Add your set here 
		main="Sakpata's Fists",
		--range="Neo Animator",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Shulmanu Collar",
		waist="Moonbow Belt +1",
		left_ear="Schere Earring",
		right_ear="Balder Earring +1",
		left_ring="Niqmaddu Ring",
		right_ring="Epona's Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},	     
    }

    -------------------------------------Acc
    --[[
        Offense Mode = Master
        Hybrid Mode = Acc
    ]]
    sets.engaged.Master.Acc = set_combine(sets.engaged.Master, {
       -- Add your set here 
		head="Hiza. Somen +2",
		body="Tali'ah Manteel +2",
		hands="Tali'ah Gages +2",
		legs="Hiza. Hizayoroi +2",
		feet="Hiza. Sune-Ate +2",
		neck="Shulmanu Collar",
		waist="Eschan Stone",
		left_ear="Telos Earring",
		right_ear="Mache Earring",
		ring1={name="Chirich Ring +1", bag="wardrobe4"},
		ring2={name="Chirich Ring +1", bag="wardrobe5"},
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},	   
    })

    -------------------------------------TP
    --[[
        Offense Mode = Master
        Hybrid Mode = TP
    ]]
    sets.engaged.Master.TP = set_combine(sets.engaged.Master, {
       -- Add your set here
		legs={ name="Herculean Trousers", augments={'VIT+5','Pet: Phys. dmg. taken -1%','Accuracy+8 Attack+8','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		left_ear="Telos Earring",
		right_ear="Balder Earring +1",
	   	ring1={name="Chirich Ring +1", bag="wardrobe4"},
		ring2={name="Chirich Ring +1", bag="wardrobe5"},
    })

    -------------------------------------DT
    --[[
        Offense Mode = Master
        Hybrid Mode = DT
    ]]
    sets.engaged.Master.DT = set_combine(sets.engaged.Master, {
       -- Add your set here    
		main="Sakpata's Fists",		--Cure received potency +15%
		head="Mpaca's Cap",			--PDT -7%
		body="Hiza. Haramaki +2",	--Enhances Counter, Regen +12
		hands="Mpaca's Gloves",		--PDT -8%
		legs="Mpaca's Hose",		--PDT -9%
		feet="Mpaca's Boots",		--PDT -6%
		neck="Loricate Torque",		--DT -5%
		waist="Moonbow Belt +1",	--DT -6%
		left_ring="Fortified Ring",		--MDT -5%, Enemy crit hit rate -7%
		right_ring="Defending Ring",		--DT -10%
		--back="Solemnity Cape",	   		--DT -4%
    })

    ----------------------------------------------------------------------------------
    --  __  __         _           ___     _     ___      _
    -- |  \/  |__ _ __| |_ ___ _ _| _ \___| |_  / __| ___| |_ ___
    -- | |\/| / _` (_-<  _/ -_) '_|  _/ -_)  _| \__ \/ -_)  _(_-<
    -- |_|  |_\__,_/__/\__\___|_| |_| \___|\__| |___/\___|\__/__/
    -----------------------------------------------------------------------------------

    --[[
        These sets are designed to be a hybrid of player and pet gear for when you are
        fighting along side your pet. Basically gear used here should benefit both the player
        and the pet.
    ]]
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Normal
    ]]
    sets.engaged.MasterPet = {
       -- Add your set here 
		main="Sakpata's Fists",
		--range="Animator P +1",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Shulmanu Collar",
		waist="Moonbow Belt +1",
		left_ear="Schere Earring",
		right_ear="Balder Earring +1",
		left_ring="Niqmaddu Ring",
		right_ring="Epona's Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
    }

    -------------------------------------Acc
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Acc
    ]]
    sets.engaged.MasterPet.Acc = set_combine(sets.engaged.MasterPet, {
       -- Add your set here 
		head="Tali'ah Turban +2",
		body="Tali'ah Manteel +2",
		hands="Tali'ah Gages +2",
		legs="Tali'ah Sera. +2",
		feet="Tali'ah Crackows +2",
		neck="Shulmanu Collar",
		waist="Klouskap Sash +1",
		--right_ear="Steelflash Earring",
		left_ear="Telos Earring",
		right_ear="Enmerkar Earring",
		ring1={name="Varar Ring +1", bag="wardrobe4"},
		ring2={name="Varar Ring +1", bag="wardrobe5"},
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
    })
	--[[				HELP GET TO WORK PROPERLY PLEASE
    	
	    Offense Mode = MasterPet
        Hybrid Mode = Ranged
    
    sets.engaged.MasterPet.Ranged = set_combine(sets.engaged.MasterPet, {
            legs = Empy_Karagoz.Legs_Combat,
			neck="Empath Necklace",
        })
	
	sets.engaged.MasterPet.Ranged.Acc = set_combine(sets.engaged.MasterPet,Ranged {
			right_ear="Mache Earring",
        })
	]]	
-------------------------------------TP
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = TP
    ]]


    sets.engaged.MasterPet.TP = set_combine(sets.engaged.MasterPet, {
       -- Add your set here 
	   	head="Tali'ah Turban +2",
		body={ name="Pitre Tobe", augments={'Enhances "Overdrive" effect',}},
		legs={ name="Herculean Trousers", augments={'VIT+5','Pet: Phys. dmg. taken -1%','Accuracy+8 Attack+8','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		--left_ear="Bladeborn Earring",
		left_ear="Domes. Earring",
		right_ear="Enmerkar Earring",
	   	--ring1={name="Chirich Ring +1", bag="wardrobe4"},
		ring1={name="Varar Ring +1", bag="wardrobe4"},
		ring2={name="Chirich Ring +1", bag="wardrobe5"},
		--ring2={name="Varar Ring +1", bag="wardrobe5"},
    })

    -------------------------------------DT
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = DT
    ]]
    sets.engaged.MasterPet.DT = set_combine(sets.engaged.MasterPet, {
       -- Add your set here 
		main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},	--Pet DT -3%
		head="Mpaca's Cap",			--PDT -7%
		body="Mpaca's Doublet",		--PDT -10%
		hands="Mpaca's Gloves",		--PDT -8%
		legs="Tali'ah Sera. +2",	--Pet: DT -5%
		feet="Mpaca's Boots",		--PDT -6%
		neck="Loricate Torque",		--DT -5%
		waist="Klouskap Sash +1",
		right_ear="Enmerkar Earring",	--Pet: DT -3%
		left_ring="Fortified Ring",		--MDT -5%, Enemy crit hit rate -7%
		right_ring="Defending Ring",		--DT -10%
		back="Solemnity Cape",	   		--DT -4%
    })

    -------------------------------------Regen
    --[[
        Offense Mode = MasterPet
        Hybrid Mode = Regen
    ]]
    sets.engaged.MasterPet.Regen = set_combine(sets.engaged.MasterPet, { 
       -- Add your set here 
	   	head={ name="Pitre Taj", augments={'Enhances "Optimization" effect',}},			--Master and Pet add Regen effect
		body="Hiza. Haramaki +2",	--Master Regen +12
		feet={ name="Rao Sune-Ate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
		neck="Empath Necklace",		--Pet Regen +1
		ear1="Infused Earring",
		right_ear="Burana Earring",
		ring1={name="Chirich Ring +1", bag="wardrobe4"},
		ring2={name="Chirich Ring +1", bag="wardrobe5"},
    })

    ----------------------------------------------------------------
    --  _____     _      ____        _          _____      _
    -- |  __ \   | |    / __ \      | |        / ____|    | |
    -- | |__) |__| |_  | |  | |_ __ | |_   _  | (___   ___| |_ ___
    -- |  ___/ _ \ __| | |  | | '_ \| | | | |  \___ \ / _ \ __/ __|
    -- | |  |  __/ |_  | |__| | | | | | |_| |  ____) |  __/ |_\__ \
    -- |_|   \___|\__|  \____/|_| |_|_|\__, | |_____/ \___|\__|___/
    --                                  __/ |
    --                                 |___/
    ----------------------------------------------------------------

    -------------------------------------Magic Midcast
    sets.midcast.Pet = {
       -- Add your set here 
		main="Sakpata's Fists",
		--range="Animator P +1",
		ammo="Automat. Oil +3",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		--hands="Mpaca's Gloves",
		hands="Pitre Dastanas +1",
		--legs="Mpaca's Hose",
		legs="Pitre Chruridars +3",
		feet="Mpaca's Boots",
		neck="Adad Amulet",
		waist="Klouskap Sash +1",
		left_ear="Burana Earring",
		right_ear="Enmerkar Earring",
		ring1={name="Varar Ring +1", bag="wardrobe4"},
		right_ring="Tali'ah Ring",
		--back="Refraction Cape",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
    }

    sets.midcast.Pet.Cure = set_combine(sets.midcast.Pet, {
       -- Add your set here 
	   --hands="Pitre Dastanas +1",
	   main="Gnafron's Adargas",
	   legs="Pup. Churidars",
	   feet="Naga Kyahan",
	   back="Refraction Cape",
    })

    sets.midcast.Pet["Healing Magic"] = set_combine(sets.midcast.Pet, {
       -- Add your set here 
	   --hands="Pitre Dastanas +1",
	   main="Gnafron's Adargas",
	   legs="Pup. Churidars",
	   feet="Naga Kyahan",
	   back="Refraction Cape",   
    })

    sets.midcast.Pet["Elemental Magic"] = set_combine(sets.midcast.Pet, {
       -- Add your set here 
	   --feet="Naga Kyahan",
	   meain="Tinhaspa",
	   head={ name="Rawhide Mask", augments={'Attack+15','Pet: Mag. Acc.+20','Pet: "Mag.Atk.Bns."+15',}},
	   hands="Pitre Dastanas +1",
	   legs="Pitre Chruridars +3",
	   feet="Pitre Babouches +3",
	   neck="Pup. Collar +2",
	   left_ear="Burana Earring",
	   back="Refraction Cape",
    })

    sets.midcast.Pet["Enfeebling Magic"] = set_combine(sets.midcast.Pet, {
       -- Add your set here 
	   neck="Pup. Collar +2",
	   hands="Mpaca's Gloves",
	   legs="Mpaca's Hose",
	   feet="Mpaca's Boots",
	   back="Refraction Cape",
    })

    sets.midcast.Pet["Dark Magic"] = set_combine(sets.midcast.Pet, {
       -- Add your set here 
	   neck="Pup. Collar +2",
	   legs="Pitre Chruridars +3",
	   back="Refraction Cape",
    })

    sets.midcast.Pet["Divine Magic"] = set_combine(sets.midcast.Pet, {
       -- Add your set here 
	   head={ name="Rawhide Mask", augments={'Attack+15','Pet: Mag. Acc.+20','Pet: "Mag.Atk.Bns."+15',}},
	   hands="Pitre Dastanas +1",
	   legs="Pitre Chruridars +3",
	   feet="Pitre Babouches +3",
	   neck="Pup. Collar +2",
	   back="Refraction Cape",
    })

    sets.midcast.Pet["Enhancing Magic"] = set_combine(sets.midcast.Pet, {
       -- Add your set here 
	   hands="Pitre Dastanas +1",
	   legs="Pup. Churidars",
	   feet="Naga Kyahan",
	   back="Refraction Cape",
    })

    -------------------------------------Idle
    --[[
        This set will become default Idle Set when the Pet is Active 
        and sets.idle will be ignored
        Player = Idle and not fighting
        Pet = Idle and not fighting

        Idle Mode = Idle
    ]]
    sets.idle.Pet = {
       -- Add your set here 
		main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
		--range="Animator P +1",
		head={ name="Pitre Taj", augments={'Enhances "Optimization" effect',}},
		--head={ name="Rawhide Mask", augments={'Attack+15','Pet: Mag. Acc.+20','Pet: "Mag.Atk.Bns."+15',}},
		body="Hiza. Haramaki +2",
		hands="Mpaca's Gloves",
		legs="Assid. Pants +1",
		--legs="Mpaca's Hose",
		feet="Hermes' Sandals",
		neck={ name="Bathy Choker +1", augments={'Path: A',}},
		waist="Fucho-no-Obi",
		left_ear="Burana Earring",
		right_ear="Reraise Earring",
		ring1={name="Chirich Ring +1", bag="wardrobe4"},
		ring2={name="Chirich Ring +1", bag="wardrobe5"},
		--left_ring={name="Stikini Ring +1", bag="wardrobe4"},
		--right_ring={name="Stikini Ring +1", bag="wardrobe5"},
		back="Solemnity Cape",
    }

    --[[
        If pet is active and you are idle and pet is idle
        Player = idle and not fighting
        Pet = idle and not fighting

        Idle Mode = MasterDT
    ]]
    sets.idle.Pet.MasterDT = set_combine(sets.idle.Pet, {
       -- Add your set here 
	   	--range="Animator P +1",
		--neck="Loricate Torque",		--DT -5%
		main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
		waist="Klouskap Sash +1",		--DEF: 16
		--left_ear="Dominance Earring",	--Resists Stun
		--left_ring="Gelatinous Ring",	--PDT -6%, MDT +2%
		--right_ring="Defending Ring",		--DT -10%
		main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},	--Pet DT -3%
		head="Mpaca's Cap",			--PDT -7%
		body="Hiza. Haramaki +2",	--Enhances Counter, Regen +12
		hands="Mpaca's Gloves",		--PDT -8%
		legs="Tali'ah Sera. +2",	--Pet: DT -5%
		feet="Mpaca's Boots",		--PDT -6%
		neck="Loricate Torque",		--DT -5%
		right_ear="Enmerkar Earring",	--Pet: DT -3%
		left_ring="Fortified Ring",		--MDT -5%, Enemy crit hit rate -7%
		right_ring="Defending Ring",		--DT -10%
		back="Solemnity Cape",	   		--DT -4%
    })

    -------------------------------------Enmity
    sets.pet = {} -- Not Used

    --Equipped automatically
    sets.pet.Enmity = {
       -- Add your set here 
		head="Heyoka Cap",
		body="Heyoka Harness",
		hands="Heyoka Mittens",
		legs="Heyoka Subligar",
		feet="Heyoka Leggings",
		left_ear="Domes. Earring",
    }

    --[[
        Activated by Alt+D or
        F10 if Physical Defense Mode = PetDT
    ]]
    sets.pet.EmergencyDT = set_combine(sets.idle.Pet, {
       -- Add your set here 
	   main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
	   head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		legs={ name="Taeon Tights", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet={ name="Taeon Boots", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	   --legs="Tali'ah Sera. +2",
	   neck="Empath Necklace",
	   right_ear="Enmerkar Earring",
    })

	sets.pet.OD = {
		main="Sakpata's Fists",
		--range="Animator P +1",
		ammo="Automat. Oil +3",
		head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		legs={ name="Taeon Tights", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet={ name="Taeon Boots", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		neck="Shulmanu Collar",
		waist="Klouskap Sash +1",
		left_ear="Domes. Earring",
		right_ear="Enmerkar Earring",
		ring1={name="Varar Ring +1", bag="wardrobe4"},
		ring2={name="Varar Ring +1", bag="wardrobe5"},
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
	}

    -------------------------------------Engaged for Pet Only
    --[[
      For Technical Users - This is layout of below
      sets.idle[idleScope][state.IdleMode][ Pet[Engaged] ][CustomIdleGroups] 

      For Non-Technical Users:
      If you the player is not fighting and your pet is fighting the first set that will activate is sets.idle.Pet.Engaged
      You can further adjust this by changing the HyrbidMode using Ctrl+F9 to activate the Acc/TP/DT/Regen/Ranged sets
    ]]
    --[[
        Idle Mode = Idle
        Hybrid Mode = Normal
    ]]
    sets.idle.Pet.Engaged = set_combine(sets.idle.Pet, {
       -- Add your set here 
		--main="Sakpata's Fists",
		main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
		--range="Animator P +1",
		--head="Mpaca's Cap",
		--body="Mpaca's Doublet",
		--hands="Mpaca's Gloves",
		--legs="Mpaca's Hose",
		--feet="Mpaca's Boots",
		head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		legs={ name="Taeon Tights", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet={ name="Taeon Boots", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		neck="Shulmanu Collar",
		waist="Klouskap Sash +1",
		left_ear="Domes. Earring",
		right_ear="Enmerkar Earring",
		ring1={name="Varar Ring +1", bag="wardrobe4"},
		ring2={name="Varar Ring +1", bag="wardrobe5"},
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
    })

    --[[
        Idle Mode = Idle
        Hybrid Mode = Acc
    ]]
    sets.idle.Pet.Engaged.Acc = set_combine(sets.idle.Pet.Engaged, {
       -- Add your set here 
	   main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
	   head="Nyame Helm",
	   body="Nyame Mail",
	   hands="Mpaca's Gloves",
	   legs="Nyame Flanchard",
	   feet="Mpaca's Boots",
    })

    --[[
        Idle Mode = Idle
        Hybrid Mode = TP
    ]]
    sets.idle.Pet.Engaged.TP = set_combine(sets.idle.Pet.Engaged, {
       -- Add your set here 
	   main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
	   head="Tali'ah Turban +2",
	   body="Pitre Tobe +1",
	   right_ear="Enmerkar Earring",
	   ring1={name="Varar Ring +1", bag="wardrobe4"},
	   ring2={name="Varar Ring +1", bag="wardrobe5"},
    })

    --[[
        Idle Mode = Idle
        Hybrid Mode = DT
    ]]
    sets.idle.Pet.Engaged.DT = set_combine(sets.idle.Pet.Engaged, {
       -- Add your set here 
	   main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},	--Pet: DT -3%
	   head={ name="Taeon Chapeau", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		legs={ name="Taeon Tights", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet={ name="Taeon Boots", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
	   --legs="Tali'ah Sera. +2",			--Pet: DT -5%
	   right_ear="Enmerkar Earring",	--Pet: DT -3%
    })

    --[[
        Idle Mode = Idle
        Hybrid Mode = Regen
    ]]
    sets.idle.Pet.Engaged.Regen = set_combine(sets.idle.Pet.Engaged, {
       -- Add your set here 
	   head={ name="Pitre Taj", augments={'Enhances "Optimization" effect',}},
	   body="Hiza. Haramaki +2",
	   neck="Empath Necklace",
	   left_ear="Burana Earring",
    })

    --[[
        Idle Mode = Idle
        Hybrid Mode = Ranged
    ]]
    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {
			--head="Mpaca's Cap",
			head="Tali'ah Turban +2",
			--body="Mpaca's Doublet",
			body="Pitre Tobe +1",
			hands="Mpaca's Gloves",
			legs="Mpaca's Hose",
			feet="Mpaca's Boots",	
            --legs = Empy_Karagoz.Legs_Combat,
			neck = "Empath Necklace",
        })

    -------------------------------------WS
    --[[
        WSNoFTP is the default weaponskill set used
    ]]
    sets.midcast.Pet.WSNoFTP = {
		--main="Sakpata's Fists",
		main="Xiucoatl",
		--ranged="Animator P +1",
        head = Empy_Karagoz.Head_PTPBonus,
		--hands = "Pitre Dastanas +1",
		hands="Mpaca's Gloves",
		back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+500',}},
       -- Add your set here
    }

    --[[
        If we have a pet weaponskill that can benefit from WSFTP
        then this set will be equipped
    ]]
    sets.midcast.Pet.WSFTP = {
		main="Xiucoatl",
        head = Empy_Karagoz.Head_PTPBonus,
		hands="Mpaca's Gloves",
		back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+500',}},
       -- Add your set here
    }

    --[[
        Base Weapon Skill Set
        Used by default if no modifier is found
    ]]
    sets.midcast.Pet.WS = {
		main="Xiucoatl",
		head = Empy_Karagoz.Head_PTPBonus,
		hands="Mpaca's Gloves",
		back={ name="Dispersal Mantle", augments={'STR+2','DEX+2','Pet: TP Bonus+500',}},
	}

    --Chimera Ripper, String Clipper
    sets.midcast.Pet.WS["STR"] = set_combine(sets.midcast.Pet.WSNoFTP, {})

    -- Bone crusher, String Shredder
    sets.midcast.Pet.WS["VIT"] =
        set_combine(
        sets.midcast.Pet.WSNoFTP,
        {
            -- Add your gear here that would be different from sets.midcast.Pet.WSNoFTP
            head = Empy_Karagoz.Head_PTPBonus
        }
    )

    -- Cannibal Blade
    sets.midcast.Pet.WS["MND"] = set_combine(sets.midcast.Pet.WSNoFTP, {})

    -- Armor Piercer, Armor Shatterer
    sets.midcast.Pet.WS["DEX"] = set_combine(sets.midcast.Pet.WSNoFTP, {})

    -- Arcuballista, Daze
    sets.midcast.Pet.WS["DEXFTP"] =
        set_combine(
        sets.midcast.Pet.WSFTP,
        {
            -- Add your gear here that would be different from sets.midcast.Pet.WSFTP
            head = Empy_Karagoz.Head_PTPBonus
        }
    )

    ---------------------------------------------
    --  __  __ _             _____      _
    -- |  \/  (_)           / ____|    | |
    -- | \  / |_ ___  ___  | (___   ___| |_ ___
    -- | |\/| | / __|/ __|  \___ \ / _ \ __/ __|
    -- | |  | | \__ \ (__   ____) |  __/ |_\__ \
    -- |_|  |_|_|___/\___| |_____/ \___|\__|___/
    ---------------------------------------------
    -- Town Set
    sets.idle.Town = {
       -- Add your set here
    }

    -- Resting sets
    sets.resting = {
       -- Add your set here
	   head="Pup. Taj",
	   waist = "Qiqirn Sash",
    }

    sets.defense.MasterDT = sets.idle.MasterDT

    sets.defense.PetDT = sets.pet.EmergencyDT

    sets.defense.PetMDT = set_combine(sets.pet.EmergencyDT, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == "WAR" then
        set_macro_page(3, 1)
    elseif player.sub_job == "NIN" then
        set_macro_page(3, 1)
    elseif player.sub_job == "DNC" then
        set_macro_page(3, 1)
    else
        set_macro_page(3, 1)
    end
end

