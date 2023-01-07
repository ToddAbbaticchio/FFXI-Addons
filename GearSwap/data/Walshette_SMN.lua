-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
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

	--gear.petMagCape = {name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}}
	--gear.petAtkCape = {name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}}
	gear.merlinicBPHands = {name="Merlinic Dastanas", augments={'Pet: Accuracy+26 Pet: Rng. Acc.+26','Blood Pact Dmg.+10','Pet: STR+5','Pet: Mag. Acc.+6','Pet: "Mag.Atk.Bns."+10',}}

	sets.precast.FC = {		
		body="Inyanga Jubbah +2",
		ear1="Etiolation Earring",
		ear2="Malignance Earring",
		ring1="Kishar Ring",
	}

	sets.midcast = {}

	--[[ BP Timer Gear (BP Recast Reduction, Avatar's Favor) ]]--
    sets.midcast.BP = {
        main="Espiritus",
        --ammo="Sancus Sachet +1",
        --head="Beckoner's Horn +2",
        --neck="Incanter's Torque",
        --ear1="Cath Palug Earring",
        --ear2="Lodurr Earring",
        --body="Baayami Robe", -- +1
        --hands="Baayami Cuffs", -- +1
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        --back="Conveyance Cape", 
        --waist="Incarnation Sash", --waist="Kobo Obi",
        --legs="Beckoner's Spats +2", --legs="Baayami Slops +1",
        --feet="Baayami Sabots +1"
    }

	sets.BPReduction = {
		main="Espiritus",
        --sub="Vox Grip",
        --ammo="Sancus Sachet +1",
        --head="Beckoner's Horn +2",
        --neck="Incanter's Torque",
        --ear1="Cath Palug Earring",
        --ear2="Lodurr Earring",
        --body="Baayami Robe", -- +1
        hands="Baayami Cuffs +1", -- +1
        ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        --back="Conveyance Cape", 
        --waist="Incarnation Sash", --waist="Kobo Obi",
        --legs="Convoker's Spats +1", --legs="Baayami Slops +1",
        --feet="Baayami Sabots +1"
	}

	sets.SmnSkill = {
		main="Espiritus", 
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		--head="Baayami Hat", -- +1
		--neck="Incanter's Torque",
		--ear1="Cath Palug Earring",
		--ear2="Lodurr Earring",
		--body="Baayami Robe", -- +1
		--hands="Baayami Cuffs",-- +1
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		--back="Conveyance Cape",
		--waist="Incarnation Sash", ---waist="Kobo Obi",
		--legs="Convoker's Spats +1", --legs="Baayami Slops +1",
		--feet="Baayami Sabots +1"
	}

	sets.precast.BloodPactWard = set_combine(sets.SmnSkill, sets.BPReduction, {})
    sets.precast.BloodPactRage = set_combine(sets.SmnSkill, sets.BPReduction, {})

	-- Elemental Siphon sets. Zodiac Ring is affected by day, Chatoyant Staff by weather, and Twilight Cape by both.
	sets.midcast.Siphon = {
		main="Espiritus", 
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	}	
    sets.midcast.SiphonZodiac = set_combine(sets.midcast.Siphon, {})--{ ring1="Zodiac Ring" }) -- in Storage
    sets.midcast.SiphonWeather = set_combine(sets.midcast.Siphon, {})    
    sets.midcast.SiphonWeatherZodiac = set_combine(sets.midcast.SiphonZodiac, {})

	--[[ Summoning Midcast (Spell Interruption (Baayami Robe +1 + 2 more), DT) ]]--
    sets.midcast.Summon = set_combine(sets.DT_Base, {
        --body="Baayami Robe", -- +1
        --waist="Rumination Sash"
    })

	sets.midcast["Mana Cede"] = {}
    sets.midcast["Astral Flow"] = {}

	--[[ Blood Pacts ]]--
		sets.pet_midcast = {}

		-- Physical BPs (BP Damage, Pet:DA), (Volt Strike, Pred Claws, etc.)
		sets.pet_midcast.Physical_BP = {
			main="Gridarvor",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="Apogee Crown +1",
			neck="Deino Collar", --neck="Summoner's Collar +2",
			--ear1="Lugalbanda Earring",
			ear2="Beckoner's Earring",
			body="Apogee Dalmatica +1", 
			hands=gear.merlinicBPHands, 
			ring1="Cath Palug Ring",
			ring2="Varar Ring +1",
			back="Scintillating Cape",
			waist="Regal Belt",
			legs="Apogee Slacks +1",
			feet="Apogee Pumps +1",
		}

		-- Physical pacts which benefit more from TP than Pet:DA (like Spinning Dive and other pacts you never use except that one time)
		sets.pet_midcast.Physical_BP_TP = set_combine(sets.pet_midcast.Physical_BP, {
			ring1="Varar Ring +1",
		})
		
		-- Used for all physical pacts when AccMode is true
		sets.pet_midcast.Physical_BP_Acc = set_combine(sets.pet_midcast.Physical_BP, {
		})

		-- Magic BPs (BP Damage, Pet:MAB)
		sets.pet_midcast.Magic_BP_Base = {
			main="Gridarvor",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="Apogee Crown +1",
			neck="Adad Amulet", --neck="Summoner's Collar +2",
			ear1="Kyrene's Earring",
			ear2="Beckoner's Earring",
			body="Apo. Dalmatica +1",
			hands=gear.merlinicBPHands,
			ring1="Varar Ring +1",
			ring2="Varar Ring +1",
			legs="Apogee Slacks +1",
			back="Scintillating Cape",
			waist="Regal Belt",
			feet="Apogee Pumps +1",
		}

		sets.pet_midcast.Magic_BP_TP = set_combine(sets.pet_midcast.Magic_BP_Base, {
		})
	
		sets.pet_midcast.Magic_BP_NoTP = set_combine(sets.pet_midcast.Magic_BP_Base, {
		})
	
		sets.pet_midcast.Magic_BP_TP_Acc = set_combine(sets.pet_midcast.Magic_BP_TP, {
		})
	
		sets.pet_midcast.Magic_BP_NoTP_Acc = set_combine(sets.pet_midcast.Magic_BP_NoTP, {
		})

		-- Hybrid BPs (BP Damage >> Pet:MAB > Pet:Acc/Atk/Macc)
		sets.pet_midcast.FlamingCrush = {			
			main="Gridarvor",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="Apogee Crown +1",
			neck="Adad Amulet", --neck="Summoner's Collar +2",
			ear1="Kyrene's Earring",
			ear2="Beckoner's Earring",
			body="Apo. Dalmatica +1",
			hands=gear.merlinicBPHands,
			ring1="Varar Ring +1",
			ring2="Varar Ring +1",
			legs="Apogee Slacks +1",
			back="Scintillating Cape",
			waist="Regal Belt",
			feet="Apogee Pumps +1",
		}

		-- Magic Acc (Debuffs: Shock Squall, etc.)
		sets.pet_midcast.MagicAcc_BP = {}
		sets.pet_midcast.Debuff_Rage = sets.pet_midcast.MagicAcc_BP

		-- Summoning Magic (Buff Duration)
		sets.pet_midcast.SummoningMagic = {
			main="Espiritus", 
			ring1="Stikini Ring +1",
			ring2="Stikini Ring +1",
		}
	
		sets.pet_midcast.Buff = sets.pet_midcast.SummoningMagic

		sets.pet_midcast.Buff_Healing = set_combine(sets.pet_midcast.Buff, {
			feet="Apogee Pumps +1",
		})

		-- Wind's Blessing (Pet:MND increases potency)
		sets.pet_midcast.Buff_MND = set_combine(sets.pet_midcast.Buff, {
		})

	--[[ Sub-Job Related Sets ]]--
		sets.midcast.Cure = {
			sub="Enki Strap",
			head="Inyanga Tiara +2", --head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
			body="Inyanga Tiara +2", --body="Zendik Robe",
			hands="Inyanga Dastanas +2", --hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
			ring1="Stikini Ring +1", --ring1="Lebeche Ring",
			ring2="Stikini Ring +1", --ring2="Menelaus's Ring",			
			feet="Inyanga Crackows +2", --feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}
		}

		sets.midcast.Cursna = set_combine(sets.precast.FC, {
		})

		-- Just a standard set for spells that have no set
		sets.midcast.EnmityRecast = set_combine(sets.precast.FC, {
		})

		sets.midcast.Enfeeble = {
		}

		sets.midcast.Enfeeble.INT = set_combine(sets.midcast.Enfeeble, {
			--waist="Acuity Belt +1"
		})

		sets.midcast.Enhancing = {
			ring1="Stikini Ring +1",
			ring2="Stikini Ring +1",
		}

		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
			waist="Siegel Sash",
		})

		sets.midcast.Nuke = {
		}

		sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {
		})
	
		sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		})

		sets.precast.JA['Sublimation'] = {waist="Embla Sash"}
	
	--[[ Weaponskills ]]--
		sets.precast.WS['Myrkr'] = {
			head="Beckoner's Horn +2",
			body="Con. Doublet +1",
			hands="Con. Bracers +1",
			legs="Beck. Spats +2",
			feet="Con. Spats +1", --feet="Telchine Pigaches",
			--neck="Sanctity Necklace",
			--ear1="Evans Earring",
			ear2="Etiolation Earring",
			--ring1="Mephitas's Ring",
			--ring2="Mephitas's Ring +1",
			--back="Pahtli Cape",
			--waist="Shinjutsu-no-Obi",
		}

	--[[ Aftercast / Idle Sets ]]--
		sets.aftercast = {}
	
		-- Idle set with no avatar out.
		sets.baseIdle = {
			--main="Mpaca's Staff",
			--sub="Oneiros Grip",
			ammo="Sancus Sachet +1",
			head="Inyanga Tiara +2", --head="Convoker's Horn +3",
			neck="Sibyl Scarf", --neck="Loricate Torque +1",
			ear1="Cath Palug Earring",
			--ear2="Moonshade Earring",
			body="Apo. Dalmatica +1",
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring +1",
			back="Archon Cape",
			--waist="Regal Belt",
			legs="Inyanga Shalwar +2", --legs="Assiduity Pants +1",
			feet="Herald's Gaiters"
		}
		
		-- Idle set used when ForceIlvl is ON. Use this mode to avoid Gaiters dropping ilvl.
		sets.aftercast.Idle_Ilvl = set_combine(sets.aftercast.Idle, {
			feet="Baayami Sabots +1"
		})
		
		sets.aftercast.DT = sets.DT_Base
	
		-- Main refresh set - Many idle sets inherit from this set.
		sets.aftercast.Perp_Base = {
			--main="Mpaca's Staff",
			--sub="Oneiros Grip",
			ammo="Sancus Sachet +1",
			head="Inyanga Tiara +2", --head="Convoker's Horn +3",
			neck="Sibyl Scarf", --neck="Loricate Torque +1",
			ear1="Cath Palug Earring",
			--ear2="Moonshade Earring",
			body="Apo. Dalmatica +1",
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring +1",
			back="Scintillating Cape",
			--waist="Regal Belt",
			legs="Inyanga Shalwar +2", --legs="Assiduity Pants +1",
			feet="Herald's Gaiters"
		}
	
		sets.aftercast.Perp_Refresh = set_combine(sets.aftercast.Perp_Base, {
		})
	
		sets.aftercast.Perp_RefreshSub50 = set_combine(sets.aftercast.Perp_Refresh, {
		})

		sets.aftercast.Perp_Favor = set_combine(sets.aftercast.Perp_Refresh, {
		})
	
		sets.aftercast.Perp_Zendik = set_combine(sets.aftercast.Perp_Favor, {
		})
	
		-- TP set. Equipped when IdleMode is "DD" and MeleeMode is ON.
		sets.engaged = set_combine(sets.aftercast.Perp_Refresh, {
			head="Nyame Helm",
			neck="Deino Collar",
			ear1="Mache Earring +1",
			ear2="Cessance Earring", --ear2="Cessance Earring",
			body="Nyame Mail",
			hands="Nyame Gauntlets", --hands="Bunzi's Gloves",
			ring1="Chirich Ring +1",
			ring2="Chirich Ring +1",
			waist="Windbuffet Belt +1", --waist="Cetl Belt",
			legs="Nyame Flanchard", --legs="Convoker's Spats +3",
			feet="Nyame Sollerets", --feet="Convoker's Pigaches +3"
		})

		sets.baseMelee = sets.engaged

		-- Idle set used when you have a spirit summoned. Glyphic Spats will make them cast more frequently.
		sets.aftercast.Spirit = {
		}

	THSpells = S{"Dia","Dia II","Diaga"}
	sets.TH = {head="White Rarab Cap +1", waist="Chaac Belt", ammo="Perfect Lucky Egg"}

	sets.moveSpeed = {feet="Herald's Gaiters"}
end

function job_setup()
	Buff_BPs_Duration = S{'Shining Ruby','Aerial Armor','Frost Armor','Rolling Thunder','Crimson Howl','Lightning Armor','Ecliptic Growl','Glittering Ruby','Earthen Ward','Hastega','Noctoshield','Ecliptic Howl','Dream Shroud','Earthen Armor','Fleet Wind','Inferno Howl','Heavenward Howl','Hastega II','Soothing Current','Crystal Blessing','Katabatic Blades'}
	Buff_BPs_Healing = S{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}
	Buff_BPs_MND = S{"Wind's Blessing"}
	Debuff_BPs = S{'Mewing Lullaby','Eerie Eye','Lunar Cry','Lunar Roar','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Slowga','Tidal Roar','Diamond Storm','Sleepga','Shock Squall','Bitter Elegy','Lunatic Voice'}
	Debuff_Rage_BPs = S{'Moonlit Charge','Tail Whip'}	
	Magic_BPs_NoTP = S{'Holy Mist','Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Night Terror','Thunderspark','Tornado II','Sonic Buffet'}
	Magic_BPs_TP = S{'Impact','Conflag Strike','Level ? Holy','Lunar Bay'}
	Merit_BPs = S{'Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm'}
	Physical_BPs_TP = S{'Rock Buster','Mountain Buster','Crescent Fang','Spinning Dive','Roundhouse'}	
	ZodiacElements = S{'Fire','Earth','Water','Wind','Ice','Lightning'}
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="Base", idle=(sets.baseIdle), engaged=(sets.baseMelee)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Base", set={main="Malignance Pole", sub="Elan Strap +1"}},       
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
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup() -- Called from sharedFunctions' UserSetup
	--[[Setup my binds
	send_command('bind F9 gs c toggleGearMode')
	send_command('bind ^F9 gs c toggleWeaponMode')
	send_command('bind F10 gs c toggleModeMod')
	send_command('bind F11 gs c toggleAutoBuff')
	send_command('bind F12 input //gs reload')	
	send_command('bind != gs c elesiphon')]]--

    set_macro_page(1, 6)

	windower.send_command('wait 2; input /lockstyleset 10')
end

-------------------------------------------------------------------------------------------------------------------
-- Precast
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	-- Spell fast cast
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])	
	end

	-- BP Timer gear needs to swap here
	if (spell.type=="BloodPactWard" or spell.type=="BloodPactRage") then
		if not buffactive["Astral Conduit"] then
			equip(sets.midcast.BP)
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
-- Midcast
-------------------------------------------------------------------------------------------------------------------
function extendedJobMidcast(spell, action, spellMap, eventArgs)
	if (spell.type=="BloodPactWard" or spell.type=="BloodPactRage") then
		if not buffactive["Astral Conduit"] then
			equip(sets.midcast.BP)
		end
	elseif sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
    elseif spell.name=="Elemental Siphon" then
        if pet.element==world.day_element and ZodiacElements:contains(pet.element) then
            if pet.element==world.weather_element then
                equip(sets.midcast.SiphonWeatherZodiac)
            else
                equip(sets.midcast.SiphonZodiac)
            end
        else
            if pet.element==world.weather_element then
                equip(sets.midcast.SiphonWeather)
            else
                equip(sets.midcast.Siphon)
            end
        end
    elseif spell.type=="SummonerPact" then
        equip(sets.midcast.Summon)
    elseif string.find(spell.name,"Cure") or string.find(spell.name,"Curaga") then
        equip(sets.midcast.Cure)
    elseif string.find(spell.name,"Protect") or string.find(spell.name,"Shell") then
        equip(sets.midcast.Enhancing,{ring2="Sheltered Ring"})
    elseif spell.skill=="Enfeebling Magic" then
        equip(sets.midcast.Enfeeble)
    elseif spell.skill=="Enhancing Magic" then
        equip(sets.midcast.Enhancing)
    elseif spell.skill=="Elemental Magic" then
        equip(sets.midcast.Nuke)
    elseif spell.action_type=="Magic" then
        equip(sets.midcast.EnmityRecast)
    else
        equip(sets.baseIdle)
    end

    -- Treasure Hunter
    if THSpells:contains(spell.name) then
        equip(sets.TH)
    end

    -- Auto-cancel existing buffs
    if spell.name=="Stoneskin" and buffactive["Stoneskin"] then
        windower.send_command('cancel 37;')
    elseif spell.name=="Sneak" and buffactive["Sneak"] and spell.target.type=="SELF" then
        windower.send_command('cancel 71;')
    end
end

function job_pet_midcast(spell, action, spellMap, eventArgs)
	spellname = spell.english
    if spellname=="Perfect Defense" then
        equip(sets.pet_midcast.SummoningMagic)
    elseif Debuff_BPs:contains(spellname) then
        equip(sets.pet_midcast.MagicAcc_BP)
    elseif Buff_BPs_Healing:contains(spellname) then
        equip(sets.pet_midcast.Buff_Healing)
    elseif Buff_BPs_Duration:contains(spellname) then
        equip(sets.pet_midcast.Buff)
    elseif Buff_BPs_MND:contains(spellname) then
        equip(sets.pet_midcast.Buff_MND)
    elseif spellname=="Flaming Crush" then
		equip(sets.pet_midcast.FlamingCrush)
    elseif Magic_BPs_NoTP:contains(spellname) then
        if AccMode then
            equip(sets.pet_midcast.Magic_BP_NoTP_Acc)
        else
            equip(sets.pet_midcast.Magic_BP_NoTP)
        end
    elseif Magic_BPs_TP:contains(spellname) or string.find(spellname," II") or string.find(spellname," IV") then
        if AccMode then
            equip(sets.pet_midcast.Magic_BP_TP_Acc)
        else
            equip(sets.pet_midcast.Magic_BP_TP)
        end
    elseif Merit_BPs:contains(spellname) then
        if spellname=="Wind Blade" then
            equip(sets.pet_midcast.Magic_BP_NoTP)
        else
            equip(sets.pet_midcast.Magic_BP_TP)
        end
    elseif Debuff_Rage_BPs:contains(spellname) then
        equip(sets.pet_midcast.Debuff_Rage)
    else
        if Physical_BPs_TP:contains(spellname) then
            equip(sets.pet_midcast.Physical_BP_TP)
        else
            equip(sets.pet_midcast.Physical_BP)
        end
    end
end

function job_pet_aftercast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Post Midcast
-------------------------------------------------------------------------------------------------------------------
--[[
function job_post_midcast(spell, action, spellMap, eventArgs)
	-- if spell element matches day or weather element, and it's not a weaponskill, use mega obi
	if spell.type ~= 'WeaponSkill' then
		if (spell.element == world.day_element or spell.element == world.weather_element) then
			equip {waist="Hachirin-no-obi"}
		end
	end
end
]]--
-------------------------------------------------------------------------------------------------------------------
-- Aftercast
-------------------------------------------------------------------------------------------------------------------
--[[
function aftercast(spell)
    if pet_midaction() or spell.type=="Item" then
        return
    end
    if not string.find(spell.type,"BloodPact") then
        idle()
    end
end
]]--
-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	-- Elemental Siphon Handling
	if cmdParams[1]:lower() == 'elesiphon' then

		local elements = {
			["Wind"] = "Air Spirit",
			["Light"] = "Light Spirit",
			["Fire"] = "Fire Spirit",
			["Ice"] = "Ice Spirit",
			["Earth"] = "Earth Spirit",
			["Lightning"] = "Thunder Spirit",
			["Water"] = "Water Spirit",
			["Dark"] = "Dark Spirit"
		}
		
		local bestMatchDay = world.day_element
		local bestMatchVal = 1
		for ele,spirit in pairs(elements) do
			local thisVal = dayWeatherIntensity(ele)
			if thisVal > bestMatchVal then
				bestMatchVal = thisVal
				bestMatchDay = ele
			end
		end
		
		local startBuffVal = auto.buff.index
		auto.buff.index = 0
		send_command('input /release')
		send_command:schedule(2, 'input /ma '..elements[bestMatchDay]..' <me>')
		send_command:schedule(6, 'input /ja "Elemental Siphon" <me>')
		auto.buff.index = startBuffVal
	end	
end

-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping
-------------------------------------------------------------------------------------------------------------------
--[[
function job_get_spell_map(spell)
	if spell.type == 'BloodPactRage' then
		if magicalRagePacts:contains(spell.english) then
			return 'MagicalBloodPactRage'
		elseif hybridRagePacts:contains(spell.english) then
			return 'HybridBloodPactRage'
		else
			return 'PhysicalBloodPactRage'
		end
	end
	if spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
		return 'DebuffBloodPactWard'
	end
end
]]--
--[[
function pet_change(pet,gain)
    add_to_chat(1, 'pet_change called.  pet: '..pet.name..' gain: '..tostring(gain))
	-- Gain = true (we gained a pet) and we have a 'pet' sub table defined:
    if gain and gearMode[gearMode.index].pet then
        sets.idle = gearMode[gearMode.index].pet.idle
        sets.engaged = gearMode[gearMode.index].pet.engaged
    else
        -- Either Gain = false (lost the pet) OR we didn't define a pet table...so back to normal:
        sets.idle = gearMode[gearMode.index].idle
        sets.engaged = gearMode[gearMode.index].engaged
    end
end
]]--

-------------------------------------------------------------------------------------------------------------------
-- Auto tic ~once per second
-------------------------------------------------------------------------------------------------------------------
-- Gets the current number of available strategems based on the recast remaining and SCH level
function get_current_strategem_count()
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]
    local maxStrategems = 2
    local fullRechargeTime = 4*60
    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
    return currentCharges
end

function autoActions()
	local abil_recasts = windower.ffxi.get_ability_recasts()
	local rageRecast = abil_recasts[173]
	local wardRecast = abil_recasts[174]
	local subRecast = abil_recasts[234]
	local siphonRecast = abil_recasts[175]
	local astralFlowRecast = abil_recasts[0]
	local astralConduitRecast = abil_recasts[254]
	local hassoRecast = abil_recasts[138]
    local meditateRecast = abil_recasts[134]
	local currAvatar = windower.ffxi.get_mob_by_target('pet')
	local me = windower.ffxi.get_player()    

	-- Autobuff (Siphon, Sublimation, Favor)
	if (auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving) then
		--[[if player.mpp < 35 and siphonRecast == 0 then
			add_to_chat(122,'-- MP below 35% - Elemental Siphon! --')
			send_command('input //gs c elesiphon')
			return
		end]]--

		if not buffactive['Hasso'] and hassoRecast == 0 then
            add_to_chat(207, '[~ Hasso ~]')
            send_command('/hasso')
            return
        end

        if meditateRecast == 0 then
            add_to_chat(207, '[~ Meditate ~]')
            send_command('/meditate')
            return
        end

		-- Sublimation Handling if we're /sch
		if player.sub_job == 'SCH' then
			-- if sublimation not active and not on cooldown - use it.
			if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and subRecast == 0 then
				send_command('input /ja "Sublimation" <me>')
				return
			end
			-- if sublimation done charging and MP below 40% pop it for freeeeeee mp
			if buffactive['sublimation: complete'] and player.mpp < 40 and subRecast == 0 then
				add_to_chat(122,'-- MP below 40% - Popping Sublimation! --')
				send_command('input /ja "Sublimation" <me>')
				return
			end
		end
		-- Avatar's Favor Handling
		if pet.isvalid and not buffactive["Avatar's Favor"] then
			send_command('input /ja "Avatar\'s Favor" <me>')
		end
	end

	-- Autofite (Summons)
    if (auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving) then	
		
		--[[ /SCH Things ]]--
		if player.sub_job == 'SCH' then
			if not buffactive['Addendum: White'] then
				if buffactive['Light Arts'] then
					send_command('/addendumwhite')
					add_to_chat(122, '[Addendum: White]')
					return
				else
					send_command('/lightarts')
					add_to_chat(122, '[Light Arts]')
					return
				end
			end
			--[[
			if not buffactive['Regen'] then
				if get_current_strategem_count() > 1 then
					send_command('/accession')
					send_command:schedule(1, '/regen2')
					add_to_chat(122, '[Regen-ga]')
					return
				end
			end]]--a
		end

		-- Myrkr!
		if me.status == 1 then
			local enemy = windower.ffxi.get_mob_by_target('t')
			if player.mpp < 50 and player.tp > 1000 then
				add_to_chat(122,'-- MP below 50% - Myrkr! --')
				send_command('input /ws "Myrkr" <me>')
				return
			elseif player.tp > 1000 and me.status == 1 and enemy.hpp >= 80 then
				add_to_chat(122,'-- MP is fine - Smash! --')
				send_command('input /ws "Shell Crusher" <t>')
				return
			end
		end
		
		local mainAvatar = "Ifrit"	
		requiredAvatar = mainAvatar
		if not buffactive['Astral Flow'] and not buffactive['Astral Conduit'] then
			if not buffactive['Haste'] then
				requiredAvatar = 'Garuda'
			elseif not buffactive['TP Bonus'] then
				requiredAvatar = 'Shiva'
			elseif not buffactive['Shining Ruby'] then
				requiredAvatar = 'Carbuncle'
			--[[elseif not buffactive['Phalanx'] then
				requiredAvatar = 'Diabolos']]--
			else
				requiredAvatar = mainAvatar
			end
		end

		if pet.isvalid then
			if currAvatar.name ~= requiredAvatar then
				send_command('/release')
				add_to_chat(122, '[Release]')
				return
			end
		end

		-- Autoresummon pet
		if not pet.isvalid then
			send_command('/'..requiredAvatar)
			return
		end
		
		-- Auto assault
		if pet.isvalid then
			if me.status == 1 and currAvatar.status == 0 then
				send_command('/assault')
				add_to_chat(122, '[Assault]')
			end
		end

		if currAvatar.name == 'Ifrit' then

			if astralFlowRecast == 0 and astralConduitRecast == 0 and mainAvatar == "Ifrit" then
				send_command('/astralflow')
				send_command:schedule(1.0, '/astralconduit')
				add_to_chat(122, '[! Astral Flow ~ Astral Conduit !]')
				return
			end

			if buffactive['Astral Flow'] and not buffactive['Astral Conduit']  and astralConduitRecast == 0 then
				send_command('/astralconduit')
				return
			end

			if currAvatar.status == 1 and mainAvatar == "Ifrit" and rageRecast == 0 and player.mpp >= 35 then
				send_command('/flamingcrush')
				add_to_chat(122, '[Flaming Crush]')
				return
			end
			
			if not buffactive['Warcry'] and wardRecast == 0 then
				send_command('/crimsonhowl')
				add_to_chat(122, '[Crimson Howl]')
				return
			end
		end

		if currAvatar.name == 'Ramuh' then
			if currAvatar.status == 1 and mainAvatar == "Ramuh" and rageRecast == 0 and player.mpp >= 35 then
				send_command('/voltstrike')
				add_to_chat(122, '[Volt Strike]')
				return
			end
			--[[ Is this right? 
			if not buffactive['Warcry'] and wardRecast == 0 then
				send_command('/lightningarmor')
				add_to_chat(122, '[Lightning Armor]')
				return
			end
			]]--
		end

		if currAvatar.name == 'Carbuncle' then
			if partyLowHP(60) and wardRecast == 0 then
				send_command('/healingruby2')
				add_to_chat(122, '[Healing Ruby]')
			end

			if not buffactive['Shining Ruby'] and wardRecast == 0 then
				send_command('/shiningruby')
				add_to_chat(122, '[Shining Ruby]')
				return
			end
		end

		if currAvatar.name == 'Garuda' then
			if not buffactive['Haste'] and wardRecast == 0 then
				send_command('/Hastega II')
				add_to_chat(122, '[Hastega]')
				return
			end
		end

		if currAvatar.name == 'Diabolos' then
			if not buffactive['Phalanx'] and wardRecast == 0 then
				send_command('/noctoshield')
				add_to_chat(122, '[Noctoshield]')
				return
			end
		end

		if currAvatar.name == 'Shiva' then
			if not buffactive['TP Bonus'] and wardRecast == 0 then
				send_command('/Crystal Blessing')
				add_to_chat(122, '[Crystal Blessing]')
				return
			end
		end
	end
end