-------------------------------------------------------------------------------------------------------------------
--	Imports
-------------------------------------------------------------------------------------------------------------------
include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
--	Gear Sets
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
--[[ JSE Capes ]]--
	gear.aMABCape = {name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Mag.Atk.Bns."+10',}}
	gear.snapCape = {name="Camulus's Mantle", augments={'Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Mag. Evasion+15',}}
	gear.ratkCape = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.mdpsCape = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Dual Wield"+10','Damage taken-5%',}}
	gear.aWSDCape = {name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.sWSDCape = {name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

--[[ Rostam ]]--
	gear.rostamSTP = {name="Rostam", augments={'Path: A',}}
	gear.rostamRoll = {name="Rostam", augments={'Path: C',}}	

--[[ Bullets ]]--
	gear.RAbullet = "Devastating Bullet"
	gear.RAccbullet = "Devastating Bullet"
	gear.WSbullet = "Chrono Bullet"
	gear.MAbullet = "Living Bullet"
	gear.QDbullet = "Hauksbok Bullet"

--[[ Melee Sets ]]--
	sets.baseMelee = {
		ammo="Devastating Bullet",
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet="Herculean Boots",
		neck="Iskur Gorget",
		ear1="Telos Earring",-- Upgrade to ear1="Cessance Earring",
		ear2="Suppanomimi",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back=gear.mdpsCape,
		waist="Windbuffet Belt +1", 
	}
	sets.meleeAcc = set_combine(sets.baseMelee, {
		neck="Clotharius Torque",
		ring2="Ilabrat Ring",
		ear2="Odr Earring",
	})
	sets.meleeHybrid = set_combine(sets.baseMelee, {
		head="Malignance Chapeau",
		body="Nyame Mail", -- Upgrade to body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Nyame Sollerets", -- Upgrade to feet="Malignance Boots",
		ring1="Defending Ring",
	})
	sets.meleeSW = {
		ammo="Devastating Bullet",
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet="Herculean Boots",
		neck="Iskur Gorget",
		ear1="Telos Earring",
		ear2="Brutal Earring",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back=gear.mdpsCape,
		waist="Windbuffet Belt +1",    
	}

--[[ Ranged Sets ]]--
	sets.precast.RA = {
		ammo=gear.RAbullet,
		head="Chasseur's Tricorne +2",
		neck="Comm. Charm +2",
		body="Laksamana's Frac +3", --body="Oshosi Vest +1",         
		hands="Lanun Gants +3",      
		legs="Chasseur's Culottes +2", --legs=gear.Adhemar_D_legs, 
		feet="Meg. Jam. +2",            
		back=gear.snapCape, 
		-- waist="Yemaya Belt", -- Upgrade to Yemaya Belt
	}
	sets.midcast.RA = {
		ammo=gear.RAbullet,
		head="Malignance Chapeau",
		body="Meg. Cuirie +2", -- Upgrade to body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Meg. Jam. +2", -- Upgrade to feet="Malignance Boots",
		neck="Iskur Gorget",
		ear1="Enervating Earring",
		ear2="Telos Earring",
		ring1="Dingir Ring",
		ring2="Ilabrat Ring",
		back=gear.ratkCape,
		waist="Aquiline Belt",-- Upgrade to waist="Yemaya Belt",
	}
	sets.midcast.RA.Critical = set_combine(sets.midcast.RA, {
		head="Meghanada Visor +2",
		body="Mummu Jacket +2",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		-- Upgrade to feet="Osh. Leggings +1",
		-- Upgrade to ring1="Begrudging Ring",
		ring2="Mummu Ring",
		-- Upgrade to waist="K. Kachina Belt +1",
	})
	sets.precast.RA.Flurry1 = set_combine(sets.precast.RA, {
		body="Lanun Frac +3",
	})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA.Flurry1, {
		hands="Carmine Fin. Ga. +1",
		feet="Pursuer's Gaiters", 
	})
	sets.TripleShot = set_combine(sets.midcast.RA, {
		-- Upgrade to head="Oshosi Mask +1", --5
		body="Chasseur's Frac +3",
		hands="Lanun Gants +3",
		-- Upgrade to legs="Osh. Trousers +1", --6
		-- Upgrade to feet="Osh. Leggings +1", --3
	})

--[[ WS Sets ]]--
	-- Base WS will be for any WS a set isn't defined for -- only very strange WSes
	sets.baseWS = { 
		ammo=gear.WSbullet,
		head="Lanun Tricorne +3",
		body="Laksa. Frac +3", 
		hands="Chasseur's Gants +3",
		legs="Meg. Chausses +2", 
		feet="Lanun Bottes +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ring1="Dingir Ring",
		ring2="Rajas Ring",
		back=gear.sWSDCape,
		waist="Fotia Belt",
	}
	-- Wildfire (& Hot Shot) [Magical;AGI]
	sets.precast.WS['Wildfire'] = {
		ammo=gear.MAbullet,
		head="Herculean Helm",
		body="Lanun Frac +3",
		hands="Chasseur's Gants +3",
		legs="Herculean Trousers",
		feet="Lanun Bottes +3", 
		neck="Comm. Charm +2",
		ear1="Novio Earring", -- Upgrade to "Crematio Earring",
		ear2="Friomisi Earring", 
		ring1="Dingir Ring",
		ring2="Epaminondas's Ring",
		back=gear.aWSDCape,
		waist="Eschan Stone", -- Upgrade to "Skrymir Cord +1",
	}
	sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
	-- Leaden Salute [Magical;AGI]
	sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {
		ammo=gear.MAbullet,
		head="Pixie Hairpin +1",
		ear1="Moonshade Earring",            
		ring1="Dingir Ring",
		ring2="Archon Ring",
		waist="Eschan Stone",
	})
	-- Last Stand [Physical;AGI]
	sets.precast.WS['Last Stand'] = {
		ammo=gear.WSbullet,
		head="Lanun Tricorne +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Laksa. Frac +3",
		hands="Chasseur's Gants +3",
		ring1="Apate Ring",
		ring2="Epaminondas's Ring",
		back=gear.aWSDCape,
		waist="Fotia Belt",
		legs="Meg. Chausses +2",
		feet="Lanun Bottes +3",
	}
	-- Savage Blade [Physical;STR]
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {		
		head="Lanun Tricorne +3", -- Upgrade to Herculean STR/Att/Acc/WSD
		hands="Chasseur's Gants +3",
		neck="Rep. Plat. Medal",
		body="Laksamana's Frac +3",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ring1="Sroda Ring",
		ring2="Epaminondas's Ring",
		back=gear.sWSDCape,
		waist="Sailfi Belt +1",
		legs="Herculean Trousers", -- Upgrade to Herculean STR/Att/Acc/WSD
		feet="Lanun Bottes +3",
	})
	-- Evisceration [Physical;DEX]
	sets.precast.WS['Evisceration'] = {
		head="Adhemar Bonnet +1",
		body="Meg. Cuirie +2",-- Upgrade to body="Abnoba Kaftan",
		hands="Chasseur's Gants +3",
		legs="Samnuha Tights",-- Upgrade to legs="Zoar Subligar +1" or Herculean
		feet="Mummu Gamash. +2",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Odr Earring",
		ring1="Ilabrat Ring", -- Upgrade to ring1="Regal Ring",
		ring2="Mummu Ring",
		back=gear.mdpsCape,
		waist="Fotia Belt",
	}
	-- Aeolian Edge [Magical;DEX/INT]
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Wildfire'], {
		ammo=gear.QDbullet,
		ear1="Moonshade Earring",
		waist="Hachirin-no-Obi",
		--waist="Orpheus's Sash",
	})
	-- Circle Blade (TH)
	sets.precast.WS['Circle Blade'] = set_combine(sets.precast.WS['Savage Blade'], {
		head="White Rarab Cap +1",
		waist="Chaac Belt",
	})

--[[ COR Sets ]]--
	-- Phantom Roll
	sets.precast.CorsairRoll = {
		head="Lanun Tricorne +3",
		neck="Regal Necklace",
		hands="Chasseur's Gants +3",
		ring1="Barataria Ring",
		ring2="Luzaf's Ring",
		back=gear.snapCape,
	}

	sets.precast.CorsairRoll.Full = set_combine(sets.precast.CorsairRoll, {
		main=gear.rostamRoll,
		ranged="Compensator",
	})

	-- QD (DMG)
	sets.midcast.CorsairShot = {
		ammo=gear.QDbullet,
		head="Herculean Helm", 
		body="Lanun Frac +3",
		hands="Carmine Fin. Ga. +1",
		legs="Herculean Trousers",
		feet="Lanun Bottes +3",
		neck="Stoicheion Medal", -- Upgrade to neck="Baetyl Pendant",
		ear1="Novio Earring", -- Upgrade to "Crematio Earring",
		ear2="Friomisi Earring",
		ring1="Dingir Ring",
		ring2="Fenrir Ring +1",
		back=gear.aMABCape,
		waist="Eschan Stone", -- Upgrade to waist="Skrymir Cord +1",
		neck="Comm. Charm +2",
	}

	-- QD (Light/Dark Shot)
	sets.midcast.CorsairShot.Acc = {
		ammo=gear.QDbullet,
		head="Laksa. Tricorne +3",
		body="Meg. Cuirie +2", -- Upgrade to body="Malignance Tabard",
		hands="Laksa. Gants +2", -- Upgrade to hands="Laksa. Gants +3",
		legs="Malignance Tights",
		feet="Chasseur's Bottes +2", -- Upgrade to feet="Laksa. Bottes +3",
		neck="Comm. Charm +2",
		ear1="Novio Earring",  -- Upgrade to ear1="Enchntr. Earring +1",
		ear2="Friomisi Earring", -- Upgrade to ear2="Digni. Earring",
		ring1="Arvina Ringlet", -- Upgrade to ring1="Regal Ring",
		ring2="Mummu Ring", -- Upgrade to ring2="Weather. Ring +1",
		back=gear.aMABCape,
		waist="Sveltesse Gouriz +1", -- Upgrade to waist="K. Kachina Belt +1",
	}

	-- QD (STP)
	sets.midcast.CorsairShot.STP = {
		ammo=gear.QDbullet,
		head="Malignance Chapeau",
		body="Ikenga's Vest",-- Upgrade to body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Chasseur's Culottes +2",
		feet="Ikenga's Clogs", -- Upgrade to feet="Malignance Boots",
		neck="Iskur Gorget",
		ear1="Enervating Earring", -- Upgrade to ear1="Dedition Earring",
		ear2="Telos Earring",
		ring1="Ilabrat Ring", -- Upgrade to ring1={name="Chirich Ring +1", bag="wardrobe3"},
		ring2="Petrov Ring", -- Upgrade to ring2={name="Chirich Ring +1", bag="wardrobe4"},
		back=gear.ratkCape,
		waist="Kentarch Belt", -- Upgrade to waist="Kentarch Belt +1",
	}

	sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +3"}
	sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
	sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}

	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chasseur's Culottes +2"})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +2"})
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne +2"})
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +3"})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3"})
	sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"} 

--[[ Utility Sets ]]--
	-- Fast Cast
	sets.precast.FC = {
		-- Upgrade to head="Carmine Mask +1",
		-- Upgrade to neck="Orunmila's Torque",
		-- Upgrade to ear1="Enchntr. Earring +1",
		-- Upgrade to ear2="Loquacious Earring",
		-- Upgrade to body="Taeon Tabard" -- FC Aug
		-- Upgrade to hands="Leyline Gloves"
		-- Upgrade to ring1="Rahab Ring"
		ring2="Kishar Ring"
		-- Upgrade to back= JSE Factcast Cape
		-- Upgrade to legs="Herculean Trousers" -- FC Aug
		-- Upgrade to feet="Carmine Greaves +1"
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

	-- TH
	sets.TreasureHunter = {head="White Rarab Cap +1", waist="Chaac Belt", "Herculean Vest",} -- Upgrade to whatever TH we can find
	sets.precast.JA['Box Step'] = sets.TreasureHunter

	-- Waltz
	sets.Waltz = {
		head="Laksamana's Tricorne +3",
		body="Passion Jacket",
		hands="Regal Gloves",
		waist="Aristo Belt",
		feet="Lanun Bottes +3",
	}

	-- Obi
	sets.Obi = {waist="Hachirin-no-Obi"}

	-- Ammo that should never be shot
	no_shoot_ammo = S{"Animikii Bullet", "Hauksbok Bullet"}

	-- Idle
	sets.baseIdle = {
		ammo=gear.RAbullet,
		head="Malignance Chapeau",
		body="Nyame Mail", -- Upgrade to body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Carmine Cuisses +1",
		feet="Nyame Sollerets", -- Upgrade to feet="Malignance Boots",
		neck="Twilight Torque",-- Upgrade to neck="Bathy Choker +1", 
		-- Upgrade to ear1="Sanare Earring",
		ear1="Novia Earring",
		ear2="Eabani Earring",
		ring1="Paguroidea Ring",
		ring2="Defending Ring",
		-- Upgrade to ring2={name="Chirich Ring +1", bag="wardrobe4"},
		back=gear.snapCape,
		waist="Flume Belt +1",
	}

	sets.moveSpeed = {legs="Carmine Cuisses +1",}
end

-------------------------------------------------------------------------------------------------------------------
-- Modes
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=(sets.baseIdle), engaged=(sets.baseMelee), color="\\cs(250,128,114)"},
		[1] = {name="DPS-Acc", idle=(sets.baseIdle), engaged=(sets.meleeAcc), color="\\cs(50,205,50)"},
		[2] = {name="DPS-Hybrid", idle=(sets.baseIdle), engaged=(sets.meleeHybrid), color="\\cs(0,191,255)"},
		[3] = {name="SingleWield", idle=(sets.baseIdle), engaged=(sets.SW), color="\\cs(218,165,32)"},
	}
	if not player.sub_job == 'NIN' and not player.sub_job == 'DNC' then
		gearMode.index = 3
	end

	weaponMode = {
		["index"] = 0,
		[0] = {name="Naegling-Gleti", set={main="Naegling", sub="Gleti's Knife"}, color="\\cs(250,128,114)"},
		[1] = {name="Rostam-Tauret",set={main=gear.rostamSTP, sub="Tauret"}, color="\\cs(238,130,238)"},
		[2] = {name="Naegling-Shield", set={main="Naegling", sub="Nusku Shield"}, color="\\cs(218,165,32)"}, 		
		[3] = {name="LowDMG-Dagger", set={main="Qutrub Knife", sub="Extinction"}, color="\\cs(218,165,32)"},
		[4] = {name="LowDMG-Sword", set={main="Nihility", sub="Extinction"}, color="\\cs(218,165,32)"},       
	}
	if not player.sub_job == 'NIN' and not player.sub_job == 'DNC' then
		weaponMode.index = 3
	end

	gunMode = {
		["index"] = 0,
		[0] = {name="Ataktos", set={ranged="Ataktos"}, color="\\cs(218,165,32)"},
        [1] = {name="Death Penalty", set={ranged="Death Penalty"}, color="\\cs(0,191,255)"},  
		[2] = {name="Armageddon", set={ranged="Armageddon"}, color="\\cs(250,128,114)"}, 
		[3] = {name="Fomalhaut", set={ranged="Fomalhaut"}, color="\\cs(135,206,250)"}, 
		[4] = {name="Prime", set={ranged="Prime Gun"}, color="\\cs(240,230,140)"}, 
		--TODO: Low Dmg Gun 
	}	 

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

	--[[ COR Specific ]]--
	-- Quick Draw Mode includes only base elements -- Light and Dark shots are expected to be their own macros
	-- Add macro with /console gs c useQD
	-- Requires shortcuts addon
    qdMode = {
        ["index"] = 0,
        [0] = {qd="Fire Shot", command="/fireshot", msg="QD Mode: Fire Shot", color="\\cs(250,128,114)"}, -- salmon
        [1] = {qd="Water Shot", command="/watershot", msg="QD Mode: Water Shot", color="\\cs(0,191,255)"}, -- deepskyblue
        [2] = {qd="Thunder Shot", command="/thundershot", msg="QD Mode: Thunder Shot", color="\\cs(238,130,238)"}, -- violet
        [3] = {qd="Earth Shot", command="/earthshot", msg="QD Mode: Earth Shot", color="\\cs(218,165,32)"}, -- goldenrod    
		[4] = {qd="Wind Shot", command="/windshot", msg="QD Mode: Wind Shot", color="\\cs(50,205,50)"}, -- lime 
		[5] = {qd="Ice Shot", command="/iceshot", msg="QD Mode: Ice Shot", color="\\cs(224,255,255)"}, -- lightcyan   
    }

	-- Shot Mode determines which QD set to use
	-- Ataktos will AUTOMATICALLY use the Store TP set for elemental QDs
	shotMode = {
		["index"] = 0,
		[0] = {shot="DMG", msg="Shot Mode: DMG" , color="\\cs(250,128,114)"}, -- salmon
		[1] = {shot="Acc", msg="Shot Mode: Acc", color="\\cs(50,205,50)"}, -- lime 
		[2] = {shot="STP", msg="Shot Mode: Store TP", color="\\cs(218,165,32)"},  -- goldenrod 
	}

	-- Roll Mode allows for prevention of TP wipe when re-applying COR rolls by NOT swapping weapons to Rostam/Compensator when in 'Lock' mode
	rollMode = {
		["index"] = 0,
		[0] = {roll="Full", msg="Roll Mode: Full", set=sets.precast.CorsairRoll.Full, color="\\cs(0,191,255)"}, -- deepskyblue
		[1] = {roll="Lock", msg="Roll Mode: Lock", set=sets.precast.CorairRoll, color="\\cs(250,128,114)"}, -- salmon
	}

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: Tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
	rolls = {
		["Corsair's Roll"] =    {lucky=5, unlucky=9, bonus="Experience Points"},
		["Ninja Roll"] =        {lucky=4, unlucky=8, bonus="Evasion"},
		["Hunter's Roll"] =     {lucky=4, unlucky=8, bonus="Accuracy"},
		["Chaos Roll"] =        {lucky=4, unlucky=8, bonus="Attack"},
		["Magus's Roll"] =      {lucky=2, unlucky=6, bonus="Magic Defense"},
		["Healer's Roll"] =     {lucky=3, unlucky=7, bonus="Cure Potency Received"},
		["Drachen Roll"] =      {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
		["Choral Roll"] =       {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
		["Monk's Roll"] =       {lucky=3, unlucky=7, bonus="Subtle Blow"},
		["Beast Roll"] =        {lucky=4, unlucky=8, bonus="Pet Attack"},
		["Samurai Roll"] =      {lucky=2, unlucky=6, bonus="Store TP"},
		["Evoker's Roll"] =     {lucky=5, unlucky=9, bonus="Refresh"},
		["Rogue's Roll"] =      {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
		["Warlock's Roll"] =    {lucky=4, unlucky=8, bonus="Magic Accuracy"},
		["Fighter's Roll"] =    {lucky=5, unlucky=9, bonus="Double Attack Rate"},
		["Puppet Roll"] =       {lucky=3, unlucky=7, bonus="Pet Magic Attack/Accuracy"},
		["Gallant's Roll"] =    {lucky=3, unlucky=7, bonus="Defense"},
		["Wizard's Roll"] =     {lucky=5, unlucky=9, bonus="Magic Attack"},
		["Dancer's Roll"] =     {lucky=3, unlucky=7, bonus="Regen"},
		["Scholar's Roll"] =    {lucky=2, unlucky=6, bonus="Conserve MP"},
		["Naturalist's Roll"] = {lucky=3, unlucky=7, bonus="Enh. Magic Duration"},
		["Runeist's Roll"] =    {lucky=4, unlucky=8, bonus="Magic Evasion"},
		["Bolter's Roll"] =     {lucky=3, unlucky=9, bonus="Movement Speed"},
		["Caster's Roll"] =     {lucky=2, unlucky=7, bonus="Fast Cast"},
		["Courser's Roll"] =    {lucky=3, unlucky=9, bonus="Snapshot"},
		["Blitzer's Roll"] =    {lucky=4, unlucky=9, bonus="Attack Delay"},
		["Tactician's Roll"] =  {lucky=5, unlucky=8, bonus="Regain"},
		["Allies' Roll"] =      {lucky=3, unlucky=10, bonus="Skillchain Damage"},
		["Miser's Roll"] =      {lucky=5, unlucky=7, bonus="Save TP"},
		["Companion's Roll"] =  {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
		["Avenger's Roll"] =    {lucky=4, unlucky=8, bonus="Counter Rate"},
	}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	-- Setup my binds
    send_command('bind @q gs c cycleQD')	
	send_command('bind @w gs c cycleRollMode')
	send_command('bind @e gs c cycleShotMode')
	send_command('bind @r gs c cycleGunMode')

	-- Set default macro book / page
    set_macro_page(1, 4)
	
	-- Load addons
	windower.send_command('lua load rolltracker')

	-- Set style lock
	windower.send_command:schedule(4, 'input /lockstyleset 7')	
end

function extendedUserUnload()
    send_command('unbind @q')
	send_command('unbind @w')
	send_command('unbind @e')
	send_command('unbind @r')
	send_command('lua u rolltracker')
end

-------------------------------------------------------------------------------------------------------------------
-- Special Utility Functions
-------------------------------------------------------------------------------------------------------------------
function bulletCountCheck(spell, spellMap, eventArgs)
    local bullet_name
	local bullet_min_count = 1
    
	if spell.type == 'WeaponSkill' then
		if spell.skill == "Marksmanship" then
			if spell.english == 'Wildfire' or spell.english == 'Leaden Salute' or spell.english == 'Hot Shot' then
				-- Magic WSes
				bullet_name = gear.MAbullet
			else
				-- Physical WSes
				bullet_name = gear.WSbullet
			end
		else
			-- Ignore non-ranged weaponskills
			return
		end
	elseif spell.type == 'CorsairShot' then
		bullet_name = gear.QDbullet
	elseif spell.action_type == 'Ranged Attack' then
		bullet_name = gear.RAbullet
		if buffactive['Triple Shot'] then
			bullet_min_count = 3
		end
	end
    
	local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
    
	-- If no ammo is available, give appropriate warning and end.
	if not available_bullets then
		if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
			add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
			return
		elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
			add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
			return
		else
			add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
			eventArgs.cancel = true
			return
		end
	end
    
	-- Low ammo warning.
	if spell.type ~= 'CorsairShot' and available_bullets.count > 1 and available_bullets.count < 10 then
		local msg = '~~  Low Ammo Warning: ['..bullet_name..'] ~~'
		add_to_chat(104, msg)
	end
end

function specialBulletCheck()
	if no_shoot_ammo:contains(player.equipment.ammo) then
		cancel_spell()
		add_to_chat(123, '!! Action Canceled: [ '.. player.equipment.ammo .. '] equipped !!')
		return
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)	
	-- Check that proper ammo is available if we're using ranged attacks or similar.
	if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
		bulletCountCheck(spell, spellMap, eventArgs)
	end

	-- Equip proper gear for Fold
	if spell.english == 'Fold' and buffactive['Bust'] == 2 then
		if sets.precast.FoldDoubleBust then
			equip(sets.precast.FoldDoubleBust)
			eventArgs.handled = true
		end
	end

	-- Handle equipping appropriate roll set depending on selected rollMode
	if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and rollMode[rollMode.index].roll == "Full" then
		equip(sets.precast.CorsairRoll.Full)
	elseif (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and rollMode[rollMode.index].roll == "Lock" then
		equip(sets.precast.CorsairRoll)
	end

	-- Handle Flurry set for ranged attacks
	if spell.action_type == 'Ranged Attack' then		
		if buffIdActive(265) then
			equip(sets.precast.RA.Flurry1)			
		elseif buffIdActive(581) then
			equip(sets.precast.RA.Flurry2)			
		end
	-- Special Quickdraw rules and modes
	elseif spell.type == 'CorsairShot' then
		if spell.english == 'Light Shot' or spell.english == 'Dark Shot' then
			equip(sets.midcast.CorsairShot.Acc)
		elseif player.equipment.range == "Ataktos" then
			equip(sets.midcast.CorsairShot.STP)
		elseif shotMode[shotMode.index].shot == 'DMG' then
			equip(sets.midcast.CorsairShot)
		elseif shotMode[shotMode.index].shot == 'Acc' then
			equip(sets.midcast.CorsairShot.Acc)
		elseif shotMode[shotMode.index].shot == 'STP' then
			equip(sets.midcast.CorsairShot.STP)
		end
	end

	specialBulletCheck()
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)

end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
	-- Triple Shot and Empyrean AM3 rules
	-- These sets all involve overlap pieces (e.g. body RA=Meghanada/Malignance, Crit=Mummu, Triple=Empy)
	if spell.action_type == 'Ranged Attack' then
		if buffactive['Aftermath: Lv.3'] and player.equipment.ranged == "Armageddon" then
			equip(sets.midcast.RA.Critical)
		end
		if buffactive['Triple Shot'] then
			equip(sets.TripleShot)
		end
	end

	-- Obis for QD and WS
	if spell.type == 'CorsairShot' then
		if (spell.english ~= 'Light Shot' and spell.english ~= 'Dark Shot') then
			if(dayWeatherIntensity(spell.element)) > 0 then
				equip({waist="Hachirin-no-Obi"})
			end
		end
	elseif spell.type == 'WeaponSkill' then
		if spell.name == "Leaden Salute" or spell.name == "Wildfire" or spell.name == "Hot Shot" or spell.name == "Aeolian Edge" then
			if(dayWeatherIntensity(spell.element)) > 0 then
				equip({waist="Hachirin-no-Obi"})
			end
		end
	end
end

function extendedJobAftercast(spell, action, spellMap, eventArgs)
	-- Put RA bullet back on after whatever just happened
	equip({ammo=gear.RAbullet})	

	-- Put weapons/gun back on if we just rolled
	if (spell.type == 'CorsairRoll' or spell.english == "Double-Up")  and rollMode[rollMode.index].roll == "Full" then
		equip(weaponMode[weaponMode.index].set)
		equip(gunMode[gunMode.index].set)
	end
end

--[[ To prevent having more listeners, this is excluded, which means we're assuming if you're shooting that you have Flurry and not Haste, and that it's Flurry II
windower.register_event('action',
	function(act)
		local actionTargets = act.targets
		playerId = windower.ffxi.get_player().id
		isTarget = false
		for _, target in ipairs(actionTargets) do
			if playerId == target.id then
				isTarget = true
			end
		end
		if isTarget == true then
			if act.category == 4 then
				local param = act.param
				if param == 845 and flurry ~= 2 then
					--add_to_chat(122, 'Flurry Status: Flurry I')
					flurry = 1
				elseif param == 846 then
					--add_to_chat(122, 'Flurry Status: Flurry II')
					flurry = 2
				end
			end
		end
	end
)
]]--

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
	if buff == "Doom" then
		if active then
			send_command('input /p "Doomed, pls halp!')
			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
			disable('ring1','waist')
		else
			send_command('input /p "I am saved! ...or Doom killed me?')
			enable('ring1','waist')
			evalState_equipGear()
		end
	end
end

function extendedTWM(cmdParams, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- User Interaction
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)	
	--[[ Spike health for Omen healing objective ]]--
	if cmdParams[1] == 'spikehealth' then
		equip(sets.naked)
	end

    --[[ Cycle COR-specific modes ]]--
    if cmdParams[1] == 'cycleQD' then
        qdMode.index = qdMode.index + 1
        if qdMode.index > #qdMode then
            qdMode.index = 0
        end
        windower.add_to_chat(122,'[Quick Draw: '..qdMode[qdMode.index].qd..' -- '..qdMode[qdMode.index].msg..']')
    end
    if cmdParams[1] == 'useQD' then
        windower.send_command(qdMode[qdMode.index].command)
    end

	if cmdParams[1] == 'cycleRollMode' then
        rollMode.index = rollMode.index + 1
        if rollMode.index > #rollMode then
            rollMode.index = 0
        end
        windower.add_to_chat(122,'[Roll Mode: '..rollMode[rollMode.index].roll..' -- '..rollMode[rollMode.index].msg..']')
    end

	if cmdParams[1] == 'cycleShotMode' then
        shotMode.index = shotMode.index + 1
        if shotMode.index > #shotMode then
            shotMode.index = 0
        end
        windower.add_to_chat(122,'[Shot Mode: '..shotMode[shotMode.index].shot..' -- '..shotMode[shotMode.index].msg..']')
    end

	if cmdParams[1] == 'cycleGunMode' then
        gunMode.index = gunMode.index + 1
        if gunMode.index > #gunMode then
            gunMode.index = 0
        end
        windower.add_to_chat(122,'[Gun Mode: '..gunMode[gunMode.index].name..']')
		equip(gunMode[gunMode.index].set)
    end

    modeHud('update')
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
	--[[ Show COR-Specific modes on HUD ]]--
    hudText:append(white..'Quick Draw [Q]: '..qdMode[qdMode.index].color..qdMode[qdMode.index].qd..white)    
	hudText:append(white..'Roll Mode [W]: '..rollMode[rollMode.index].color..rollMode[rollMode.index].roll..white)    
	hudText:append(white..'Shot Mode [E]: '..shotMode[shotMode.index].color..shotMode[shotMode.index].shot..white)
	hudText:append(white..'Gun Mode [R]: '..gunMode[gunMode.index].color..gunMode[gunMode.index].name..white)
	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()    
    local me = windower.ffxi.get_player()    

	--[[ COR JAs ]]--
	local wildCardRecast = abilRecast[0]
	local quickDrawRecast = abilRecast[199]
	local cuttingCardsRecast = abilRecast[254]
	local tripleShotRecast = abilRecast[84]
	local randomDealRecast = abilRecast[196]
	-- Phantom Roll, Double Up, Snake Eye, and Crooked Cards are all handled by AutoCOR
	--[[ /DNC JAs ]]--
	local contradanceRecast = abilRecast[229]
	local waltz3Recast = abilRecast[187]
	local sambaRecast = abilRecast[216]
    
    -- Autobuff (Samba)
    if (auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving and me.status == 1 and player.sub_job == 'DNC' and player.tp >= 350 and not buffactive['Haste Samba']) then
		add_to_chat(122, '[Haste Samba]')
		send_command('/haste samba')
		return
    end

    -- Autofite (Cure & 1-hr)
    if (auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
        -- Auto Cure (with Contradance if available)
        if (player.tp >= 200 and curingWaltzRecast == 0 and partyLowHP(50)) then
			if contradanceRecast == 0 then
				send_command('/contradance')
				send_command:schedule(0.5, partyLowHP(30,'curingwaltz3'))
            else
				partyLowHP(30,'curingwaltz3')
			end
        end

		if (player.tp >= 200 and curingWaltzRecast == 0) then
            for _, data in pairs(windower.ffxi.get_party()) do
                if type(data) == 'table' and data.mob then
                    local pInfo = data.mob
                    if pInfo.hpp > 0 and pInfo.hpp < 40 then
						if contradanceRecast == 0 then
							send_command('/contradance')
							send_command:schedule(0.5, '/curingwaltz3 '..pInfo.id)
							add_to_chat(122, pInfo.name..' is under 40% - ContraWaltz!')
						else
							send_command('/curingwaltz3 '..pInfo.id)
							add_to_chat(122, pInfo.name..' is under 40% - Waltz!')
						end
                        return
                    end
                end
            end
        end

		-- Auto QD (?)
		-- Auto Triple shot (?)

		-- Auto Random Deal (use if Wild Card is not up soon and was not just used)
		if randomDealRecast == 0 and wildCardRecast > 180 and wildCardRecast < 2600 then
			add_to_chat(122, '[~ Random Deal ~]')
            send_command('/randomdeal')
            return
		end
        
        -- Auto 1-hr
        if wildCardRecast == 0 then
            add_to_chat(122, '[! Wild Card !]')
            send_command('/wildcard')
            return
        end
        if cuttingCardsRecast == 0 and wildCardRecast > 2200 and wildCardRecast < 2600 then
            add_to_chat(122, '[! Cutting Cards !]')
            send_command('/cuttingcards <p3>')
            return
        end

        if not buffactive['Food'] then
            send_command('input /item "Dragon Steak" <me>')
            return
        end 
    end
end