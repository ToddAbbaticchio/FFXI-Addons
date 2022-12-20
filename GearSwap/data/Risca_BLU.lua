include('RST\\sharedFunctions.lua')

function get_sets()
	mote_include_version = 2
	include('Mote-Include.lua')
	init_modetables()
end

-- Set up gear sets.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	--Define augmented gear
	gear.IntCape = {name="Rosmerta's Cape", augments={'INT + 20'}}
	gear.TpCape = {name="Rosmerta's Cape", augments={'DEX + 20'}}
	gear.WsCape = {name="Rosmerta's Cape", augments={'STR + 20'}}
	gear.hercWsBoots = {name="Herculean Boots", augments={'Weapon skill damage +4%'}}
	gear.hercTpBoots = {name="Herculean Boots", augments={'"Triple Atk."+4'}}
	
	--Define Base Sets for use in other sets
	sets.baseMelee = {
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		legs="Samnuha Tights",
		feet=gear.hercTpBoots,
		neck="Mirage Stole +2",
		waist="Sailfi Belt +1",
		ear1="Suppanomimi",
		ear2="Dedition Earring",
		ring1="Chirich Ring +1",
		ring2="Ilabrat Ring",
		back=gear.TpCape,
	}
	sets.baseMagic = {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +3",
		body="Hashishin Mintan +3",
		hands="Amalric Gages +1",  
		legs="Luhlaza Shalwar +3",
		feet="Hashishin Basmak +3",
		neck="Sibyl Scarf",
		waist="Yamabuki-no-obi",
		ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		ring1="Shiva Ring +1",
		ring2="Shiva Ring +1",
		back=gear.IntCape,
	}

	sets.magic = {}
	sets.magic.nuke = {}
	sets.magic.acc = {}
	sets.magic.bluSkill = {
		head="Mirage Keffiyeh +1",
		body="Assim. Jubbah +3",
		--hands="",
		legs="Hashishin Tayt +2",
		--feet="",
		neck="Mirage Stole +2",
		--waist="",
		--ear1="",
		ear2="Hashishin Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		--back="Cornflower Cape",
	}

	sets.precast.FC = {
		ammo = "Impatiens",
		head = "Pinga Crown",
		body = "Pinga Tunic",
		legs = "Aya. Cosciales +2",
		hands = "Pinga Mittens",
		feet = "Carmine Greaves +1",
		neck = "Orunmila's Torque",
		waist = "Witful Belt",
		right_ear = "Loquac. Earring",
		left_ring = "Jhakri Ring",
		back = "Swith Cape"
	}
	sets.baseTank = {
		ammo="Ginsen",
		head="Malignance Chapeau",        --06
		body="Hashishin Mintan +3",
		hands="Malignance Gloves",        --05
		legs="Malignance Tights",         --07
		feet="Malignance Boots",           --07
		neck="Mirage Stole +2",
		waist="Sailfi Belt +1",
		ear1="Suppanomimi",
		ear2="Hashishin Earring",
		ring1="Chirich Ring +1",
		ring2="Ilabrat Ring",
		back=gear.TpCape,                --05
	}
	sets.evaTank = {
		ammo="Amar Cluster",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Combatant's Torque",
		waist="Kasiri Belt",
		ear1="Eabani Earring",
		ear2="Infused Earring",
		ring1="Vengeful Ring",
		ring2="Ilabrat Ring",
		back=gear.WsCape,
	}
    sets.precast.WS = {
		ammo="Oshasha's Treatise",
		head="Hashishin Kavuk +3",
		body="Assim. Jubbah +3",
		legs="Luhlaza Shalwar +3",
		hands="Jhakri Cuffs +2",
		feet=gear.hercWsBoots,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		ring1="Karieyh Ring +1",
		ring2="Epaminondas's Ring",
		back=gear.WsCape,
	}
	
	sets.baseIdle = {body="Hashishin Mintan +3", ring1="Karieyh Ring +1", ring2="Defending Ring", neck="Sibyl Scarf"}
	sets.moveSpeed = {legs="Carmine Cuisses +1"}
	sets.TH = {waist='Chaac Belt', head='Wh. Rarab Cap +1', ammo='Per. Lucky Egg', hands="Herculean Gloves"}
	sets.obi = {waist="Hachirin-no-Obi"}
	sets.oSash = {waist="Orpheus's Sash"}
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +3"})
	
	--Define Job Ability sets														-- I'd use these if i cared enough to get them:
    sets.buff['Burst Affinity'] = {feet="Hashishin Basmak +3"}
    sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +3"} 						--Assimilator's Charuqs
    sets.buff['Convergence'] = {} 													--Luhlaza Keffiyeh
    sets.buff['Diffusion'] = {feet="Luhlaza Charuqs +1"}
    sets.buff['Enchainment'] = {} 													--Luhlaza Jubbah
    sets.buff['Efflux'] = {legs="Hashishin Tayt +2", gear.WsCape,}
    sets.precast.JA['Azure Lore'] = {} 												--Mirage Bazubands +2
	sets.precast.JA['Provoke'] = sets.TH

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Weaponskill sets
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ear1="Ishvara Earring", neck="Mirage Stole +2", waist="Sailfi Belt +1"})
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.baseMagic, {waist="Fotia Belt",neck="Fotia Gorget",ring2="Jhakri Ring",})
	sets.precast.WS['Flat Blade'] = equip(sets.baseMelee)

    -- Midcast Sets
    sets.midcast['Blue Magic'] = {}
	sets.midcast['Elemental Magic'] = sets.baseMagic
	sets.midcast['Battery Charge'] = {waist="Gishdubar Sash"}
    
    -- Physical Spells --
    sets.midcast['Blue Magic'].Physical = set_combine(sets.precast.WS, {body="Assim. Jubbah +3",neck="Mirage Stole +2",waist="Eschan Stone"})
    sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {left_ring="Ifrit Ring",right_ear="Kuwunga Earring",left_ear="Corybant Pearl",})
    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {left_ring="Thundersoul Ring",left_ear="Ilabrat Ring",right_ear="Odr Earring",head="Malignance Chapeau",hands="Malignance Gloves"})
    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})

    -- Magical Spells --
    sets.midcast['Blue Magic'].Magical = set_combine(sets.baseMagic, {})
    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical, {waist="Yamabuki-no-Obi",neck="Incanter's Torque",head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Malignance Tights",feet="Malignance Boots",ring1="Stikini Ring +1",ring2="Stikini Ring +1"})

    -- Breath Spells --
    sets.midcast['Blue Magic'].Breath = {}

    -- Other --
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {})
    sets.midcast['Blue Magic']['White Wind'] = {}
    sets.midcast['Blue Magic'].Healing = set_combine(sets.baseMagic, {head="Pinga Crown",hands="Pinga Mittens",body="Pinga Tunic",feet="Pinga Pumps"})
    sets.midcast['Blue Magic'].SkillBasedBuff = set_combine(sets.baseMagic, {body="Assim. Jubbah +3",legs="Hashishin Tayt +2",head="Mirage Keffiyeh +1",neck="Mirage Stole +2",})
    sets.midcast['Blue Magic'].Buff = {}
	sets.midcast['Blue Magic'].Enmity = {}
    
    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {hands="Assim. Bazu. +1",body="Assim. Jubbah +3",legs="Hashishin Tayt +2",head="Mirage Keffiyeh +1",neck="Mirage Stole +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1"}
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="Tank", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseTank)},
		[1] = {name="DPS", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
		[2] = {name="EvaTank", idle=sets.evaTank, engaged=sets.evaTank},
		[3] = {name="NoDmg", idle={head="Malignance Chapeau",body="Malignance Tabard",hands="Leyline Gloves",legs="Malignance Tights",feet="Malignance Boots",ring1="Shiva Ring +1",ring2="Shiva Ring +1",ammo="Pemphredo Tathlum",ear1="Suppanomimi",ear2="Friomisi Earring",waist="Penitent's Rope",back=gear.IntCape}, engaged={head="Malignance Chapeau",body="Malignance Tabard",hands="Leyline Gloves",legs="Malignance Tights",feet="Malignance Boots",ring1="Shiva Ring +1",ring2="Shiva Ring +1",ammo="Pemphredo Tathlum",ear1="Suppanomimi",ear2="Friomisi Earring",waist="Penitent's Rope",back=gear.IntCape}},
		[4] = {name="Learning", hidden=true, idle=(set_combine(sets.Learning, sets.baseIdle)), engaged=(set_combine(sets.baseMelee, sets.Learning))},
		[5] = {name="SubTH", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
		[6] = {name="DPS+ACC", idle=(set_combine(sets.melee, sets.baseIdle, {head="Hashishin Kavuk +3"})), engaged=(set_combine(sets.baseMelee, {head="Hashishin Kavuk +3"}))}
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="TPBonus", set={main="Naegling", sub="Thibron"}},
		[1] = {name="FullAcc", set={main="Naegling", sub="Zantetsuken"}},
		[2] = {name="MagicDW", set={main="Maxentius", sub="Bunzi's Rod"}},
		[3] = {name="1dmg", set={main="Twinned Blade", sub="Ibushi Shinai"}},
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

function job_setup()
    blue_magic_maps = {}
	-- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }
    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }
    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
	'Asuran Claws','Bilgestorm','Battle Dance','Bludgeon','Bloodrake','Death Scissors','Dimensional Death',
	'Empty Thrash','Quadrastrike','Uppercut','Tourbillion','Sinker Drill','Thrashing Assault','Vertical Cleave',
	'Whirl of Rage','Saurian Slide','Spinal Cleave','Paralyzing Triad'
	}
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
	'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick','Frenetic Rip','Goblin Rush',
	'Hysteric Barrage','Seedspray','Vanity Dive'
	}
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
	'Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Quad. Continuum','Sprout Smack','Sweeping Gouge'
    }
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
	'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb','Wild Oats','Spiral Spin'
    }
    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }
    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }
    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }
    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
		'Acrid Stream','Anvil Lightning','Crashing Thunder','Charged Whisker','Droning Whirlwind','Firespit',
		'Foul Waters','Gates of Hades','Leafstorm','Molting Plumage','Nectarous Deluge','Polar Roar','Regurgitation',
		'Rending Deluge','Scouring Spate','Searing Tempest','Silent Storm','Spectral Floe','Subduction','Tem. Upheaval',
		'Thermal Pulse','Thunderbolt','Uproot','Water Bomb','Dark Orb','Death Ray','Eyes On Me','Evryone. Grudge',
		'Palling Salvo','Tenebral Crush'
    }
    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
		'Blinding Fulgor','Diffusion Ray','Magic Hammer','Rail Cannon','Retinal Glare'
    }
    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
		'Eyes On Me','Mysterious Light'
    }
    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
		'Embalming Earth','Entomb','Sandspin'
    }
    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
		'Charged Whisker','Gates of Hades'
    }

	-- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
		'1000 Needles','Absolute Terror','Auroral Drape','Awful Eye','Blastbomb','Blank Gaze','Blistering Roar','Blitzstrahl',
		'Blood Drain','Blood Saber','Chaotic Eye','Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
		'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar','Geist Wall','Hecatomb Wave','Infrasonics',
		'Light of Penance','Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sheep Song','Soporific',
		'Sound Blast','Stinking Gas','Venom Shell','Voracious Trunk','Yawn'
    }
    -- Breath-based spells
    blue_magic_maps.Breath = S{
		'Bad Breath','Flying Hip Press','Final Sting','Frost Breath','Heat Breath','Magnetite Cloud','Poison Breath','Radiant Breath',
		'Self Destruct','Thunder Breath','Vapor Spray','Wind Breath','Blood Saber'
    }
    -- Stun spells
    blue_magic_maps.Stun = S{
		'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
		'Thunderbolt','Whirl of Rage'
    }
    -- Healing spells
    blue_magic_maps.Healing = S{
		'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','Wild Carrot'
    }
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
		'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
		'Pyric Bulwark','Reactor Cool',
    }
    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
	blue_magic_maps.Enmity = S{
		'Actinic Burst','Temporal Shift','Jettatura','Exuviation','Fantod','Geist Wall','Blank Gaze',
	}
    
	-- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot','Mighty Guard'
    }

	-- Spells that use obi or O. Sash
	beltSpells = S{
		'Acrid Stream','Anvil Lightning','Crashing Thunder','Charged Whisker','Droning Whirlwind','Firespit',
		'Foul Waters','Gates of Hades','Leafstorm','Molting Plumage','Nectarous Deluge','Polar Roar','Regurgitation',
		'Rending Deluge','Scouring Spate','Searing Tempest','Silent Storm','Spectral Floe','Subduction','Tem. Upheaval',
		'Thermal Pulse','Thunderbolt','Uproot','Water Bomb','Dark Orb','Death Ray','Eyes On Me','Evryone. Grudge',
		'Palling Salvo','Tenebral Crush','Blinding Fulgor','Diffusion Ray','Magic Hammer','Rail Cannon','Retinal Glare',
		'Eyes On Me','Mysterious Light','Embalming Earth','Entomb','Sandspin','Charged Whisker','Gates of Hades'
	}
end

-------------------------------------------------------------------------------------------------------------------
-- Runs when this .lua gets loaded.  Sets up custom binds / switches to proper macro book / enables stylelock
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent.
function extendedUserSetup()
	send_command('lua l azuresets')
	--Set default macro book / page
    set_macro_page(1, 2)

	--Set style lock
	send_command:schedule(2, 'input /lockstyleset 3')
end

function extendedUserUnload()
	send_command('lua unload azuresets')
end

-------------------------------------------------------------------------------------------------------------------
-- Spell/Action phase functions
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	if unbridled_spells:contains(spell.english) then
		if not buffactive['Unbridled Learning'] and not buffactive['Unbridled Wisdom'] then
			-- cancel spell if we dont have one of the buffs up that would let us use it
			eventArgs.cancel = true
			
			-- if unbridled learning is available, add it to command queue
			if not onCooldown('Unbridled Learning') then
				multiStepAction:add('/ja "Unbridled Learning" <me>')
				
				-- MightyGuard specific handling
				if spell.name == 'Mighty Guard'and not buffactive['Diffusion'] and not onCooldown('Diffusion') then
					multiStepAction:add('/ja "Diffusion" <me>')
				end

				-- requeue original spell @ original target after unbridled learning & maybe diffusion
				multiStepAction:add('/ma "'..spell.name..'" '..tostring(spell.target.raw))
			end
		end
	end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
	if gearMode[gearMode.index].name == "SubTH" and spell.english == "Subduction" then
		equip(sets.TH)
	end
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
	if beltSpells:contains(spell.english) then
		if dayWeatherIntensity(spell.element) >= 2 then
			equip(sets.obi)
		else
			equip{waist="Orpheus's Sash"}
		end	
	end

	if spell.element == 'Dark' then
		equip{head="Pixie Hairpin +1",ring2="Archon Ring", body="Hashishin Mintan +3"}
	end

	-- if a sets.buff[xxx] exists, and the buff 'xxx' is active, use that gearSet
	for buff,active in pairs(state.Buff) do
		if active and sets.buff[buff] then
			equip(sets.buff[buff])
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
--  Self command handler
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'learn' then
		setModeIndex('gear', 4)
	end
end

-------------------------------------------------------------------------------------------------------------------
--  Helper functions
-------------------------------------------------------------------------------------------------------------------
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
				return category
			end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	--[[ if auto.fite[auto.fite.index] == 'On' and not player.status == engaged then
		return
	end ]]

	if player.equipment.main == 'empty' or player.equipment.sub == 'empty' then
		equip(sets.weapons)
	end

	--tellXYZ("???") -- id of ring last run:17002672

	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		-- auto.fite actions
		if auto.fite[auto.fite.index] == 'On' then
			-- auto mightyguard when diffusion is ready
			if buffCheck('Mighty Guard') and (buffactive['Unbridled Learning'] or not onCooldown('Unbridled Learning')) and (buffactive['Diffusion'] or not onCooldown('Diffusion')) then
				send_command('input /ma "Mighty Guard" <me>')
				return
			end

			-- heal party members at 50% or lower health
			if bluSpellSet('Magic Fruit') then
				partyLowHP(50, '/ma "Magic Fruit"')
			end

			if buffCheck('Berserk') then
				send_command('/berserk')
			end

			if buffCheck('Warcry') then
				send_command('/warcry')
			end

			--[[ if not buffactive['Food'] then
				send_command('/item "Dragon Steak"')
			end ]]
		end
		
		if buffCheck('Refresh', 'Battery Charge') and bluSpellSet('Battery Charge') then
			send_command('input /ma "Battery Charge" <me>')
			return
		end

		if not checkMagicalHasteCap() and buffCheck('Haste', 'Erratic Flutter') and bluSpellSet('Erratic Flutter') then
			send_command('input /ma "Erratic Flutter" <me>')
			return
		end

		if buffCheck('Attack Boost', 'Nat. Meditation') and bluSpellSet('Nat. Meditation') then
			send_command('input /ma "Nat. Meditation" <me>')
			return
		end

		--[[ if buffCheck('Defense Boost', 'Cocoon') then
			send_command('input /ma "Cocoon" <me>')
			return
		end ]]
	end
end