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
	gear.INTCape = {name="Rosmerta's Cape", augments={'INT + 20'}}
	gear.STRCape = {name="Rosmerta's Cape", augments={'STR + 20'}}
	
	--Define Base Sets for use in other sets
	sets.baseMelee = {
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		legs="Malignance Tights",
		feet="Herculean Boots",
		neck="Combatant's Torque",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Ilabrat Ring",
		back=gear.STRCape,
	}
	sets.baseTank = {
		ammo="Ginsen",
		head="Malignance Chapeau",        --06
		body="Malignance Tabard",         --09
		hands="Malignance Gloves",        --05
		legs="Malignance Tights",         --07
		feet="Malignance Boots",           --07
		neck="Combatant's Torque",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Ilabrat Ring",
		back=gear.STRCape,                --05
	}
	sets.baseMagic = {
		ammo="Ombre Tathlum +1",
		--head="Jhakri Coronal +2",
		body="Cohort Cloak +1",
		hands="Amalric Gages +1",  
		legs="Luhlaza Shalwar +3",
		feet="Hashishin Basmak +2",
		neck="Sibyl Scarf",
		waist="Yamabuki-no-obi",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back=gear.INTCape,
	}

	sets.magic = {}
	sets.magic.nuke = {}
	sets.magic.acc = {}
	sets.magic.bluSkill = {}

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
		left_ring="Ilabrat Ring",
		right_ring="Vengeful Ring",
		back=gear.STRCape,
	}
    sets.precast.WS = {
		ammo="Oshasha's Treatise",
		head="Nyame Helm",
		body="Nyame Mail",
		legs="Nyame Flanchard",
		hands="Jhakri Cuffs +2",
		feet="Jhakri Pigaches +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Odr Earring",
		right_ear="Moonshade Earring",
		left_ring="Karieyh Ring +1",
		right_ring="Illabrat Ring",
		back=gear.STRCape,
	}
	
	sets.baseIdle = {body="Hashishin Mintan +2",right_ring="Defending Ring",left_ring="Karieyh Ring +1",neck="Sibyl Scarf"}
	sets.moveSpeed = {legs="Carmine Cuisses +1"}
	sets.TH = {waist='Chaac Belt', head='Wh. Rarab Cap +1', ammo='Per. Lucky Egg', hands="Herculean Gloves"}
	sets.obi = {waist="Hachirin-no-obi"}
    
	--Define Job Ability sets														-- I'd use these if i cared enough to get them:
    sets.buff['Burst Affinity'] = {feet="Hashishin Basmak +2"}
    sets.buff['Chain Affinity'] = {} 												--Mavi Kavuk +2, Assimilator's Charuqs
    sets.buff['Convergence'] = {} 													--Luhlaza Keffiyeh
    sets.buff['Diffusion'] = {feet="Luhlaza Charuqs +1"}
    sets.buff['Enchainment'] = {} 													--Luhlaza Jubbah
    sets.buff['Efflux'] = {legs="Hashishin Tayt", gear.STRCape,}
    sets.precast.JA['Azure Lore'] = {} 												--Mirage Bazubands +2
	sets.precast.JA['Provoke'] = sets.TH	-- that way i can proc TH by voking random monsters when i want to.

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}


    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +2"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {right_ring="Rufescent Ring", earring2="Ishvara Earring"})
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})																		-- dex
	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {})																				-- str/ind/dex
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})																			-- mnd
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.baseMagic, {waist="Fotia Belt",neck="Fotia Gorget",left_ring="Jhakri Ring",})			-- mnd/str

	sets.precast.WS['Flat Blade'] = equip(sets.baseMelee)

	sets.emDuration = {}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.midcast['Enhancing Magic'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration)
	sets.midcast['Crusade'] = set_combine(sets.baseTank, sets.interrupt, sets.emDuration)
	sets.midcast['Temper'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration)
    sets.midcast['Phalanx'] = set_combine(sets.baseTank, sets.interrupt, sets.emSkill, sets.emDuration, {body="Taeon Tabard", hands="Taeon Gloves", feet="Taeon Boots"})
    sets.midcast['Aquaveil'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration, sets.interrupt, {})
    sets.midcast['Regen'] = set_combine(sets.baseTank, sets.emDuration, {head="Rune. Bandeau +3",neck="Sacro Gorget",waist="Sroda Belt",ear2="Erilaz Earring"})
	sets.midcast['Cure'] = set_combine(sets.baseTank, {waist="Sroda Belt"})
    sets.midcast['Refresh'] = set_combine(sets.baseTank, sets.emDuration, {waist="Gishdubar Sash", head="Erilaz Galea +2",})
	sets.midcast['Cocoon'] = sets.baseTank
	sets.midcast['Stoneskin'] = set_combine(sets.baseTank, sets.emSkill, {waist="Siegel Sash",})

    
    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {hands="Assim. Bazu. +1",body="Assim. Jubbah +3",legs="Hashishin Tayt",head="Mirage Keffiyeh",neck="Mirage Stole",ring1="Stikini Ring +1",ring2="Stikini Ring +1"}
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
		[3] = {name="NoDmg", idle={head="Malignance Chapeau",body="Malignance Tabard",hands="Leyline Gloves",legs="Malignance Tights",feet="Malignance Boots",ring1="Shiva Ring +1",ring2="Shiva Ring +1",ammo="Ombre Tathlum +1",ear1="Suppanomimi",ear2="Friomisi Earring",waist="Penitent's Rope",back=gear.INTCape}, engaged={head="Malignance Chapeau",body="Malignance Tabard",hands="Leyline Gloves",legs="Malignance Tights",feet="Malignance Boots",ring1="Shiva Ring +1",ring2="Shiva Ring +1",ammo="Ombre Tathlum +1",ear1="Suppanomimi",ear2="Friomisi Earring",waist="Penitent's Rope",back=gear.INTCape}},
		[4] = {name="Learning", idle=(set_combine(sets.Learning, sets.baseIdle)), engaged=(set_combine(sets.baseMelee, sets.Learning))},
		[5] = {name="SubTH", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)}
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="MeleeDW", set={main="Naegling", sub="Thibron"}},
		[1] = {name="MagicDW", set={main="Maxentius", sub="Bunzi's Rod"}},
		[2] = {name="1dmg", set={main="Twinned Blade", sub="Ibushi Shinai"}},
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
    
end

-------------------------------------------------------------------------------------------------------------------
-- Runs when this .lua gets loaded.  Sets up custom binds / switches to proper macro book / enables stylelock
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent.
function extendedUserSetup()
	--Set default macro book / page
    set_macro_page(1, 2)

	--Set style lock
	send_command('wait 2; input /lockstyleset 3')
end

function extendedUserUnload()
end

-------------------------------------------------------------------------------------------------------------------
-- Spell/Action phase functions
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
    --[[ local abil_recasts = windower.ffxi.get_ability_recasts()
	add_to_chat(122, '-- Spell: ' .. spell.english .. ' spellID: ' .. spell.id .. ' SpellRecastId: ' .. spell.recast_id .. ' target: '..tostring(spell.target.raw)..' --') ]]

	-- don't try to do stuff if we can't do stuff (stops us from swapping gear if we cant start the spell)
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
        return
    end

	local abilRecasts = windower.ffxi.get_ability_recasts()
	local diffusionRecast = abilRecasts[184]
	local unbridledRecast = abilRecasts[81]

--[[ 	if spell.english == 'Battery Charge' and diffusionRecast == 0 and auto.fite[auto.fite.index] == 'On' then
		eventArgs.cancel = true
		send_command('input /ja "Diffusion" <me>; wait 1.5; input /ma "'..spell.name..'" '..tostring(spell.target.raw))
		return
	end ]]

	-- auto pop unbridled learning when we try to cast a spell that requires it (saves a button on macro bar)
	if unbridled_spells:contains(spell.english) and unbridledRecast == 0 then
		eventArgs.cancel = true

		if diffusionRecast == 0 and spell.name == 'Mighty Guard' or spell.name == 'Carcharian Verve' then
			send_command('input /ja "Diffusion" <me>; wait 1.5; input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..tostring(spell.target.raw))
			return
		end

		send_command('input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..tostring(spell.target.raw))
	end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
	if gearMode[gearMode.index].name == "SubTH" and spell.english == "Subduction" then
		equip(sets.TH)
	end

	-- if a sets.buff[xxx] exists, and the buff 'xxx' is active, use that gearSet
	for buff,active in pairs(state.Buff) do
		if active and sets.buff[buff] then
			equip(sets.buff[buff])
        end
	end
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
	if spell.element == 'Dark' then
		equip{head="Pixie Hairpin +1", body="Jhakri Robe +2"}
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Buff table updating
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
	if state.Buff[buff] == nil and active then
		state.Buff[buff] = true
	else
		state.Buff[buff] = nil
	end
end

-------------------------------------------------------------------------------------------------------------------
--  Self command handler
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'buffs' then
		local currentBuffs = windower.ffxi.get_player().buffs
		for _, v in pairs(currentBuffs) do
			add_to_chat(122, "BuffActive: "..v)
		end
	end

	if cmdParams[1]:lower() == 'test' then
		local strVar = "asdf"
		local intVar = 1234
		
		add_to_chat(122, "strVar type: "..type(strVar).." intVar type: "..type(intVar))
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
	if auto.buff[auto.buff.index] == 'On' and not moving then
		local abilRecasts = windower.ffxi.get_ability_recasts()
		local composureRecast = abilRecasts[419]

		if not actionInProgress then
			maintainBuff('Composure', '/ja "Composure" <me>')
			maintainBuff(33, '/ma "Haste" <me>')
			maintainBuff('Refresh', '/ma "Refresh" <me>')

			if auto.fite[auto.fite.index] == 'On' then
				partyLowHP(40, '/ma "Cure V"')
			end
		end
	end
end