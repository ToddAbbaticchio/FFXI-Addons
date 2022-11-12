include('RST\\sharedFunctions.lua')

-------------------------------------------------------------------------------------------------------------------
-- dumb name.  is required.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and gear vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
	gear.smnGloves = {name="Merlinic Dastanas", augments={'Blood Pact Dmg.+8'}}
	
	sets.precast.FC = {
		head="Merlinic Hood",
		body="Inyanga Jubbah +2",
		feet="Merlinic Crackows",
		neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
	}

	-- BP1 and BP2 reduction both cap at -15 --
	sets.BPReduction = {
		--main="Espiritus",            -- BP2 -02
		--sub="",                      
		ammo="Epitaph",                -- BP2 -05
		head="Beckoner's Horn +1",     -- Avatar's Favor +3 (is real important for reduction timer) 
		body="Con. Doublet +2",        -- BP1 -10    
		hands="Con. Bracers +1",       -- BP1 -06
		--legs="",
		--feet="",
		--neck="",
		--waist="",
		left_ear="Evans Earring",      -- BP1 -02
		--right_ear="",
		--left_ring="",
		--right_ring="",
		--back=""
	}

	sets.BPDamage = {
		sub="Elan strap +1",
		--head="",
		body="Con. Doublet +2",
		hands=gear.smnGloves,
		legs="Enticer's Pants",
		feet="Convo. Pigaches +2",
		--neck="",
		--waist="",
		left_ear="Gelos Earring",
		--right_ear="",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	}
	
	-- Breakpoints for favor tiers are: 0~316, 317~381, 382~446, 447~511, 512~574, 575~669, 670+
	sets.SmnSkill = {
		--sub="",
		head="Con. Horn +1",
		--body="",
		hands="Lamassu Mitts",
		legs="Beck. Spats +1",
		feet="Convo. Pigaches +2",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		--left_ear="",
		right_ear="Andoaa Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
	--	back=""
	}
	
	sets.MeleeAvatar = {
		--sub="Elan strap +1",
		--head="Con. Horn +1",
		--body="Con. Doublet +2",
		--hands="Inyan. Dastanas +2",
		legs="Tali'ah Sera. +2",
		feet="Bunzi's Sabots",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		--left_ear="Evans Earring",
		--right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	}
	
	sets.MagicAvatar = {
		--sub="Elan strap +1",
		--head="Con. Horn +1",
		--body="Con. Doublet +2",
		hands=gear.smnGloves,
		--legs="Beck. Spats +1",
		feet="Bunzi's Sabots",
		neck="Adad Amulet",
		--waist="Lucidity Sash",
		--left_ear="Evans Earring",
		--right_ear="Andoaa Earring",
		--left_ring="Stikini Ring +1",
		--right_ring="Stikini Ring +1",
		back="Campestres's Cape"
	}
	
	-- Max perp is -14, beyond that is wasted
	sets.AvatarPerp = {
		--sub="Elan strap +1",
		head="Beckoner's Horn +1",
		body="Shomonjijoe +1",
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet="Bunzi's Sabots",
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear="Andoaa Earring",
		left_ring="Evoker's Ring",
		right_ring="Karieyh Ring +1",
		back="Campestres's Cape"
	}

	-- Weaponskill sets
	sets.precast.WS['Myrkr'] = {
        head="Beckoner's Horn +1",
        body="Con. Doublet +2",
        hands="Con. Bracers +1",
        legs="Beck. Spats +1",
        feet="Telchine Pigaches",
        neck="Sanctity Necklace",
        ear1="Evans Earring",
        ear2="Etiolation Earring",
        ring1="Mephitas's Ring",
        ring2="Mephitas's Ring +1",
        back="Pahtli Cape",
        waist="Shinjutsu-no-Obi",
    }

	-- JA sets
	sets.precast.JA['Elemental Siphon'] = set_combine(sets.SmnSkill, {})
	sets.precast.JA['Sublimation'] = {waist="Embla Sash"}
	
	-- Precast BloodPact Sets
    sets.precast.BloodPactWard = set_combine(sets.SmnSkill, sets.BPReduction, {})
    sets.precast.BloodPactRage = set_combine(sets.SmnSkill, sets.BPReduction, {})

	-- PET Midcast Unhandled BloodPacts
	sets.midcast.Pet.BloodPactWard = set_combine(sets.MagicAvatar, sets.SmnSkill)
	sets.midcast.Pet.BloodPactRage = set_combine(sets.SmnSkill, sets.MeleeAvatar, sets.BPDamage)

	--Special PhysicalBP Handling
	sets.midcast.Pet.BloodPactRage['Flaming Crush'] = set_combine(sets.SmnSkill, sets.MeleeAvatar, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Volt Strike'] = set_combine(sets.SmnSkill, sets.MeleeAvatar, sets.BPDamage)
	
	--Special MagicBP Handling
	sets.midcast.Pet.BloodPactRage['Thunderstorm'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Meteor Strike'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Heavenly Strike'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Geocrush'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Grand Fall'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Wind Blade'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Impact'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Tornado II'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)
	sets.midcast.Pet.BloodPactRage['Level ? Holy'] = set_combine(sets.SmnSkill, sets.MagicAvatar, sets.BPDamage)

	-- Non summoner spell handling
	sets.precast.FC['Cure'] = set_combine(sets.precast.FC, {back="Pahtli Cape"})
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash",})
	sets.midcast['Elemental Magic'] = { head="Merlinic Hood", body="Merlinic Jubbah", hands="Amalric Gages +1", legs="Merlinic Shalwar", neck="Mizu. Kubikazari", waist="Eschan Stone", left_ear="Friomisi Earring", right_ear="Barkaro. Earring",	left_ring="Freke Ring", right_ring="Stikini Ring +1", back="Campestres's Cape",}
	sets.midcast['Enfeebling Magic'] = {neck="Incanter's Torque", head="Befouled Crown", ring1="Kishar Ring", ring2="Stikini Ring +1", hands="Inyan. Dastanas +2", back="Campestres's Cape",}
	sets.midcast['Cure'] = {hands="Telchine Gloves",}
	sets.midcast['Aspir'] = set_combine(sets.midcast['Enfeebling Magic'], {waist="Fucho-no-Obi", left_ring="Evanescence Ring", feet="Merlinic Crackows", head="Pixie Hairpin +1"})
	sets.midcast['Drain'] = set_combine(sets.midcast['Enfeebling Magic'], {waist="Fucho-no-Obi", left_ring="Evanescence Ring", feet="Merlinic Crackows", head="Pixie Hairpin +1"})

	sets.emSkill = {head="Befouled Crown", neck="Incanter's Torque", hands="Inyan. Dastanas +2", waist="Olympus Sash", ear1="Mimir Earring", ear2="Andoaa Earring", body="Telchine Chas.", ring1="Stikini Ring +1", ring2="Stikini Ring +1"}
	sets.emDuration = {waist="Embla Sash", legs="Telchine Braconi", body="Telchine Chas.", feet="Telchine Pigaches", hands="Telchine Gloves"}
	sets.midcast['Enhancing Magic'] = set_combine(sets.emSkill, sets.emDuration)
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'])
	sets.midcast['Haste'] = sets.midcast['Enhancing Magic']
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {feet="Dream Boots +1"})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {hands="Dream Mittens +1"})
	sets.midcast['Deodorize'] = sets.midcast['Enhancing Magic']
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="Default", idle=sets.AvatarPerp, engaged=set_combine(sets.AvatarPerp, sets.MeleeAvatar)},
		[1] = {name="MaxPerp", idle=sets.AvatarPerp, engaged=sets.AvatarPerp},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Magic BP", set={main="Espiritus", sub="Elan Strap +1"}},
		[1] = {name="Physical BP", set={main="Gridarvor", sub="Elan Strap +1"}},
	}

	--Setup magicMode not needed for smn
	--[[ magicMode = {
		["index"] = 0,
		[0] = {name="Burst", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[1] = {name="FreeNuke", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[2] = {name="MaxAcc", nukeSet=(set_combine(sets.interrupt, sets.emSkill))},
	} ]]

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
		["smnMode"] = {
			["index"] = 0,
			[0] = {
				["name"] = "DPS",
				["defaultAvatar"] = { name="Ifrit", defaultAction={ type="attack", name="flamingcrush", minMp=30} },
				["autoBPs"] = {
					["Hastega II"] = { buffName="Haste", avatar="Garuda" },
					["Crystal Blessing"] = { buffName="TP Bonus", avatar="Shiva" },
					["Crimson Howl"] = { buffName="Warcry", avatar="Ifrit" },
				},
			},
			[1] = {
				["name"] = "Heal",
				["defaultAvatar"] = {name="Carbuncle", defaultAction={ type="heal", name="healingruby2", partyHp=60} },
				["autoBPs"] = {
					["Hastega II"] = { buffName="Haste", avatar="Garuda" },
					["Crystal Blessing"] = { buffName="TP Bonus", avatar="Shiva" },
					["Crimson Howl"] = { buffName="Warcry", avatar="Ifrit" },
				},
			},
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
    spirits = {
		["Wind"] = "Air Spirit",
		["Light"] = "Light Spirit",
		["Fire"] = "Fire Spirit",
		["Ice"] = "Ice Spirit",
		["Earth"] = "Earth Spirit",
		["Lightning"] = "Fire Spirit",
		["Water"] = "Water Spirit",
		["Dark"] = "Fire Spirit"
	}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Job specific keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	send_command('bind ^F11 gs c togglesmnmode')

	--Set default macro book / page
    set_macro_page(1, 9)

	--Set style lock
	windower.send_command('wait 2; input /lockstyleset 7')
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
    
	-- Switch to correct macro book/page based on avatar summoned
	if spell.english == 'Release' then
        add_to_chat(167, '~Default SMN macro book loaded~')
		set_macro_page(1, 9)
    end
	if spell.english == 'Carbuncle' then
        add_to_chat(167, '~Carbuncle macro book loaded~')
		set_macro_page(2, 9)
    end
	if spell.english == 'Fenrir' then
        add_to_chat(167, '~Fenrir macro book loaded~')
		set_macro_page(3, 9)
    end
	if spell.english == 'Ifrit' then
        add_to_chat(167, '~Ifrit macro book loaded~')
		set_macro_page(4, 9)
    end
	if spell.english == 'Titan' then
        add_to_chat(167, '~Titan macro book loaded~')
		set_macro_page(5, 9)
    end
	if spell.english == 'Leviathan' then
        add_to_chat(167, '~Leviathan macro book loaded~')
		set_macro_page(6, 9)
    end
	if spell.english == 'Garuda' then
        add_to_chat(167, '~Garuda macro book loaded~')
		set_macro_page(7, 9)
    end
	if spell.english == 'Shiva' then
        add_to_chat(167, '~Shiva macro book loaded~')
		set_macro_page(8, 9)
    end
	if spell.english == 'Ramuh' then
        add_to_chat(167, '~Ramuh macro book loaded~')
		set_macro_page(9, 9)
    end
	if spell.english == 'Cait Sith' then
        add_to_chat(167, '~Cait Sith macro book loaded~')
		set_macro_page(10, 9)
    end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
    -- placeholder
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
    --[[ if buff == "Doom" then
		if active then
			send_command('input /p "Doomed, pls halp!')
			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
			disable('ring1','waist')
		else
			send_command('input /p "Im saved!!! ...or Doom killed me?')
			enable('ring1','waist')
			evalState_equipGear()
		end
	end ]]
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'togglesmnmode' then
		auto.smnMode.index = auto.smnMode.index + 1
		if auto.smnMode.index > #auto.smnMode then
			auto.smnMode.index = 0
		end
		modeHud('update')
	end

	if cmdParams[1]:lower() == 'elesiphon' then
		local toggle = false
		if auto.buff.index == 1 then
			send_command('input //gs c toggleautobuff')
			toggle = true
		end

		send_command('/release')
		send_command:schedule(2,'/'..spirits[bestObiElement()])
		send_command:schedule(6,'/elementalsiphon')

		if toggle == true then
			send_command:schedule(8,'input //gs c toggleautobuff')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Other SharedFunction extensions
-------------------------------------------------------------------------------------------------------------------
function extendedModeHud(hudText)
	-- job specific location override?
	--modeHud_xPos = 1200
	--modeHud_yPos = 50

	local autoSmnMode = auto.smnMode[auto.smnMode.index].name
	hudText:append(white..'auto.Smn: '..autoSmnMode)
	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- autobuff
	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		-- Sublimation Handling if we're /sch
		if player.sub_job == 'SCH' then
			-- if sublimation not active and not on cooldown - use it.
			if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and not onCooldown('Sublimation') then
				send_command('/sublimation')
				return
			end
			-- if sublimation done charging and MP below 40% pop it for freeeeeee mp
			if buffactive['sublimation: complete'] and player.mpp < 40 and not onCooldown('Sublimation') then
				add_to_chat(122,'-- MP below 40% - Popping Sublimation! --')
				send_command('/sublimation')
				return
			end
		end

		if player.sub_job == 'RDM' then
			if not buffactive['Refresh'] and not onCooldown('Refresh') then
				send_command('input /ma "Refresh" <me>')
			end

			if player.mpp > 30 and not onCooldown('Convert') then
				send_command('/convert')
			end
		end

		-- auto elemental siphon with best spirit based on day/weather bonuses
		if player.mpp < 35 and not onCooldown('Elemental Siphon') then
			add_to_chat(122,'-- MP below 35% - Elemental Siphon! --')
			send_command('input //gs c elesiphon')
			return
		end

		-- Myrkr!
		if player.mpp < 35 and player.tp > 2500 then
			add_to_chat(122,'-- MP below 35% - Myrkr! --')
			send_command('/myrkr')
			return
		end

		-- auto Avatar's Favor
		if pet.isvalid and not buffactive["Avatar's Favor"] then
			send_command('input /ja "Avatar\'s Favor" <me>')
		end
	end

	-- autofite
	if auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving then
		local defaultAvatarInfo = auto.smnMode[auto.smnMode.index].defaultAvatar
		local bpTable = auto.smnMode[auto.smnMode.index].autoBPs

		local requiredAvatar = defaultAvatarInfo.name
		for k,v in pairs(bpTable) do
			if not buffactive[v.buffName] then
				requiredAvatar = v.avatar
				break
			end
		end

		-- if we've got the wrong avatar out dismiss it
		if pet.isvalid == true and not (pet.name == requiredAvatar) then
			send_command('/release')
			return
		end

		-- summon requiredAvatar
		if not pet.isvalid then
			send_command('/'..requiredAvatar)
			return
		end

		-- Auto assault if we're engaged and pet is not
		if pet.isvalid and player.status == engaged and pet.status == idle then
			send_command('/assault')
		end

		-- Auto BPWard for the required (and current at this point) avatar
		for k,v in pairs(bpTable) do
			if pet.name == v.avatar then
				if not buffactive[v.buffName] and not onCooldown('Blood Pact: Ward') then
					add_to_chat(122,'-- BPWard: '..k..' --')
					send_command('/'..k)
					return
				end
			end
		end

		-- Handle default action from smnMode table if conditions are met
		--   (attacks = mp > set mp%, heals = someone in party below set hp%)
		local defaultAction = defaultAvatarInfo.defaultAction
		if pet.name == defaultAvatarInfo.name then
			if defaultAction.type == "attack" and player.mpp > defaultAction.minMp and not onCooldown('Blood Pact: Rage') and player.status == engaged then
				add_to_chat(122,'-- BPRage: '..defaultAction.name..' --')
				send_command('/'..defaultAction.name)
				return
			end

			if defaultAction.type == "heal" and partyLowHP(defaultAction.partyHp) and not onCooldown('Blood Pact: Ward') then
				add_to_chat(122,'-- BPWard: '..defaultAction.name..' --')
				send_command('/'..defaultAction.name)
				return
			end
		end
	end
end