-- Summoner Gearswap Lua by Pergatory - http://pastebin.com/u/pergatory
-- IdleMode determines the set used after casting. You change it with "/console gs c <IdleMode>"
-- The modes are:
-- Refresh: Uses the most refresh available.
-- DT: A mix of refresh, PDT, and MDT to help when you can't avoid AOE.
-- PetDT: Sacrifice refresh to reduce avatar's damage taken. WARNING: Selenian Cap drops you below 119, use with caution!
-- DD: When melee mode is on and you're engaged, uses TP gear. Otherwise, avatar melee gear.
-- Favor: Uses Beckoner's Horn +1 and max smn skill to boost the favor effect.
-- Zendik: Favor build with the Zendik Robe added in, for Shiva's Favor in manaburn parties. (Shut up, it sounded like a good idea at the time)

-- Additional Bindings:
-- F9 - Toggles between a subset of IdleModes (Refresh > DT > PetDT)
-- F10 - Toggles MeleeMode (When enabled, equips Nirvana and Elan+1, then disables those 2 slots from swapping)
--       NOTE: If you don't already have the Nirvana & Elan+1 equipped, YOU WILL LOSE TP

-- Additional Commands:
-- /console gs c AccMode - Toggles high-accuracy sets to be used where appropriate.
-- /console gs c ImpactMode - Toggles between using normal magic BP set for Fenrir's Impact or a custom high-skill set for debuffs.
-- /console gs c ForceIlvl - I have this set up to override a few specific slots where I normally use non-ilvl pieces.
-- /console gs c TH - Treasure Hunter toggle. By default, this is only used for Dia, Dia II, and Diaga.
-- /console gs c LagMode - Used to help BPs land in the right gear in high-lag situations.
--							Sets a timer to swap gear 0.5s after the BP is used rather than waiting for server response.

function file_unload()
    send_command('unbind ^=')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind F9')
	send_command('unbind ^F9')
	send_command('unbind F10')
	send_command('unbind F11')
	send_command('unbind F12')
end

function get_sets()
	send_command('bind f9 gs c ToggleIdle') -- F9 = Cycle through commonly used idle modes
	send_command('bind ^f9 gs c ForceIlvl') -- Ctrl+F9 = Toggle ForceIlvl
	send_command('bind f10 gs c MeleeMode') -- F10 = Toggle Melee Mode
	send_command('bind ^f10 gs c TH') -- Ctrl+F10 = Treasure Hunter toggle
	
	MeteorStrike = 5
    HeavenlyStrike = 1
    WindBlade = 1
    Geocrush = 1
    Thunderstorm = 1
    GrandFall = 1
 
    StartLockStyle = '7'
    IdleMode = 'Refresh'
    AccMode = false
    ImpactDebuff = false
    MeleeMode = false
    TreasureHunter = false
    THSpells = S{"Dia","Dia II","Diaga"} -- If you want Treasure Hunter gear to swap for a spell/ability, add it here.
    ForceIlvl = false
    LagMode = false -- Default LagMode. If you have a lot of lag issues, change to "true".
    AutoRemedy = false -- Auto Remedy when using an ability while Paralyzed.
    AutoEcho = false -- Auto Echo Drop when using an ability while Silenced.
    SacTorque = false -- If you have Sacrifice Torque, this will auto-equip it when slept in order to wake up.
	


	-- Base Damage Taken Set - Mainly used when IdleMode is "DT"
	sets.DT_Base = {
		sub="Elan strap +1",
		head="Beckoner's Horn +1",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
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

	sets.precast = {}
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

    sets.midcast = {}
    sets.midcast.BP = {
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Con. Bracers +1",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		--back="Samanisi Cape"
	}

	-- Elemental Siphon sets. Zodiac Ring is affected by day, Chatoyant Staff by weather, and Twilight Cape by both.
    sets.midcast.Siphon = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Esper Stone +1",
		head="Baayami Hat +1",
		neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		ear2="Lodurr Earring",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+12','Blood Pact Dmg.+2',}},
		waist="Kobo Obi",
		legs="Baayami Slops +1",
		feet="Beck. Pigaches +1"
	}
	sets.midcast.SiphonZodiac = set_combine(sets.midcast.Siphon, { ring1="Zodiac Ring" })
	sets.midcast.SiphonWeather = set_combine(sets.midcast.Siphon, { main="Chatoyant Staff" })
	sets.midcast.SiphonWeatherZodiac = set_combine(sets.midcast.SiphonZodiac, { main="Chatoyant Staff" })

	-- Summoning Midcast, cap spell interruption if possible (Baayami Robe gives 100, need 2 more)
	-- PDT isn't a bad idea either, so don't overwrite a lot from the DT set it inherits from.
	sets.midcast.Summon = set_combine(sets.DT_Base, {
	--	body="Baayami Robe +1",
	--	waist="Rumination Sash"
	})

	-- If you ever lock your weapon, keep that in mind when building cure potency set.
	sets.midcast.Cure = {
		sub="Achaq Grip",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck="Orunmila's Torque",
		ear1="Meili Earring",
		ear2="Novia Earring",
		body="Zendik Robe",
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
		ring1="Lebeche Ring",
		ring2="Menelaus's Ring",
		back="Tempered Cape +1",
		waist="Luminary Sash",
		legs="Convoker's Spats +3",
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}
	}

	sets.midcast.Cursna = set_combine(sets.precast.FC, {
		neck="Debilis Medallion",
		ear1="Meili Earring",
		ear2="Beatific Earring",
		ring1="Menelaus's Ring",
		ring2="Haoma's Ring",
		back="Tempered Cape +1",
		waist="Bishop's Sash",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	})
	
	-- Just a standard set for spells that have no set
	sets.midcast.EnmityRecast = set_combine(sets.precast.FC, {
		ear1="Novia Earring",
		body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}}
	})

	-- Strong alternatives: Daybreak and Ammurapi Shield, Cath Crown, Gwati Earring
	sets.midcast.Enfeeble = {
		sub="Enki Strap",
		--head=empty,
		neck="Erra Pendant",
		ear1="Malignance Earring",
		ear2="Dignitary's Earring",
		body="Cohort Cloak +1",
		hands="Inyanga Dastanas +2",
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2={name="Stikini Ring +1", bag="wardrobe4"},
		back="Aurist's Cape +1",
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet="Skaoi Boots"
	}

	sets.midcast.Enhancing = {
		head={ name="Telchine Cap", augments={'Mag. Evasion+24','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		body={ name="Telchine Chas.", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2={name="Stikini Ring +1", bag="wardrobe4"},
		back="Merciful Cape",
		waist="Embla Sash",
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+25','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+24','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}}
	}

	sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
		neck="Nodens Gorget",
		ear2="Earthcry Earring",
		waist="Siegel Sash",
		--legs="Shedir Seraweels"
	})

	sets.midcast.Nuke = {
		head="Cath Palug Crown",
		neck="Sanctity Necklace",
		ear1="Malignance Earring",
		ear2="Friomisi Earring",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		ring1="Freke Ring",
		ring2="Shiva Ring +1",
		back={ name="Campestres's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
		waist="Eschan Stone",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}}
	}

    sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {waist="Gishdubar Sash"})
	sets.midcast["Mana Cede"] = { hands="Beckoner's Bracers +1" }
    sets.midcast["Astral Flow"] = { head="Glyphic Horn +3" }
	
	-- ===================================================================================================================
	--	Weaponskills
	-- ===================================================================================================================
	sets.midcast['Myrkr'] = {
        head="Beckoner's Horn +1",
        body="Con. Doublet +1",
        hands="Con. Bracers +1",
        legs="Beck. Spats +1",
        feet="Telchine Pigaches",
        neck="Sanctity Necklace",
        ear1="Evans Earring",
        ear2="Etiolation Earring",
        ring1="Evoker's Ring",
        ring2="Mephitas's Ring +1",
        back="Pahtli Cape",
        waist="Shinjutsu-no-Obi",
    }

	sets.pet_midcast = {}

	-- Main physical pact set (Volt Strike, Pred Claws, etc.)
	-- Prioritize BP Damage & Pet: Double Attack
	-- Strong Alternatives:
	-- Gridarvor, Apogee Crown, Apogee Pumps, Convoker's Doublet, Apogee Dalmatica, Shulmanu Collar (equal to ~R15 Collar), Gelos Earring, Regal Belt
	sets.pet_midcast.Physical_BP = {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Inyan. Dastanas +2",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	}

	-- Physical Pact AM3 set, less emphasis on Pet:DA
	sets.pet_midcast.Physical_BP_AM3 = set_combine(sets.pet_midcast.Physical_BP, {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Inyan. Dastanas +2",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	})

	-- Physical pacts which benefit more from TP than Pet:DA (like Spinning Dive and other pacts you never use except that one time)
	sets.pet_midcast.Physical_BP_TP = set_combine(sets.pet_midcast.Physical_BP, {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Inyan. Dastanas +2",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	})

	-- Used for all physical pacts when AccMode is true
	sets.pet_midcast.Physical_BP_Acc = set_combine(sets.pet_midcast.Physical_BP, {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Inyan. Dastanas +2",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	})

	-- Base magic pact set
	-- Prioritize BP Damage & Pet:MAB
	-- Strong Alternatives:
	-- Espiritus, Apogee Crown, Adad Amulet (equal to ~R12 Collar)
	sets.pet_midcast.Magic_BP_Base = {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Asteria Mitts",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	}
	
	-- Some magic pacts benefit more from TP than others.
	-- Note: This set will only be used on merit pacts if you have less than 4 merits.
	--       Make sure to update your merit values at the top of this Lua.
	sets.pet_midcast.Magic_BP_TP = set_combine(sets.pet_midcast.Magic_BP_Base, {legs="Enticer's Pants"})

	-- NoTP set used when you don't need Enticer's
	sets.pet_midcast.Magic_BP_NoTP = set_combine(sets.pet_midcast.Magic_BP_Base, {legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}})

	sets.pet_midcast.Magic_BP_TP_Acc = set_combine(sets.pet_midcast.Magic_BP_TP, {
		head={ name="Merlinic Hood", augments={'Pet: Mag. Acc.+21 Pet: "Mag.Atk.Bns."+21','Blood Pact Dmg.+7','Pet: INT+6','Pet: "Mag.Atk.Bns."+11',}},
		body="Convoker's Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+29','Blood Pact Dmg.+10','Pet: INT+7','Pet: "Mag.Atk.Bns."+10',}}
	})

	sets.pet_midcast.Magic_BP_NoTP_Acc = set_combine(sets.pet_midcast.Magic_BP_NoTP, {
		head={ name="Merlinic Hood", augments={'Pet: Mag. Acc.+21 Pet: "Mag.Atk.Bns."+21','Blood Pact Dmg.+7','Pet: INT+6','Pet: "Mag.Atk.Bns."+11',}},
		body="Convoker's Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+29','Blood Pact Dmg.+10','Pet: INT+7','Pet: "Mag.Atk.Bns."+10',}}
	})

	-- Favor BP Damage above all. Pet:MAB also very strong.
	-- Pet: Accuracy, Attack, Magic Accuracy moderately important.
	-- Strong Alternatives:
	-- Keraunos, Grioavolr, Espiritus, Was, Apogee Crown, Apogee Dalmatica, Adad Amulet
	sets.pet_midcast.FlamingCrush = {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Asteria Mitts",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	}

	sets.pet_midcast.FlamingCrush_Acc = set_combine(sets.pet_midcast.FlamingCrush, {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Asteria Mitts",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	})

	-- Pet: Magic Acc set - Mainly used for debuff pacts like Shock Squall
	sets.pet_midcast.MagicAcc_BP = {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Asteria Mitts",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	}

	sets.pet_midcast.Debuff_Rage = sets.pet_midcast.MagicAcc_BP

	-- Pure summoning magic set, mainly used for buffs like Hastega II.
	-- Strong Alternatives:
	-- Andoaa Earring, Summoning Earring, Lamassu Mitts +1, Caller's Pendant
	sets.pet_midcast.SummoningMagic = {
		--sub="Elan strap +1",
		head="Con. Horn +1",
		--body="Con. Doublet +1",
		hands="Inyan. Dastanas +2",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		--left_ear="Evans Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	--	back="Samanisi Cape"
	}

	sets.pet_midcast.Buff = sets.pet_midcast.SummoningMagic
	
	-- Wind's Blessing set. Pet:MND increases potency.
	sets.pet_midcast.Buff_MND = set_combine(sets.pet_midcast.Buff, {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Asteria Mitts",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	})

	-- Don't drop Avatar level in this set if you can help it.
	-- You can use Avatar:HP+ gear to increase the HP recovered, but most of it will decrease your own max HP.
	sets.pet_midcast.Buff_Healing = set_combine(sets.pet_midcast.Buff, {
		sub="Elan strap +1",
		head="Con. Horn +1",
		body="Con. Doublet +1",
		hands="Asteria Mitts",
		legs="Beck. Spats +1",
		feet="Con. Pigaches +1",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Gelos Earring",
		right_ear="Andoaa Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back="Campestres's Cape"
	})

	-- This set is used for certain blood pacts when ImpactDebuff mode is turned ON. (/console gs c ImpactDebuff)
	-- These pacts are normally used with magic damage gear, but they're also strong debuffs when enhanced by summoning skill.
	-- This set is safe to ignore.
	sets.pet_midcast.Impact = set_combine(sets.pet_midcast.SummoningMagic, {
		main="Nirvana",
		head="Convoker's Horn +3",
		ear1="Lugalbanda Earring",
		ear2="Enmerkar Earring",
		hands="Lamassu Mitts +1"
	})

	sets.aftercast = {}

	-- Idle set with no avatar out.
	sets.aftercast.Idle = {
		sub="Elan strap +1",
		head="Beckoner's Horn +1",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
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
	
	-- Idle set used when ForceIlvl is ON. Use this mode to avoid Gaiters dropping ilvl.
	sets.aftercast.Idle_Ilvl = set_combine(sets.aftercast.Idle, {
		feet="Baayami Sabots +1"
	})
	
	sets.aftercast.DT = sets.DT_Base

	-- Main refresh set - Many idle sets inherit from this set.
	-- Put common items here so you don't have to repeat them over and over.
	-- Strong Alternatives:
	-- Gridarvor, Asteria Mitts, Shomonjijoe, Beckoner's Horn, Evans Earring, Isa Belt
	sets.aftercast.Perp_Base = {
		sub="Elan strap +1",
		head="Beckoner's Horn +1",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
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

	-- Avatar Melee set. Equipped when IdleMode is "DD" and MeleeMode is OFF.
	-- You really don't need this set. It's only here because I can't bring myself to throw it away.
	sets.aftercast.Perp_DD = set_combine(sets.aftercast.Perp_Base, {
		sub="Elan strap +1",
		head="Beckoner's Horn +1",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Assid. Pants +1",
		feet="Bunzi's Sabots",
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear="Andoaa Earring",
		left_ring="Evoker's Ring",
		right_ring="Karieyh Ring +1",
		back="Campestres's Cape"
	})

	-- Refresh set with avatar out. Equipped when IdleMode is "Refresh".
	sets.aftercast.Perp_Refresh = set_combine(sets.aftercast.Perp_Base, {
	})

	-- Refresh set when MP is under 50%
	-- If you have Fucho and don't need Lucidity Sash for perp down, you can uncomment the belt here to enable using it.
	sets.aftercast.Perp_RefreshSub50 = set_combine(sets.aftercast.Perp_Refresh, {
		--waist="Fucho-no-obi"
	})
	
	-- Used when IdleMode is "Favor" to maximize avatar's favor effect.
	-- Skill tiers are 512 / 575 / 670
	sets.aftercast.Perp_Favor = set_combine(sets.aftercast.Perp_Refresh, {
		head="Beckoner's Horn +1",
		ear2="Lodurr Earring",
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2="Evoker's Ring",
		feet="Baayami Sabots +1"
	})

	sets.aftercast.Perp_Zendik = set_combine(sets.aftercast.Perp_Favor, {
		body="Zendik Robe"
	})

	-- TP set. Equipped when IdleMode is "DD" and MeleeMode is ON.
	sets.aftercast.Perp_Melee = set_combine(sets.aftercast.Perp_Refresh, {
		head="Convoker's Horn +3",
		neck="Shulmanu Collar",
		ear1="Telos Earring",
		ear2="Cessance Earring",
		body="Tali'ah Manteel +2",
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+3','Accuracy+12','"Store TP"+7','Accuracy+7 Attack+7',}},
		ring1="Rajas Ring",
		ring2="Petrov Ring",
		back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Cetl Belt",
		legs="Convoker's Spats +3",
		feet="Convoker's Pigaches +3"
	})

	-- Pet:DT build. Equipped when IdleMode is "PetDT". Note: Avatars only need -31 PDT to cap, MDT is the hard one to cap.
	-- Strong alternatives:
	-- Selenian Cap, Enmerkar Earring, Handler's Earring, Rimeice Earring, Thurandaut Ring, Tali'ah Seraweels
	sets.aftercast.Avatar_DT = {
		main="Nirvana",
		sub="Oneiros Grip",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown +1", augments={'Pet: Accuracy+25','"Avatar perpetuation cost"+7','Pet: Damage taken -4%',}},
		neck="Summoner's Collar +2",
		ear1="Cath Palug Earring",
		ear2="Enmerkar Earring",
		body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
		hands={ name="Telchine Gloves", augments={'Pet: Mag. Evasion+18','Pet: "Regen"+3','Pet: Damage taken -4%',}},
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2={name="Stikini Ring +1", bag="wardrobe4"},
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
		waist="Isa Belt",
		legs="Enticer's Pants",
		feet={ name="Telchine Pigaches", augments={'Pet: Mag. Evasion+20','Pet: "Regen"+3','Pet: Damage taken -4%',}}
	}

	-- Perp down set used when ForceIlvl is ON. If you use Selenian Cap for Pet:DT, you can make another set here without it.
	sets.aftercast.Avatar_DT_Ilvl = set_combine(sets.aftercast.Avatar_DT, {
	})

	-- DT build with avatar out. Equipped when IdleMode is "DT".
	sets.aftercast.Perp_DT = set_combine(sets.DT_Base, {
		ear2="Evans Earring",
		body="Udug Jacket",
		waist="Lucidity Sash"
	})

	-- Idle set used when you have a spirit summoned. Glyphic Spats will make them cast more frequently.
	sets.aftercast.Spirit = {
		main="Nirvana",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",
		neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		ear2="Evans Earring",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+12','Blood Pact Dmg.+2',}},
		waist="Lucidity Sash",
		legs="Glyphic Spats +3",
		feet="Baayami Sabots +1"
	}

	-- ===================================================================================================================
	--		End of Sets
	-- ===================================================================================================================

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

	--TownIdle = S{"windurst woods","windurst waters","windurst walls","port windurst","bastok markets","bastok mines","port bastok","southern san d'oria","northern san d'oria","port san d'oria","upper jeuno","lower jeuno","port jeuno","ru'lude gardens","norg","kazham","tavnazian safehold","rabao","selbina","mhaura","aht urhgan whitegate","al zahbi","nashmau","western adoulin","eastern adoulin"}
	--Salvage = S{"Bhaflau Remnants","Zhayolm Remnants","Arrapago Remnants","Silver Sea Remnants"}
end

-- ===================================================================================================================
--		Gearswap rules below this point - Modify at your own peril
-- ===================================================================================================================

function pretarget(spell,action)
	if not buffactive['Muddle'] then
		-- Auto Remedy --
		if AutoRemedy and (spell.action_type == 'Magic' or spell.type == 'JobAbility') then
			if buffactive['Paralysis'] or (buffactive['Silence'] and not AutoEcho) then
				cancel_spell()
				send_command('input /item "Remedy" <me>')
			end
		end
		-- Auto Echo Drop --
		if AutoEcho and spell.action_type == 'Magic' and buffactive['Silence'] then
			cancel_spell()
			send_command('input /item "Echo Drops" <me>')
		end
	end
end

function precast(spell)
    if (pet.isvalid and pet_midaction() and not spell.type=="SummonerPact") or spell.type=="Item" then
		-- Do not swap if pet is mid-action. I added the type=SummonerPact check because sometimes when the avatar
		-- dies mid-BP, pet.isvalid and pet_midaction() continue to return true for a brief time.
		return
	end

	-- don't try to do stuff if we can't do stuff
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
        return
    end
	
	-- Summon handling:
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

	-- Spell fast cast
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif spell.action_type=="Magic" then
		if spell.name=="Stoneskin" then
			equip(sets.precast.FC,{waist="Siegel Sash"})
		else
			equip(sets.precast.FC)
		end
    end
end

function midcast(spell)
    if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
        return
    end
	-- BP Timer gear needs to swap here
	if (spell.type=="BloodPactWard" or spell.type=="BloodPactRage") then
		if not buffactive["Astral Conduit"] then
			equip(sets.midcast.BP)
		end

	-- Spell Midcast & Potency Stuff
    elseif sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])

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
        idle()
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
	elseif spell.name=="Utsusemi: Ichi" and buffactive["Copy Image"] then
		windower.send_command('wait 1;cancel 66;')
	end
end

function aftercast(spell)
    if pet_midaction() or spell.type=="Item" then
        return
    end
	if not string.find(spell.type,"BloodPact") then
        idle()
    end
end

function pet_change(pet,gain)
	if (not (gain and pet_midaction())) then
		idle()
	end
end

function status_change(new,old)
	if new=="Idle" then
        idle()
	end
end

function buff_change(name,gain)
    if name=="quickening" then
        idle()
    end
	if SacTorque and name=="sleep" and gain and pet.isvalid then
		equip({neck="Sacrifice Torque"})
		disable("neck")
		if buffactive["Stoneskin"] then
			windower.send_command('cancel 37;')
		end
	end
	if name=="sleep" and not gain then
		enable("neck")
	end
end

function pet_midcast(spell)
	if not LagMode then
		equipBPGear(spell.name)
	end
end

function pet_aftercast(spell)
    idle()
end

function equipBPGear(spell)
    if spell=="Perfect Defense" then
        equip(sets.pet_midcast.SummoningMagic)
	elseif Debuff_BPs:contains(spell) then
		equip(sets.pet_midcast.MagicAcc_BP)
	elseif Buff_BPs_Healing:contains(spell) then
		equip(sets.pet_midcast.Buff_Healing)
	elseif Buff_BPs_Duration:contains(spell) then
		equip(sets.pet_midcast.Buff)
	elseif Buff_BPs_MND:contains(spell) then
		equip(sets.pet_midcast.Buff_MND)
	elseif spell=="Flaming Crush" then
		if AccMode then
			equip(sets.pet_midcast.FlamingCrush_Acc)
		else
			equip(sets.pet_midcast.FlamingCrush)
		end
	elseif ImpactDebuff and (spell=="Impact" or spell=="Conflag Strike") then
		equip(sets.pet_midcast.Impact)
	elseif Magic_BPs_NoTP:contains(spell) then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_NoTP_Acc)
		else
			equip(sets.pet_midcast.Magic_BP_NoTP)
		end
	elseif Magic_BPs_TP:contains(spell) or string.find(spell," II") or string.find(spell," IV") then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_TP_Acc)
		else
			equip(sets.pet_midcast.Magic_BP_TP)
		end
	elseif Merit_BPs:contains(spell) then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_TP_Acc)
		elseif spell=="Meteor Strike" and MeteorStrike>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Geocrush" and Geocrush>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Grand Fall" and GrandFall>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Wind Blade" and WindBlade>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Heavenly Strike" and HeavenlyStrike>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Thunderstorm" and Thunderstorm>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		else
			equip(sets.pet_midcast.Magic_BP_TP)
		end
	elseif Debuff_Rage_BPs:contains(spell) then
		equip(sets.pet_midcast.Debuff_Rage)
	else
		if AccMode then
			equip(sets.pet_midcast.Physical_BP_Acc)
		elseif Physical_BPs_TP:contains(spell) then
			equip(sets.pet_midcast.Physical_BP_TP)
		elseif buffactive["Aftermath: Lv.3"] then
			equip(sets.pet_midcast.Physical_BP_AM3)
		else
			equip(sets.pet_midcast.Physical_BP)
		end
	end
end

-- This command is called whenever you input "gs c <command>"
function self_command(command)
	IdleModeCommands = {'DD','Refresh','DT','Favor','PetDT','Zendik'}
	is_valid = command:lower()=="idle"
	
	for _, v in ipairs(IdleModeCommands) do
		if command:lower()==v:lower() then
			IdleMode = v
			send_command('console_echo "Idle Mode: ['..IdleMode..']"')
			idle()
			return
		end
	end
	if string.sub(command,1,7)=="EquipBP" then
		equipBPGear(string.sub(command,9,string.len(command)))
		return
	elseif command:lower()=="accmode" then
		AccMode = AccMode==false
		is_valid = true
		send_command('console_echo "AccMode: '..tostring(AccMode)..'"')
	elseif command:lower()=="impactmode" then
		ImpactDebuff = ImpactDebuff==false
		is_valid = true
		send_command('console_echo "Impact Debuff: '..tostring(ImpactDebuff)..'"')
    elseif command:lower()=="forceilvl" then
        ForceIlvl = ForceIlvl==false
        is_valid = true
        send_command('console_echo "Force iLVL: '..tostring(ForceIlvl)..'"')
	elseif command:lower()=="lagmode" then
		LagMode = LagMode==false
		is_valid = true
		send_command('console_echo "Lag Compensation Mode: '..tostring(LagMode)..'"')
	elseif command:lower()=="th" then
		TreasureHunter = TreasureHunter==false
		is_valid = true
		send_command('console_echo "Treasure Hunter Mode: '..tostring(TreasureHunter)..'"')
	elseif command:lower()=="meleemode" then
		if MeleeMode then
			MeleeMode = false
			enable("main","sub")
			send_command('console_echo "Melee Mode: false"')
		else
			MeleeMode = true
			equip({main="Nirvana",sub="Elan Strap +1"})
			disable("main","sub")
			send_command('console_echo "Melee Mode: true"')
		end
		is_valid = true
	elseif command=="ToggleIdle" then
		is_valid = true
		-- If you want to change the sets cycled with F9, this is where you do it
		if IdleMode=="Refresh" then
			IdleMode = "DT"
		elseif IdleMode=="DT" then
			IdleMode = "PetDT"
		elseif IdleMode=="PetDT" then
			IdleMode = "DD"
		else
			IdleMode = "Refresh"
		end
		send_command('console_echo "Idle Mode: ['..IdleMode..']"')
	elseif command:lower()=="lowhp" then
		-- Use for "Cure 500 HP" objectives in Omen
		equip({head="Apogee Crown +1",body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},legs="Apogee Slacks +1",feet="Apogee Pumps +1",back="Campestres's Cape"})
		return
	elseif string.sub(command:lower(),1,12)=="meteorstrike" then
		MeteorStrike = string.sub(command,13,13)
		send_command('console_echo "Meteor Strike: '..MeteorStrike..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,8)=="geocrush" then
		Geocrush = string.sub(command,9,9)
		send_command('console_echo "Geocrush: '..Geocrush..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,9)=="grandfall" then
		GrandFall = string.sub(command,10,10)
		send_command('console_echo "Grand Fall: '..GrandFall..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,9)=="windblade" then
		WindBlade = +string.sub(command,10,10)
		send_command('console_echo "Wind Blade: '..WindBlade..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,14)=="heavenlystrike" then
		HeavenlyStrike = string.sub(command,15,15)
		send_command('console_echo "Heavenly Strike: '..HeavenlyStrike..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,12)=="thunderstorm" then
		Thunderstorm = string.sub(command,13,13)
		send_command('console_echo "Thunderstorm: '..Thunderstorm..'/5"')
		is_valid = true
	end

	if is_valid then
		if not midaction() and not pet_midaction() then
			idle()
		end
	else
		sanitized = command:gsub("\"", "")
		send_command('console_echo "Invalid self_command: '..sanitized..'"')
	end
end

-- This function is for returning to aftercast gear after an action/event.
function idle()
	--if TownIdle:contains(world.area:lower()) then
	--	return
	--end
    if pet.isvalid then
		if IdleMode=='DT' then
			equip(sets.aftercast.Perp_DT)
		elseif string.find(pet.name,'Spirit') then
            equip(sets.aftercast.Spirit)
		elseif IdleMode=='PetDT' then
			if ForceIlvl then
				equip(sets.aftercast.Avatar_DT_Ilvl)
			else
				equip(sets.aftercast.Avatar_DT)
			end
        elseif IdleMode=='Refresh' then
			if player.mpp < 50 then
				equip(sets.aftercast.Perp_RefreshSub50)
			else
				equip(sets.aftercast.Perp_Refresh)
			end
		elseif IdleMode=='Favor' then
			equip(sets.aftercast.Perp_Favor)
		elseif IdleMode=='Zendik' then
			equip(sets.aftercast.Perp_Zendik)
		elseif MeleeMode then
			equip(sets.aftercast.Perp_Melee)
        elseif IdleMode=='DD' then
            equip(sets.aftercast.Perp_DD)
        end
		-- Gaiters if Fleet Wind is up
		if buffactive['Quickening'] and IdleMode~='DT' and not ForceIlvl then
			equip({feet="Herald's Gaiters"})
		end
	else
		if IdleMode=='DT' then
			equip(sets.aftercast.DT)
		elseif MeleeMode and IdleMode=='DD' then
			equip(sets.aftercast.Perp_Melee)
		elseif ForceIlvl then
			equip(sets.aftercast.Idle_Ilvl)
		else
			equip(sets.aftercast.Idle)
		end
    end
	-- Balrahn's Ring
	--if Salvage:contains(world.area) then
	--	equip({ring2="Balrahn's Ring"})
	--end
	-- Maquette Ring
	--if world.area=='Maquette Abdhaljs-Legion' and not IdleMode=='DT' then
	--	equip({ring2="Maquette Ring"})
	--end
end