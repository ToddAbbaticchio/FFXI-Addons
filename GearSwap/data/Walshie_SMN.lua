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

	gear.petMagCape = {name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}}
	gear.petAtkCape = {name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}}

	sets.precast.FC = {		
		ammo="Incantor Stone",
		head="Bunzi's Hat",
		body="Inyanga Jubbah +2",
		feet="Merlinic Crackows",
		ear1="Etiolation Earring",
		ear2="Malignance Earring",
		ring1="Kishar Ring",
		waist="Embla Sash",

		--[[ ToDo:
		main={ name="Grioavolr", augments={'"Fast Cast"+6','INT+2','"Mag.Atk.Bns."+17',}}, -- +10
        neck="Orunmila's Torque", -- +5
        ear2="Loquacious Earring", -- +2
        hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
        ring1="Lebeche Ring",
        back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}},
        waist="Witful Belt", -- +3
        legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+6','CHR+6','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
        feet="Regal Pumps +1" -- +5~7
		]]--
	}

	sets.midcast = {}

	--[[ BP Timer Gear (BP Recast Reduction, Avatar's Favor) ]]--
    sets.midcast.BP = {
        main="Espiritus",
        sub="Vox Grip",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        --neck="Incanter's Torque",
        ear1="Cath Palug Earring",
        ear2="Lodurr Earring",
        body="Baayami Robe", -- +1
        hands="Baayami Cuffs", -- +1
        ring1="Stikini Ring +1",
        --ring2="Evoker's Ring",
        back="Conveyance Cape", 
        waist="Incarnation Sash", --waist="Kobo Obi",
        legs="Beckoner's Spats +2", --legs="Baayami Slops +1",
        feet="Baayami Sabots +1"
    }

	sets.BPReduction = {
		main="Espiritus",
        sub="Vox Grip",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        --neck="Incanter's Torque",
        ear1="Cath Palug Earring",
        ear2="Lodurr Earring",
        body="Baayami Robe", -- +1
        hands="Baayami Cuffs +1", -- +1
        ring1="Stikini Ring +1",
        --ring2="Evoker's Ring",
        back="Conveyance Cape", 
        waist="Incarnation Sash", --waist="Kobo Obi",
        legs="Convoker's Spats +1", --legs="Baayami Slops +1",
        feet="Baayami Sabots +1"
	}

	sets.SmnSkill = {
		main="Espiritus", 
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Baayami Hat", -- +1
		--neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		ear2="Lodurr Earring",
		body="Baayami Robe", -- +1
		hands="Baayami Cuffs",-- +1
		ring1="Stikini Ring +1",
		--ring2="Evoker's Ring",
		back="Conveyance Cape",
		waist="Incarnation Sash", ---waist="Kobo Obi",
		legs="Convoker's Spats +1", --legs="Baayami Slops +1",
		feet="Baayami Sabots +1"
	}

	sets.precast.BloodPactWard = set_combine(sets.SmnSkill, sets.BPReduction, {})
    sets.precast.BloodPactRage = set_combine(sets.SmnSkill, sets.BPReduction, {})

	-- Elemental Siphon sets. Zodiac Ring is affected by day, Chatoyant Staff by weather, and Twilight Cape by both.
	sets.midcast.Siphon = {
		main="Espiritus", 
		sub="Vox Grip",
		ammo="Esper Stone +1",
		head="Baayami Hat", -- +1
		--neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		ear2="Lodurr Earring",
		body="Baayami Robe", -- +1
		hands="Baayami Cuffs", -- +1
		ring1="Stikini Ring +1",
		--ring2="Evoker's Ring",
		back="Conveyance Cape",
		--waist="Kobo Obi",
		legs="Convoker's Spats +1", --legs="Baayami Slops +1",
		feet="Baayami Sabots +1", --feet="Beck. Pigaches +1"
	}	
    sets.midcast.SiphonZodiac = set_combine(sets.midcast.Siphon, {})--{ ring1="Zodiac Ring" }) -- in Storage
    sets.midcast.SiphonWeather = set_combine(sets.midcast.Siphon, { main="Chatoyant Staff" })    
    sets.midcast.SiphonWeatherZodiac = set_combine(sets.midcast.SiphonZodiac, { main="Chatoyant Staff" })

	--[[ Summoning Midcast (Spell Interruption (Baayami Robe +1 + 2 more), DT) ]]--
    sets.midcast.Summon = set_combine(sets.DT_Base, {
        body="Baayami Robe", -- +1
        --waist="Rumination Sash"
    })

	sets.midcast["Mana Cede"] = {hands="Beckoner's Bracers +2" } 
    sets.midcast["Astral Flow"] = {} --{ head="Glyphic Horn +3" }

	--[[ Blood Pacts ]]--
		sets.pet_midcast = {}

		-- Physical BPs (BP Damage, Pet:DA), (Volt Strike, Pred Claws, etc.)
		sets.pet_midcast.Physical_BP = {
			main="Gridarvor",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="Helios Band",
			neck="Shulmanu Collar", --neck="Summoner's Collar +2",
			ear1="Lugalbanda Earring",
			ear2="Beckoner's Earring +1",
			body="Glyphic Doublet +3", 
			hands="Merlinic Dastanas", 
			ring1="Cath Palug Ring",
			ring2="Varar Ring +1",
			back=gear.petAtkCape,
			waist="Incarnation Sash",
			legs="Apogee Slacks +1",
			feet="Helios Boots",
		}

		-- Physical pacts which benefit more from TP than Pet:DA (like Spinning Dive and other pacts you never use except that one time)
		sets.pet_midcast.Physical_BP_TP = set_combine(sets.pet_midcast.Physical_BP, {
			head="Apogee Crown +1",
			--ear2="Gelos Earring",
			--body="Convoker's Doublet +3",
			ring1="Varar Ring +1",
			waist="Regal Belt",
			--legs="Enticer's Pants",
			name="Apogee Pumps +1",
		})
		
		-- Used for all physical pacts when AccMode is true
		sets.pet_midcast.Physical_BP_Acc = set_combine(sets.pet_midcast.Physical_BP, {
			name="Apogee Crown +1",
			--body="Convoker's Doublet +3",
			hands="Merlinic Dastanas",
			--feet="Convoker's Pigaches +3"
		})

		-- Magic BPs (BP Damage, Pet:MAB)
		sets.pet_midcast.Magic_BP_Base = {
			main="Grioavolr",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="Cath Palug Crown",
			neck="Adad Amulet", --neck="Summoner's Collar +2",
			ear1="Lugalbanda Earring",
			ear2="Beckoner's Earring +1",
			body="Apo. Dalmatica +1",
			hands="Merlinic Dastanas",
			ring1="Varar Ring +1",
			ring2="Varar Ring +1",
			legs="Apogee Slacks +1",
			back=gear.petMagCape,
			waist="Regal Belt",
			feet="Apogee Pumps +1",
		}

		-- Some magic pacts benefit more from TP than others.
		-- Note: This set will only be used on merit pacts if you have less than 4 merits.
		--       Make sure to update your merit values at the top of this Lua.
		sets.pet_midcast.Magic_BP_TP = set_combine(sets.pet_midcast.Magic_BP_Base, {
			--legs="Enticer's Pants"
		})
	
		-- NoTP set used when you don't need Enticer's
		sets.pet_midcast.Magic_BP_NoTP = set_combine(sets.pet_midcast.Magic_BP_Base, {
			legs="Apogee Slacks +1",
		})
	
		sets.pet_midcast.Magic_BP_TP_Acc = set_combine(sets.pet_midcast.Magic_BP_TP, {
			--head={ name="Merlinic Hood", augments={'Pet: Mag. Acc.+21 Pet: "Mag.Atk.Bns."+21','Blood Pact Dmg.+7','Pet: INT+6','Pet: "Mag.Atk.Bns."+11',}},
			--body="Convoker's Doublet +3",
			--hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+29','Blood Pact Dmg.+10','Pet: INT+7','Pet: "Mag.Atk.Bns."+10',}}
		})
	
		sets.pet_midcast.Magic_BP_NoTP_Acc = set_combine(sets.pet_midcast.Magic_BP_NoTP, {
			--head={ name="Merlinic Hood", augments={'Pet: Mag. Acc.+21 Pet: "Mag.Atk.Bns."+21','Blood Pact Dmg.+7','Pet: INT+6','Pet: "Mag.Atk.Bns."+11',}},
			--body="Convoker's Doublet +3",
			--hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+29','Blood Pact Dmg.+10','Pet: INT+7','Pet: "Mag.Atk.Bns."+10',}}
		})

		-- Hybrid BPs (BP Damage >> Pet:MAB > Pet:Acc/Atk/Macc)
		sets.pet_midcast.FlamingCrush = {			
			main="Grioavolr",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head="Cath Palug Crown",
			neck="Adad Amulet", --neck="Summoner's Collar +2",
			ear1="Lugalbanda Earring",
			ear2="Beckoner's Earring +1",
			body="Apogee Dalmatica +1", --body="Convoker's Doublet +3",
			hands="Merlinic Dastanas",
			ring1="Varar Ring +1",
			ring2="Varar Ring +1",
			back=gear.petMagCape,
			waist="Regal Belt",
			legs="Apogee Slacks +1", -- This is Path D, could also be Path A
			feet="Apogee Pumps +1",
		}

		-- Magic Acc (Debuffs: Shock Squall, etc.)
		sets.pet_midcast.MagicAcc_BP = {
			main="Espiritus",
			sub="Vox Grip",
			ammo="Sancus Sachet +1",
			head="Beckoner's Horn +2", --head="Convoker's Horn +3",
			neck="Adad Amulet",--neck="Summoner's Collar +2",
			ear1="Lugalbanda Earring",
			ear2="Beckoner's Earring +1",
			body="Convoker's Doublet +1", --body="Convoker's Doublet +3",
			hands="Convoker's Bracers +1", --hands="Lamassu Mitts +1",
			ring1="Cath Palug Ring",
			--ring2="Evoker's Ring",
			back=gear.petMagCape,
			waist="Regal Belt",
			legs="Convoker's Spats +1", --legs="Convoker's Spats +3",
			feet="Convoker's Pigaches +1",--feet="Bunzi's Sabots"
		}
		sets.pet_midcast.Debuff_Rage = sets.pet_midcast.MagicAcc_BP

		-- Summoning Magic (Buff Duration)
		sets.pet_midcast.SummoningMagic = {
			main="Espiritus", 
			sub="Vox Grip",
			ammo="Sancus Sachet +1",
			head="Baayami Hat", -- +1
			--neck="Incanter's Torque",
			ear1="Cath Palug Earring",
			ear2="Lodurr Earring",
			body="Baayami Robe", -- +1
			hands="Baayami Cuffs",-- +1
			ring1="Stikini Ring +1",
			--ring2="Evoker's Ring",
			back="Conveyance Cape",
			waist="Incarnation Sash", ---waist="Kobo Obi",
			legs="Convoker's Spats +1", --legs="Baayami Slops +1",
			feet="Baayami Sabots +1"
		}
	
		sets.pet_midcast.Buff = sets.pet_midcast.SummoningMagic

		sets.pet_midcast.Buff_Healing = set_combine(sets.pet_midcast.Buff, {
			--main="Nirvana",
			--back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
			--body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
			feet="Apogee Pumps +1",
		})

		-- Wind's Blessing (Pet:MND increases potency)
		sets.pet_midcast.Buff_MND = set_combine(sets.pet_midcast.Buff, {
			--main="Nirvana",
			--neck="Summoner's Collar +2",
			--hands="Lamassu Mitts +1",
			--back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
			--legs="Assiduity Pants +1",
			--feet="Bunzi's Sabots"
		})

	--[[ Sub-Job Related Sets ]]--
		sets.midcast.Cure = {
			--main="Nirvana",
			--sub="Clerisy Strap +1",
			sub="Enki Strap",
			head="Inyanga Tiara +2", --head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
			--neck="Orunmila's Torque",
			--ear1="Meili Earring",
			ear2="Novia Earring",
			body="Inyanga Tiara +2", --body="Zendik Robe",
			hands="Inyanga Dastanas +2", --hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
			ring1="Stikini Ring +1", --ring1="Lebeche Ring",
			ring2="Sirona's Ring", --ring2="Menelaus's Ring",
			back="Perimede Cape",--back="Tempered Cape +1",
			waist="Bishop's Sash", --waist="Luminary Sash",
			legs="Doyen Pants", --legs="Convoker's Spats +3",
			feet="Inyanga Crackows +2", --feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}
		}

		sets.midcast.Cursna = set_combine(sets.precast.FC, {
			--neck="Debilis Medallion",
			--ear1="Meili Earring",
			--ear2="Beatific Earring",
			--ring1="Menelaus's Ring",
			--ring2="Haoma's Ring",
			--back="Tempered Cape +1",
			waist="Bishop's Sash",
			--feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
		})

		-- Just a standard set for spells that have no set
		sets.midcast.EnmityRecast = set_combine(sets.precast.FC, {
			--main="Nirvana",
			ear1="Novia Earring",
			--body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}}
		})

		sets.midcast.Enfeeble = {
			--main="Contemplator +1", or Daybreak
			sub="Enki Strap", -- Ammurapi with Daybreak
			--head=empty,
			--neck="Erra Pendant",
			ear1="Malignance Earring",
			--ear2="Dignitary's Earring",
			--body="Cohort Cloak +1",
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			--ring2={name="Stikini Ring +1", bag="wardrobe4"},
			--back="Aurist's Cape +1",
			--waist="Luminary Sash",
			legs="Inyanga Shalwar +2",
			--feet="Skaoi Boots"
		}

		sets.midcast.Enfeeble.INT = set_combine(sets.midcast.Enfeeble, {
			--waist="Acuity Belt +1"
		})

		sets.midcast.Enhancing = {
			--main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','DEX+1','Mag. Acc.+5','"Mag.Atk.Bns."+18','DMG:+4',}},
			--sub="Ammurapi Shield",
			--head={ name="Telchine Cap", augments={'Mag. Evasion+24','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
			--neck="Incanter's Torque",
			--ear1="Mimir Earring",
			--ear2="Andoaa Earring",
			--body={ name="Telchine Chas.", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			--hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
			ring1="Stikini Ring +1",
			--ring2={name="Stikini Ring +1", bag="wardrobe4"},
			--back="Merciful Cape",
			waist="Embla Sash",
			--legs={ name="Telchine Braconi", augments={'Mag. Evasion+25','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
			--feet={ name="Telchine Pigaches", augments={'Mag. Evasion+24','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}}
		}

		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
			--neck="Nodens Gorget",
			--ear2="Earthcry Earring",
			waist="Siegel Sash",
			--legs="Shedir Seraweels"
		})

		sets.midcast.Nuke = {
			--main={ name="Grioavolr", augments={'"Fast Cast"+6','INT+2','"Mag.Atk.Bns."+17',}},
			--sub="Niobid Strap",
			head="Cath Palug Crown",
			--neck="Sanctity Necklace",
			ear1="Malignance Earring",
			ear2="Friomisi Earring",
			--body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			--hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			--ring1="Freke Ring",
			--ring2="Shiva Ring +1",
			--back={ name="Campestres's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			waist="Eschan Stone",
			--legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			--feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}}
		}

		sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {
			--1head="Amalric Coif +1",
			waist="Gishdubar Sash"
		})
	
		sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
			--main="Vadose Rod",
			--head="Amalric Coif +1"
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
			body="Inyanga Jubbah +2", --body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Defending Ring",
			back="Archon Cape",
			waist="Regal Belt",
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
			--main="Nirvana",
			--sub="Oneiros Grip",
			ammo="Sancus Sachet +1",
			head="Convoker's Horn +1", --head="Convoker's Horn +3",
			neck="Sibyl Scarf", --neck="Caller's Pendant",
			ear1="Cath Palug Earring",
			--ear2="Moonshade Earring",
			body="Inyanga Jubbah +2", --body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
			hands="Inyanga Dastanas +2", --hands={ name="Merlinic Dastanas", augments={'Pet: Crit.hit rate +2','"Mag.Atk.Bns."+25','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
			ring1="Stikini Ring +1",
			--ring2="Evoker's Ring",
			back="Campestres's Cape",
			--waist="Lucidity Sash",
			legs="Inyanga Shalwar +2", --legs="Assiduity Pants +1",
			feet="Baayami Sabots +1"
		}
	
		-- Refresh set with avatar out. Equipped when IdleMode is "Refresh".
		sets.aftercast.Perp_Refresh = set_combine(sets.aftercast.Perp_Base, {
		})
	
		-- Refresh set when MP is under 50%
		sets.aftercast.Perp_RefreshSub50 = set_combine(sets.aftercast.Perp_Refresh, {
			waist="Fucho-no-obi"
		})
		
		-- Used when IdleMode is "Favor" to maximize avatar's favor effect.
		-- Skill tiers are 512 / 575 / 670
		sets.aftercast.Perp_Favor = set_combine(sets.aftercast.Perp_Refresh, {
			head="Beckoner's Horn +2",
			ear2="Lodurr Earring",
			ring1="Stikini Ring +1",
			--ring2="Evoker's Ring",
			feet="Baayami Sabots +1"
		})
	
		sets.aftercast.Perp_Zendik = set_combine(sets.aftercast.Perp_Favor, {
			--body="Zendik Robe"
		})
	
		-- TP set. Equipped when IdleMode is "DD" and MeleeMode is ON.
		sets.engaged = set_combine(sets.aftercast.Perp_Refresh, {
			head="Beckoner's Horn +2", --head="Convoker's Horn +3",
			neck="Shulmanu Collar",
			ear1="Telos Earring",
			ear2="Brutal Earring", --ear2="Cessance Earring",
			body="Tali'ah Manteel +2",
			hands="Nyame Gauntlets", --hands="Bunzi's Gloves",
			ring1="Petrov Ring", --ring1={ name="Chirich Ring +1", bag="wardrobe2" },
			--ring2={ name="Chirich Ring +1", bag="wardrobe4" },
			--back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist="Windbuffet Belt +1", --waist="Cetl Belt",
			legs="Nyame Flanchard", --legs="Convoker's Spats +3",
			feet="Nyame Sollerets", --feet="Convoker's Pigaches +3"
		})

		sets.baseMelee = sets.engaged

		-- Idle set used when you have a spirit summoned. Glyphic Spats will make them cast more frequently.
		sets.aftercast.Spirit = {
			--main="Nirvana",
			sub="Vox Grip",
			ammo="Sancus Sachet +1",
			--head="Convoker's Horn +3",
			--neck="Incanter's Torque",
			ear1="Cath Palug Earring",
			--ear2="Evans Earring",
			body="Baayami Robe", -- +1
			hands="Baayami Cuffs", -- +1
			ring1="Stikini Ring +1",
			--ring2="Evoker's Ring",
			back="Conveyance Cape",
			--waist="Lucidity Sash",
			--legs="Glyphic Spats +3",
			feet="Baayami Sabots +1"
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
	local currAvatar = windower.ffxi.get_mob_by_target('pet')
	local me = windower.ffxi.get_player()    

	-- Autobuff (Siphon, Sublimation, Favor)
	if (auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving) then
		if player.mpp < 35 and siphonRecast == 0 then
			add_to_chat(122,'-- MP below 35% - Elemental Siphon! --')
			send_command('input //gs c elesiphon')
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
				--[[
			elseif player.tp > 1000 and me.status == 1 and enemy.hpp >= 80 then
				add_to_chat(122,'-- MP is fine - Smash! --')
				send_command('input /ws "Shell Crusher" <t>')
				return]]--
			end
		end
		
		local mainAvatar = "Ifrit"	
		requiredAvatar = mainAvatar
		if not buffactive['Astral Flow'] and not buffactive['Astral Conduit'] then
			if not buffactive['Haste'] then
				requiredAvatar = 'Garuda'
			elseif not buffactive['TP Bonus'] then
				requiredAvatar = 'Shiva'
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