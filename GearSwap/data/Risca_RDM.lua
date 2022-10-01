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
	
	--Define Base Sets for use in other sets
	sets.baseMelee = {
		ammo="Ginsen",
		head="Malignance Chapeau",        --06
		body="Malignance Tabard",         --09
		hands="Malignance Gloves",        --05
		legs="Malignance Tights",         --07
		feet="Malignance Boots",
		neck="Combatant's Torque",
		waist="Sailfi Belt +1",
		ear1="Sherida Earring",
		ear2="Suppanomimi",
		ring1="Petrov Ring",
		ring2="Ilabrat Ring",
		back="Mecistopins Mantle",
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
		ear1="Sherida Earring",
		ear2="Suppanomimi",
		ring1="Petrov Ring",
		ring2="Ilabrat Ring",
		back="Mecistopins Mantle",
	}
    
	sets.baseWS = {
		ammo="Oshasha's Treatise",
		head="Nyame Helm",
		body="Nyame Mail",
		legs="Nyame Flanchard",
		hands="Jhakri Cuffs +2",
		feet="Jhakri Pigaches +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		ring1="Karieyh Ring +1",
		ring2="Illabrat Ring",
		--[[ back=gear.STRCape, ]]
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
		ring1="Ilabrat Ring",
		ring2="Vengeful Ring",
		--[[ back=gear.STRCape, ]]
	}
	
	sets.baseMagic = {
		ammo="Pemphredo Tathlum",
		--head="Jhakri Coronal +2",
		body="Cohort Cloak +1",
		hands="Amalric Gages +1",  
		legs="Luhlaza Shalwar +3",
		feet="Hashishin Basmak +2",
		neck="Sibyl Scarf",
		waist="Yamabuki-no-obi",
		ear1="Friomisi Earring",
		ear2="Hecate's Earring",
		ring1="Shiva Ring +1",
		ring2="Shiva Ring +1",
		--[[ back=gear.INTCape, ]]
	}

	sets.enspellDmg = {
		ammo="Pemphredo Tathlum",
		head="Umuthi Hat",
		body="Malignance Tabard",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Sailfi Belt +1",
		ear1="Suppanomimi",
		ear2="Eabani Earring",
		ring1="Petrov Ring",
		ring2="Rajas Ring",
		back="Ghostfyre Cape"
	}

	sets.magic = {}
	sets.magic.emSkill = {
		--ammo="Amar Cluster",
		head="Befouled Crown",
		--body="Malignance Tabard",
		--hands="Malignance Gloves",
		legs="Carmine Cuisses +1",
		feet="Carmine Greaves +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		ear1="Andoaa Earring",        --05
		ear2="Mimir Earring",        --10
		ring1="Stikini Ring +1",      --08
		ring2="Stikini Ring +1",     --08
		back="Merciful Cape",
	}
	sets.magic.enfeebSkill = {
		head="Befouled Crown",
		neck="Incanter's Torque",
		legs='Chironic Hose',
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	}
	sets.magic.emDuration = {body='Telchine Chasuble', hands='Telchine Gloves', legs='Telchine Braconi', feet='Telchine Pigaches', waist='Embla Sash', ear1='Lethargy Earring', back='Ghostfyre Cape'}
	
	sets.magic.acc = {
		ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		ear1="Lethargy Earring",
		ear2="Malignance Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Ghostfyre Cape",
	}
	
	sets.magic.fastCast = {
		ammo = "Impatiens",
		head = "Merlinic Hood",
		body = "Merlinic Jubbah",
		hands = "Leyline Gloves",
		legs = "Jhakri Slops +2",
		feet = "Merlinic Crackows",
		neck = "Orunmila's Torque",
		waist = "Witful Belt",
		left_ear = "Malignance Earring",
		right_ear = "Loquac. Earring",
		left_ring = "Kishar Ring",
		right_ring = "Jhakri Ring",
		back = "Swith Cape",
	}

	sets.magic.nuke = {}

	sets.moveSpeed = {legs="Carmine Cuisses +1"}
	sets.TH = {waist='Chaac Belt', head='Wh. Rarab Cap +1', ammo='Per. Lucky Egg', hands="Herculean Gloves"}
	sets.obi = {waist="Hachirin-no-obi"}
	sets.baseIdle = { ammo="Homiliary", head="Befoulded Crown", body="Jhakri Robe +2", neck="Sibyl Scarf", ring1="Stikini Ring +1", ring2="Stikini Ring +1"}
    
	--Define Job Ability sets
    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = sets.baseWS
	sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {ring2="Rufescent Ring", ear2="Ishvara Earring"})
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.baseWS, {})																		-- dex
	sets.precast.WS['Expiacion'] = set_combine(sets.baseWS, {})																				-- str/ind/dex
    sets.precast.WS['Requiescat'] = set_combine(sets.baseWS, {})																			-- mnd
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.baseMagic, {waist="Fotia Belt",neck="Fotia Gorget",ring1="Jhakri Ring",})			-- mnd/str
	sets.precast.WS['Flat Blade'] = equip(sets.baseMelee)

	sets.precast.FC = sets.magic.fastCast
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.magic.fastCast, {waist="Siegel Sash"})
	sets.midcast['Enfeebling Magic'] = set_combine(sets.magic.acc, sets.magic.enfeebSkill)
	sets.midcast['Enhancing Magic'] = set_combine(sets.baseTank, sets.interrupt, sets.emSkill, sets.emDuration)
	sets.midcast['Temper'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration)
    sets.midcast['Phalanx'] = set_combine(sets.baseTank, sets.interrupt, sets.emSkill, sets.emDuration, {body="Taeon Tabard", hands="Taeon Gloves", feet="Taeon Boots"})
    sets.midcast['Aquaveil'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration, sets.interrupt, {})
    sets.midcast['Regen'] = set_combine(sets.baseTank, sets.emDuration, {head="Rune. Bandeau +3",neck="Sacro Gorget",waist="Sroda Belt",ear2="Erilaz Earring"})
	sets.midcast['Cure'] = set_combine(sets.baseTank, {waist="Sroda Belt"})
    sets.midcast['Refresh'] = set_combine(sets.baseTank, sets.emDuration, {waist="Gishdubar Sash", head="Erilaz Galea +2",})
	sets.midcast['Stoneskin'] = set_combine(sets.baseTank, sets.emSkill, {waist="Siegel Sash",})

	-- These should all be under 'Enhancing Magic' but dont get picked up for some reason
    sets.midcast['Regen'] = sets.midcast['Enhancing Magic']
	sets.midcast['Refresh'] = sets.midcast['Enhancing Magic']
	sets.midcast['Haste'] = sets.midcast['Enhancing Magic']
	sets.midcast['Sneak'] = sets.midcast['Enhancing Magic']
	sets.midcast['Invisible'] = sets.midcast['Enhancing Magic']
	sets.midcast['Deodorize'] = sets.midcast['Enhancing Magic']
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="Tank", idle=set_combine(sets.baseTank, sets.baseIdle), engaged=sets.baseTank},
		[1] = {name="DPS", idle=set_combine(sets.baseMelee, sets.baseIdle), engaged=sets.baseMelee},
		[2] = {name="EnspellDmg", idle=set_combine(sets.enspellDmg, sets.baseIdle), engaged=sets.enspellDmg},
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
    --set_macro_page(1, 2)

	--Set style lock
	--send_command('wait 2; input /lockstyleset 3')
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

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	if auto.buff[auto.buff.index] == 'On' and not moving then
		local abilRecasts = windower.ffxi.get_ability_recasts()
		local composureRecast = abilRecasts[419]

		if not actionInProgress then
			maintainBuff('Composure', '/ja "Composure" <me>')
						
			maintainBuff('Multi Strikes', '/ma "Temper II" <me>')
			maintainBuff('Haste', '/ma "Haste II" <me>')
			maintainBuff('Refresh', '/ma "Refresh III" <me>')
			maintainBuff('Phalanx', '/ma "Phalanx" <me>')
			maintainBuff('Str Boost', '/ma "Gain STR" <me>')
			
			-- garbage buffs for naegling
			maintainBuff('Enaero', '/ma "Enaero" <me>')
			maintainBuff('Baraero', '/ma "Baraero" <me>')
			maintainBuff('Barsleep', '/ma "Barsleep" <me>')
			maintainBuff('Aquaveil', '/ma "Aquaveil" <me>')
			maintainBuff('Protect', '/ma "Protect V" <me>')
			maintainBuff('Shell', '/ma "Shell V" <me>')
			


			if auto.fite[auto.fite.index] == 'On' then
				if player.mpp < 30 then
					send_command('input /ja "Convert" <me>')
				end
				--partyLowHP(40, '/ma "Cure IV"')
			end
		end
	end
end