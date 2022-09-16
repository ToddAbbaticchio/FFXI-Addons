--Table of Contents
--You can search the file for the #'s to aid in search, ex. Ctrl + F, input #11 to find the midcast section which contains healing, stoneskin, etc
--#1 Staves
--#2 Augmented Items & JSE Cape
--#3 Magical Pacts
--#4 Ward Pacts
--#5 Physical Pacts
--#6 Hybrid Pacts
--#7 Toggled/Situational Sets 
--#8 Job Abilities
--#9 Fast Cast
--#10 Weapon Skills
--#11 Midcast Sets
--#12 Idle/DT Sets
--#13 Perp Sets
--#14 Avatar Melee/DT Sets
--#15 Engaged Sets 
--Simple guide to filling out sets:
--1) equip the gear for the desired set
--2) use //gs export lua and open the file in the exports folder
--3) copy and paste the gear into your set

--[#1 Staves ]--
--if you don't have 3 staff you can set them all to the same one, until you do get more.  Nirvana is the best avatarattackstaff, espiritus and griovalr techinically best for the other 2 with right augs
--if you're confused for any sets with augs or just wanna save time, just equip the gear and type //gs export lua and it will be in your data/export folder
--bpmagicstaff={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: INT+14','Pet: Mag. Acc.+30','Pet: "Mag.Atk.Bns."+10',}}
--bpmagicstaff={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+9','Pet: "Mag.Atk.Bns."+24','DMG:+9',}}
bpmagicstaff={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: Mag. Acc.+25','Pet: "Mag.Atk.Bns."+22',}}
bpmagicaccstaff={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: INT+14','Pet: Mag. Acc.+30','Pet: "Mag.Atk.Bns."+10',}}
smnskillstaff = { name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','System: 2 ID: 153 Val: 3',}}
avatarattackstaff = "Nirvana"
refreshstaff={ name="Grioavolr", augments={'"Occult Acumen"+3','Accuracy+9','"Refresh"+1','Magic Damage +8',}}
gada={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+4',}}

--[#2 Augmented Items & JSE Cape ]--
conveyance = { name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+4','Blood Pact ab. del. II -3',}}
conveyanceskill={ name="Conveyance Cape", augments={'Summoning magic skill +5','Blood Pact Dmg.+2',}}
campestres_magic={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','Pet: Haste+10',}}
campestres_att={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Accuracy+10','Pet: Haste+10',}}
campestres_idle={ name="Campestres's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
campestres_fc={ name="Campestres's Cape", augments={'MP+60','MP+18','"Fast Cast"+10',}}


sets.apogee = {
    body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}},
    --body={ name="Apogee Dalmatica", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    hands={ name="Apogee Mitts +1", augments={'Pet: Mag. Acc.+25','"Blood Pact" ability delay+7','Blood Pact Dmg.+8',}},
    legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
}
sets.apogee2 = {
    body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
}
sets.apogeephy_path = {
    --feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
}
apogee_crown_phy={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}
apogee_crown_mag={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}

apogee_slacks_phy={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}}
--apogee_slacks_mag={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}}
apogee_slacks_phy={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}}
apogee_slacks_mag={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}


moonshade={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}}

sets.enticers = {
	--legs={ name="Enticer's Pants", augments={'MP+20','Pet: Mag. Acc.+4',}}
    legs={ name="Enticer's Pants", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}},
}
enticers = { name="Enticer's Pants", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}}

sets.healingaugmented = {
    main={ name="Serenity", augments={'MP+5','Enha.mag. skill +5',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
}
sets.psycloth = {
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
}
glyphichorn={ name="Glyphic Horn", augments={'Enhances "Astral Flow" effect',}}
glypchicbracers={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}}
glyphicspats={ name="Glyphic Spats +1", augments={'Increases Sp. "Blood Pact" accuracy',}}
selenian={ name="Selenian Cap", augments={'Attack+3','Pet: Damage taken -10%','Accuracy+3','Pet: Haste+5',}}

telch_head={ name="Telchine Cap", augments={'"Elemental Siphon"+30','Enh. Mag. eff. dur. +10',}}
telch_body={ name="Telchine Chas.", augments={'"Elemental Siphon"+30','Enh. Mag. eff. dur. +10',}}
telch_hands={ name="Telchine Gloves", augments={'"Elemental Siphon"+30','Enh. Mag. eff. dur. +9',}}
telch_legs={ name="Telchine Braconi", augments={'"Elemental Siphon"+30','Enh. Mag. eff. dur. +9',}}
telch_feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}}

merlinic_head_fc={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','"Fast Cast"+6','MND+6','Mag. Acc.+4',}} --14
merlinic_head_mab={ name="Merlinic Hood", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. Acc.+12','"Mag.Atk.Bns."+10',}}

merlinic_body_mab={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Fast Cast"+1','MND+7','Mag. Acc.+10','"Mag.Atk.Bns."+15',}}

merlinic_hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+16 Pet: "Mag.Atk.Bns."+16','Blood Pact Dmg.+9','System: 1 ID: 1792 Val: 8','Pet: Mag. Acc.+7','Pet: "Mag.Atk.Bns."+9',}}
merlinic_hands_fc = { name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+14','"Fast Cast"+6','INT+10','Mag. Acc.+11',}} --6
merlinic_hands_mab={ name="Merlinic Dastanas", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+3','Mag. Acc.+11',}}
merlinic_hands_refresh={ name="Merlinic Dastanas", augments={'Pet: DEX+14','Pet: Accuracy+17 Pet: Rng. Acc.+17','"Refresh"+2',}}


merlinic_legs_mburst={ name="Merlinic Shalwar", augments={'"Snapshot"+1','"Conserve MP"+1','Magic burst mdg.+15%','Accuracy+13 Attack+13','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}--15

merlinic_feet_fc={ name="Merlinic Crackows", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+6','INT+8',}}--11
merlinic_feet_refresh={ name="Merlinic Crackows", augments={'STR+10','Pet: "Mag.Atk.Bns."+23','"Refresh"+2','Accuracy+4 Attack+4','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}


amal_head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}}
amal_hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}

--[#3 Magical Pacts ]--
--Used for Magical Blood Pacts
sets.petmab = { 
	head=apogee_crown_mag,
	hands=merlinic_hands,
	body="Apogee Dalmatica +1",
	legs=apogee_slacks_mag,
	--legs=enticers,
	feet="Apogee Pumps +1",
	main=bpmagicstaff,
	sub="Elan Strap +1",
	ammo="Sancus Sachet +1",
	--neck="Deino Collar",
	neck="Adad Amulet",
	waist="Incarnation Sash",
	left_ear="Gelos Earring",
	right_ear="Esper earring",
	left_ring="Varar Ring",
	right_ring="Varar Ring",
	back=campestres_magic
	--ammo="Seraphicaller",
	--left_ring="Speaker's Ring",
	--waist="Kobo Obi",
	--right_ring="Evoker's ring",
	--back=conveyance

	-- Example Helios --
	--head={ name="Helios Band", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}}, 
	--body={ name="Helios Jacket", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}},
	--hands={ name="Helios Gloves", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}},
	--legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +4','Blood Pact Dmg.+5',}},
	--feet={ name="Helios Boots", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +3','Blood Pact Dmg.+6',}},
}
sets.petmabacc = set_combine(sets.petmab,{ 
	main=bpmagicaccstaff,
	hands="Apogee Mitts +1",
})
sets.pethybridacc = set_combine(sets.petmab,{ 
	hands="Apogee Mitts +1",
})


--[#4 Ward Pacts ]--
--Max out Summoning Magic Skill
--this will be used for many types of wards, max your summoning skill for longer ward duration and more magic acc
--wards can be empowered by empy bonus your call on to use it or not
sets.smnskill = { 
	main=smnskillstaff,
	sub="Vox Grip",
	ammo="Sancus Sachet +1",
	head="Convoker's Horn +2",
	body="Apogee Dalmatica",
	hands="Lamassu Mitts +1",
	legs="Beckoner's spats +1",
	feet="Apogee Pumps",
	neck="Incanter's Torque",
	waist="Kobo Obi",
	left_ear="Summoning earring",
	right_ear="Andoaa earring",
	left_ring="Globidonta Ring",
	right_ring="Evoker's ring",
	back=conveyanceskill
	--ammo="Seraphicaller",
	--head="Convoker's Horn +2",
}
sets.midcast.Pet.BloodPactWard = { --uses the smnskill set as base, if you want to override anything htat set you may do so here
	head="Beckoner's Horn +1",
	body="Beckoner's Doublet +1",
}
sets.midcast.Pet.BloodPactWard = set_combine(sets.smnskill,sets.midcast.Pet.BloodPactWard)
sets.ward = sets.midcast.Pet.BloodPactWard

--you want to put tp bonus and + to hp here for stronger cures, smn skill won't matter this is for healing wards mostly
sets.midcast.Pet.HealingWard = {
	main=avatarattackstaff,
	head=apogee_crown_mag,
	hands="Apogee Mitts +1",
	body="Apogee Dalmatica +1",
	legs=apogee_slacks_phy,
	feet="Apogee Pumps +1",
	back=campestres_magic,
	--Fill the rest with HP gear so you don't lose HP
	neck="Sanctity Necklace", --HP+35
	left_ear="Etiolation earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	waist="Gishdubar sash",
}
sets.healingward = sets.midcast.Pet.HealingWard
sets.midcast.Pet.TPBloodPactWard = set_combine(sets.smnskill,{
	body="Beckoner's Doublet +1",
	legs=enticers,
})

sets.midcast.Pet.DebuffBloodPactWard = { --override your smnskill set here, these are wards that target monsters, I leave it as maxing out smn skill for magic accuracy, but you could put other things here
	main=bpmagicaccstaff,
	head="Tali'ah Turban +1",
	hands="Apogee Mitts +1",
	body="Tali'ah Manteel +1",
	legs="Tali'ah Seraweels +1",
	feet="Tali'ah Crackows +1",
	--neck="Deino Collar",
	neck="Adad Amulet",
	waist="Incarnation Sash",
	left_ear="Enmerkar Earring",
	back=campestres_magic
}
sets.midcast.Pet.DebuffBloodPactWard = set_combine(sets.smnskill,sets.midcast.Pet.DebuffBloodPactWard)
sets.debuff = sets.midcast.Pet.DebuffBloodPactWard

--[#5 Physical Pacts ]--
sets.midcast.Pet.PhysicalBloodPactRage = { --does physical damage only, like pred claws and spinning dive and volt strike
	main=avatarattackstaff,
	sub="Elan Strap +1",
	ammo="Sancus Sachet +1",
	head=apogee_crown_phy,
	body="Convoker's Doublet +2",
	hands=merlinic_hands,
	legs=apogee_slacks_phy,
	neck="Empath necklace",
	--waist="Mujin Obi",
	waist="Incarnation Sash",
	left_ear="Gelos Earring",
	right_ear="Esper earring",
	left_ring={name="Varar Ring",priority=3},
	right_ring={name="Varar Ring",priority=3},
	back=campestres_att,
	feet="Apogee Pumps +1",
	--back=conveyance,
	--right_ring="Evoker's ring",
	--ammo="Seraphicaller",
}
sets.physicalpact = sets.midcast.Pet.PhysicalBloodPactRage
sets.midcast.Pet.PhysicalBloodPactRageAcc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage,{
	hands="Apogee Mitts +1",
	--hands="Apogee Mitts"
})
sets.midcast.Pet.TPPhysicalBloodPactRage = set_combine(sets.midcast.Pet.PhysicalBloodPactRage,{legs=enticers})
sets.midcast.Pet.TPPhysicalBloodPactRageAcc = set_combine(sets.midcast.Pet.PhysicalBloodPactRageAcc,{legs=enticers})

--[#6 Hybrid Pacts ]--
sets.midcast.Pet.HybridBloodPactRage = { --At this time is only your flaming crush set
	main="Nirvana",
	sub="Elan Strap +1",
	ammo="Sancus Sachet +1",
	head=apogee_crown_mag,
	hands=merlinic_hands,
	body="Apogee Dalmatica +1",
	legs=apogee_slacks_phy,
	feet="Apogee Pumps +1",
	--neck="Deino Collar",
	neck="Adad Amulet",
	waist="Incarnation Sash",
	left_ear="Gelos Earring",
	right_ear="Esper earring",
	left_ring="Varar Ring",
	right_ring="Varar Ring",
	back=campestres_att,
	--back="Scintillating Cape"
	--left_ring="Speaker's Ring",
	--right_ring="Fervor Ring",
	--ammo="Seraphicaller",
}
sets.hybridpact = sets.midcast.Pet.HybridBloodPactRage
sets.midcast.Pet.HybridBloodPactRageAcc = set_combine(sets.midcast.Pet.HybridBloodPactRage,{
	hands="Apogee Mitts +1",
	--main=bpmagicaccstaff,
})

sets.midcast.Pet.MagicalBloodPactRage = {
}

--This is where petmab set fills in anything you didn't specifically define
--basically petmab is the "default" set and you customize each situational set how you liked above
--this cuts down on the need to fill in the same items over and over for each set
sets.midcast.Pet.MagicalBloodPactRage = set_combine(sets.petmab,sets.midcast.Pet.MagicalBloodPactRage)
sets.midcast.Pet.MagicalBloodPactRageAcc = set_combine(sets.midcast.Pet.MagicalBloodPactRage,sets.petmabacc)
sets.midcast.Pet.TPMagicalBloodPactRage = set_combine(sets.petmab,{legs=enticers})
sets.midcast.Pet.TPMagicalBloodPactRageAcc = set_combine(sets.midcast.Pet.TPMagicalBloodPactRage,sets.petmabacc)
--sets.midcast.Pet.IfritMagicalBloodPactRage = set_combine(sets.petmab,{left_ring="Speaker's Ring",right_ring="Fervor Ring"})
sets.midcast.Pet.IfritMagicalBloodPactRage = sets.midcast.Pet.MagicalBloodPactRage
sets.midcast.Pet.IfritMagicalBloodPactRageAcc = set_combine(sets.midcast.Pet.IfritMagicalBloodPactRage,sets.petmabacc)

sets.magicalpact = sets.midcast.Pet.MagicalBloodPactRage
--Helios Notes
--MAX: crit 20% mab 150 bpdmg 35
--AT: crit 19% mab 142 bpdmg 23
--MISSING: crit 1% mab 8 bpdmg 12

--[#7 Toggled/Situational Sets ]--
sets.cpmode = {back="Mecisto. Mantle"}
sets.wakeup = {neck="Sacrifice Torque"}--if you have a pet out and are slept, equipping this wakes you up

sets.latent_refresh = {sub="Oneiros grip",waist="Fucho-no-obi"}

--for when you wanna melee for self skill chains, aftermath, procing voidwatch, or just wanna crack some skulls the old fashioned way
sets.tplock = { 
	main="Nirvana"
	--main=bpmagicstaff
}
sets.kclub = {
	main="Kraken Club",
	sub="Genmei Shield", --10
}
sets.inwkr = {
	neck="Arciela's Grace +1"
}

--Feet is your biggest -perp slot, especially with apogee+1 being a massive -9.  Evans earring can help counter this, I keep moonshade on my right ear.  Lucidity helps too ofc.  This is automatically equipped when you use fleet wind, and if you're moving between points and then engaging things a lot (such as assault) I found I could be low mana, so this mostly fixed that.
sets.movement = { 
	left_ear="Evans earring",
	waist="Lucidity sash",
	feet="Herald's Gaiters"
}
sets.movementtown = { 
	feet="Herald's Gaiters"
}

--When you zone into mog gardens, what you wear, might have to hit f12 to force a gear update sometimes
sets.farmer = { 
	main="Hoe",
	body="Overalls",
	hands="Work gloves",
	legs="",
	--feet="Herald's Gaiters"
	feet="Thatch Boots"
}

--For more movement in Adoulin
sets.adoulinmovement = { 
	body="Councilor's Garb"
}

sets.crafting = {
	head="Magnifying Specs.",
	neck="Weaver's Torque",
	left_ring="Craftmaster's Ring",
	--right_ring="Orvail Ring",
	body="Weaver's Apron",
	right_ring="Artificer's Ring",
}

--[ Items To Keep with Organizer ]--
organizer_items = {
	i1="Warp Ring",
	i2="Dim. Ring (Mea)",
	i3="Mephitas's Ring +1",
	i5="Holy Water",
	i6="Remedy",
	i7="Echo Drops",
	i8="Grape Daifuku +1",
	i9="Grape Daifuku",
	i10="Akamochi",
	i11="Akamochi +1",
	i12="Rolanberry Daifuku",
	i13="Rolanberry Daifuku +1",
	i14="Kusamochi",
	i15="Shiromochi",
	i16="Panacea",
	i17="Vile Elixir",
	i18="Vile Elixir +1",
	i19="Echad Ring",
	i20="Trizek Ring",
	i21="Capacity Ring",
	i22="Anniversary Ring",
	i23="Echad Ring",
	i24="Expertise Ring",
	i25="Warp Cudgel",
	i26="Facility Ring",
	i27="Khatvanga",
	i28="Fervor Ring",
}


--[#8 Job Abilities ]--

-- Precast sets to enhance JAs

sets.precast.JA['Astral Flow'] = {head=glyphichorn}

sets.precast.JA['Mana Cede'] = {hands="Beckoner's bracers"}
sets.precast.JA['Elemental Siphon'] = {
    main={ name="Keraunos", augments={'"Elemental Siphon"+25',}},
	sub="Vox Grip",
	ammo="Esper Stone +1",
	head=telch_head,
	body=telch_body,
	hands=telch_hands,
	legs=telch_legs,
	feet="Beck. Pigaches +1",
	neck="Incanter's Torque",
	waist="Kobo Obi",
	left_ear="Summoning earring",
	right_ear="Andoaa earring",
	left_ring="Zodiac Ring",--use on all but light or darks day
	right_ring="Evoker's Ring",
	back=conveyance
}
sets.SiphonZodiac = {
	left_ring="Zodiac Ring",--use on all but light or darks day
}
sets.SiphonLightDarkDay = {
	left_ring="Globidonta Ring", --used on darks and lights day only
}
useall_bp_reduction_gear = true
if useall_bp_reduction_gear then 
	-- Pact delay reduction gear
	sets.precast.BloodPactWard = { --I just stack it all because when I do salvage or a gear slot is locked by a NM it's nice
		main=smnskillstaff, --II -2
		ammo="Sancus Sachet +1", --II -6
		head="Beckoner's Horn +1",-- 3 Favor
		--body="Shomonjijoe +1", --8
		body="Convoker's Doublet +2", --10
		hands=glyphicbracers,--6
		left_ear="Evans Earring",--2
		back=conveyance --II -3
		--gift -10
		--feet="Glyphic Pigaches +1",-- II -1
		--body="Apogee Dalmatica", -- II -2
		--head="Convoker's Horn +2",--8
		--ammo="Seraphicaller",-- II -5
	}
-- delay 1: -15 cap (-20 equipped)
-- delay II: -10
-- gift: -10
else
	-- Pact delay reduction gear
	sets.precast.BloodPactWard = { --with gifts this really all you need
	ammo="Sancus Sachet +1",-- II -6
	body="Convoker's Doublet +2", --10
	hands=glyphicbracers,--6
	head="Beckoner's Horn +1",-- 3 Favor
	--gift -10
	--head="Convoker's Horn +2",--8
	--body="Shomonjijoe +1", --8
	--ammo="Seraphicaller",-- II -5
}
-- delay 1: -15 cap (-16 equipped)
-- delay 1 no shomonjijoe+1: -15 cap (-20 equipped)
-- delay II: -5
-- gift: -10
end

sets.precast.BloodPactWard = set_combine(sets.smnskill,sets.precast.BloodPactWard)
--sets.precast.BloodPactWard = {
--    sub="Vox Grip",
--    ammo="Seraphicaller",
--    head="Beckoner's Horn +1",
--    body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}},
--    hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
--    legs="Beck. Spats +1",
--    feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
--    neck="Incanter's Torque",
--    waist="Kobo Obi",
--    left_ear="Evans Earring",
--    right_ear="Andoaa Earring",
--    left_ring="Globidonta Ring",
--    right_ring="Evoker's Ring",
--    back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+4','Blood Pact ab. del. II -3',}},
--
--    main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
--    sub="Vox Grip",
--    ammo="Seraphicaller",
--    head="Beckoner's Horn +1",
--    body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}},
--    hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
--    legs="Beck. Spats +1",
--    feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
--    neck="Incanter's Torque",
--    waist="Kobo Obi",
--    left_ear="Evans Earring",
--    right_ear="Andoaa Earring",
--    left_ring="Globidonta Ring",
--    right_ring="Evoker's Ring",
--    back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+4','Blood Pact ab. del. II -3',}},
--}
sets.precast.BloodPactRage = sets.precast.BloodPactWard


sets.burstmode = {}
sets.burstmode.Burst = {
	hands=glyphicbracers,
}

--[#9 Fast Cast ]--

-- Fast cast sets for spells
sets.precast.FC = {
	main={ name="Grioavolr", augments={'"Fast Cast"+5','Mag. Acc.+19','Magic Damage +4',}},--9
	sub="Vivid Strap",--1
	head=merlinic_head_fc,
	neck="Orunmila's Torque",--5
	left_ear="Etiolation Earring",--1
	right_ear="Loquacious earring",--2
	hands=merlinic_hands_fc,
	body="Inyanga Jubbah +1", --13
	--left_ring="Rahab Ring", -- 2
	left_ring="Weather. Ring",
	right_ring="Prolix Ring", -- 2
	left_ring={name="Mephitas's Ring +1",priority=3},
	right_ring={name="Mephitas's Ring",priority=3},
	waist="Witful belt", --3
	legs="Psycloth Lappas", --7
	feet=merlinic_feet_fc,
    back=campestres_fc,--10
	--back=conveyance,
	--back="Swith cape +1", --4
	--right_ring="Rahab Ring", -- 2
	--right_ring="Weather. Ring", -- 5 FC 3 QC
	--left_ring="Lebeche Ring", --+2 QC
	--left_ear="Enchntr. Earring +1",--2
	--main="Sucellus",--5
	--sub="Chanter's Shield",--3 

}
--9 1 0 0
--14 5 1 2
--13 6 0 0
--10 3 7 11

sets.keepfc = {
	--back="Swith cape +1", --4
}
--ammo --+2
--82
--8 Quick cast
if player.sub_job == 'RDM' then
	sets.precast.FC = set_combine(sets.precast.FC, {
		--left_ring="Lebeche Ring", --+2 QC -2 FC
		--left_ring={name="Mephitas's Ring +1",priority=3},
		--back="Perimede Cape", --+4 QC -4 FC
	})
end
--RDM 12 quick cast, 93 fastcast

--sets.precast.FC['Stoneskin'] = {
--waist="Siegel Sash", --8
--}
sets.precast.Interrupt = {
	--main="Hermit's Wand",--25
	--sub="Culminus",--10
	hands=amal_hands,--10
	--body="Ros. Jaseran +1",--25
	left_ear="Halasz Earring",--5
	--right_ear="Magnetic Earring",--8
	legs="Querkening brais",--15
	feet="Amalric Nails",--15
	--ammo="Impatiens",--10
	--waist="Emphatikos Rope",--12
	--back="Solitaire Cape",--8
	--neck="Willpower Torque"--5

}
if use_resistant then
	sets.precast.FC.Resistant = { --this is still in the works for me, I want it to work that it makes compromises between casting speed, keeping you alive, spell interuption gear, and skill gear for that type of spell to reduce interuption rate
		--body="Vrikodara Jupon", --5 -3 PDT
		--hands={ name="Telchine Gloves", augments={'Mag. Acc.+12','"Fast Cast"+5','"Regen" potency+1',}}, --5
		--legs="Lengo pants", --5 -1 PDT
		--feet="Regal Pumps +1", --7
		--left_ring="Defending ring", -- -10 DT
		--right_ring="Prolix ring", -- 2
		--back="Swith cape +1", --3
	}
end
--39
--    sets.precast.FC['Cure'] = set_combine(sets.precast.FC, {
--	    main="Tamaxchi",
--	    sub="Genbu's shield",
--	    body="Heka's kalasiris",
--	    back="pahtli cape",
--	    feet="Chelona boots"
--    })


--[#10 Weapon Skills ]--
-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {}
sets.precast.PhysicalWS = {
	head="Blistering Sallet",
	body="Onca Suit",
	neck="Subtlety spectacles",
	right_ring="Cacoethic Ring",
	left_ring="Cacoethic Ring +1",
	left_ear="Zennaroi Earring",
	right_ear=moonshade,
	waist="Olseni Belt",
	back="Penetrating Cape"
	--right_ear="Dignitary's Earring",
}
sets.precast.WS = sets.precast.PhysicalWS
--sets.precast.WS['Shattersoul'] = set_combine(sets.precast.MagicalWS, {
--})
sets.precast.WS['Myrkr'] = {
	main="Nirvana",
	sub="Vox Grip",
	ammo="Sancus Sachet +1",
	head=apogee_crown_mag,
	body="Beck. Doublet +1",
	hands="Lamassu mitts +1",
	legs="Beck. Spats +1",
	feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
	neck="Sanctity Necklace",
	waist="Shinjutsu-no-Obi +1",
	left_ear="Etiolation Earring",
	right_ear=moonshade,
	left_ring={name="Mephitas's Ring +1",priority=3},
	right_ring={name="Mephitas's Ring",priority=3},
	back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+4','Blood Pact ab. del. II -3',}},
	--left_ear="Evans Earring",
	--ammo="Seraphicaller",
}
if use_player_mab then
	sets.precast.MagicalWS = {
		ammo="Sancus Sachet +1",
		head=merlinic_head_mab,
		body=merlinic_body_mab,
		hands=merlinic_hands_mab,
		legs=merlinic_legs_mburst,
		feet=merlinic_feet_fc,
		neck="Sanctity Necklace",
		waist="Refoccilation stone",
		left_ear="Friomisi Earring",
		right_ear=moonshade,
		left_ring="Fenrir Ring",
		right_ring="Fenrir Ring",
		back="Toro Cape",
		--ear2="Ishvara earring",
		--right_ear="Hermetic Earring",
		--waist="Eschan Stone",
		--neck="Satlada Necklace",
		--ammo="Seraphicaller",
		--body="Count's Garb",
		--body="Gyve Doublet",
		--legs="Gyve Trousers",
	}
	sets.precast.WS['Flash Nova'] = set_combine(sets.precast.MagicalWS, {
	})
	sets.precast.WS['Rock Crusher'] = set_combine(sets.precast.MagicalWS, {
	})
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.MagicalWS, {
	})
	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.MagicalWS, {
	})
	sets.precast.WS['Shining Strike'] = set_combine(sets.precast.MagicalWS, {
	})
	sets.precast.WS['Garland of Bliss'] = set_combine(sets.precast.MagicalWS, {
	})
else 
	sets.precast.WS['Garland of Bliss'] = { --left mab in moghouse, so use empty set
	}

end


--[#11 Midcast Sets ]--
sets.midcast.Cure = {
	main="Serenity",
	head="Vanya hood",--10%
	body="Vanya robe",
	hands="Reveal. Mitts +1",--14%
	legs="Vanya slops",
	feet="Vanya clogs",--5%
	left_ear="Mendicant's earring",--5%
	right_ear="Roundel Earring",--5%
	right_ring="Lebeche Ring",--3%, -5 enmity
	left_ring="Ephedra Ring",
	neck="Nodens Gorget",--5%
	waist="Witful Belt",
	back=conveyance,
	left_ring={name="Mephitas's Ring +1",priority=3},
	right_ring={name="Mephitas's Ring",priority=3},
	--right_ring="Sirona's Ring",
	--back="Thaumaturge's Cape",
}

--Notes, but outdated
--power:787.25
--cure potency: 50+19+3 
--haste:8+3+3+5+3+3 = 25
--conserve mp: 18
--enmity:-10 + -5 + -5
sets.midcast.CureAurora = {--When you are SCH subjob and cast aurorastorm it will use these items for much more potent Cure 3
	main="Chatoyant Staff",--10%
	waist="Hachirin-No-Obi",--10%
	back="Twilight Cape",--5%
}
sets.midcast.CureAurora = set_combine(sets.midcast.Cure,sets.midcast.CureAurora)
--potency: 10+14+5+5+5+5+10=54%  caps at 50%
--d/w: 25%
--Power = floor(MND÷2) + floor(VIT÷4) + Healing Magic Skill
-- 264/2 + 185/4 + 483 = 132 + 46 + 483 = 661  caps at 700 
sets.midcast.CureSelf = set_combine(sets.midcast.Cure,{--cure recieved gear
	neck="Phalaina locket",
	waist="Gishdubar Sash",
})
sets.midcast.CureSelfAurora = set_combine(sets.midcast.Cure,{
	neck="Phalaina locket",
	main="Chatoyant Staff",--10%
	waist="Hachirin-No-Obi",--10%
	back="Twilight Cape",--5%
	--waist="Gishdubar Sash",
})
sets.midcast.Weather = {
	back="Twilight Cape"
}
sets.midcast['Summoning Magic'] = sets.midcast.BloodPactWard

sets.midcast.Cursna = {
	right_ring="Sirona's Ring",
	left_ring="Ephedra Ring",
	head="Vanya hood",
	feet="Vanya clogs",
}          
sets.midcast.CursnaSelf = {
	waist="Gishdubar Sash",
}
sets.midcast.CursnaSelf = set_combine(sets.midcast.Cursna,sets.midcast.CursnaSelf)
sets.midcast['Enhancing Magic'] = {
	--main ="Oranyan",
	main=gada,
	sub="Ammurapi Shield",
	neck="Incanter's Torque", --+10
	head=telch_head,
	body=telch_body,
	hands=telch_hands,
	legs=telch_legs,
	feet=telch_feet,
	left_ear="Etiolation Earring", 
	right_ear="Andoaa earring",--+5
	waist="Shinjutsu-no-obi +1",
	back="Perimede Cape",
	left_ring={name="Mephitas's Ring +1",priority=3},
	right_ring={name="Mephitas's Ring",priority=3},
	--feet="Regal Pumps +1", --+10
	--head="Befouled Crown",
}
sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'],{
	head="Inyanga Tiara +1"
})
sets.midcast.Stoneskin = {
	main ="Oranyan",
	neck="Nodens Gorget", --+30
	left_ear="Earthcry Earring", --+10
	legs="Haven Hose",--+20
	waist="Siegel Sash",--+20
	feet="Apogee Pumps +1",--for MND
	--legs="Shedier Seraweels",--+35
}
--350  + 80 = 430 hp
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],sets.midcast.Stoneskin)
sets.midcast.Refresh = {
	head=amal_head,
	neck="Orunmila's Torque",
	ear1="Etiolation Earring",
	ear2="Evans earring",
	back="Grapevine Cape",
}
sets.midcast.Phalanx = {
	head="Befouled Crown",
	neck="Incanter's Torque", --+10
	hands="Inyanga Dastanas +1",
	feet="Regal Pumps +1",
	left_ear="Augmenting Earring",
	right_ear="andoaa earring", --+5
	ring1="Stikini Ring",
	ring2="Stikini Ring",
	waist="Olympus Sash"
	--feet="Regal Pumps +1", --+10
	--body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+30',}}, --+12
	--main="Gada",
}
sets.midcast.RefreshSelf = {
	waist="Gishdubar Sash",
	feet="Inspirited Boots",
}
sets.midcast.Aquaveil = {
	head=amal_head,
	waist="Emphatikos Rope"
}
sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'],sets.midcast.Refresh)
sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'],sets.midcast.Phalanx)
sets.midcast.Refresh = set_combine(sets.midcast.Refresh,sets.midcast.RefreshSelf)

if use_player_mab then
	sets.midcast['Elemental Magic'] = {
		main={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
		sub="Culminus", 
		--sub="Ammurapi Shield",
		head=merlinic_head_mab,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Hermetic Earring",
		left_ring="Fenrir Ring",
		right_ring="Fenrir Ring",
		waist="Refoccilation stone",
		back=campestres_magic,
		body=merlinic_body_mab,
		hands=merlinic_hands_mab,
		legs=merlinic_legs_mburst,
		feet=merlinic_feet_fc,
	}
else
	sets.midcast['Elemental Magic'] = {
		main={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
		--sub="Culminus", 
		sub="Ammurapi Shield",
		neck="Sanctity Necklace",
		body=merlinic_body_mab,
		legs="Gyve trousers",
		back=campestres_magic,
	}
end
if use_enfeeb then --mostly useful as sch subjob for dispel, or helping proc immunobreak on rdm sub
	sets.midcast['Enfeebling Magic'] = {
		main="Oranyan",
		sub="Flanged Grip",
		ammo="Pemphredo Tathlum",
		head=amal_head,
		body=merlinic_body_mab,
		hands=merlinic_hands_mab,
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet="Skaoi Boots",
		neck="Jokushu Chain",
		waist="Luminary Sash",
		left_ear="Enchntr. Earring +1",
		right_ear="Digni. Earring",
		left_ring="Weather. Ring",
		right_ring="Rahab Ring",
		back=campestres_magic

--		main="Grioavlr",--Acc+14 INT+19
--		--head="Befouled Crown",--Acc+20 Skill+16 INT+33
--		--head={ name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Mag. Acc.+7',}},--Acc+44 INT+29 
--		head={ name="Merlinic Hood", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. Acc.+12','"Mag.Atk.Bns."+10',}},
--		--legs={ name="Merlinic Shalwar", augments={'"Snapshot"+1','"Conserve MP"+1','Magic burst mdg.+15%','Accuracy+13 Attack+13','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},--15
--		neck="Imbodla Necklace",--INT+7 Skill+5
--		--ear1="Psystorm Earring",
--		ear1="Lempo Earring",
--		ear2="Hermetic Earring",
--		--ring1="Fenrir Ring",--Acc+2
--		--ring2="Fenrir Ring",--Acc+2
--		body="Vanya Robe",--Acc+21 Skill+20 INT+31
--		hands="Reveal. Mitts +1",--Acc+11 INT+11
--		waist="Channeler's Stone",--INT+10
--		--body="Cohort Cloak",
--		legs="Psycloth Lappas",--Acc+35 INT+40 Skill+18
--		--feet="Psycloth Lappas",--Acc+35 INT+40 Skill+18
--		--ammo="Kalboron stone"
	}
	--Totals:
	--Acc:145
	--INT:183
	--Skill:43
	--combined vs hard target:371
end
--
--    sets.midcast['Dark Magic'] = {
--    }

sets.midcast.interruption = {
	main=smnskillstaff,
	sub="Vox Grip",
	ammo="Sancus Sachet +1",
	head="Convoker's Horn +2",
	hands="Lamassu Mitts +1",
	neck="Incanter's Torque",
	waist="Lucidity sash",
	left_ear="Evans Earring",
	right_ear="Andoaa earring",
	left_ring="Globidonta Ring",
	right_ring="Evoker's ring",
	back=conveyance
	--ammo="Seraphicaller",
	--left_ring="Fervor Ring",
}

--sets.midcast.interruption = set_combine(sets.petmab,sets.midcast.interruption)
-- Avatar pact sets.  All pacts are Ability type.


-- Spirits cast magic spells, which can be identified in standard ways.

--    sets.midcast.Pet.WhiteMagic = {
--	    ammo="Seraphicaller",
--	    main="Tumafyrig",
--	    head="Convoker's Horn +2",
--	    neck="Caller's Pendant",
--	    ear1="Andoaa earring",
--	    ear2="Summoning earring",
--	    body="Anhur Robe",
--	    hands="Glyphic Bracers +1 +1",
--	    ring1="Evoker's Ring",
--	    ring2="Globidonta Ring",
--	    back="Conveyance cape",
--	    waist="Lucidity sash",
--	    legs="Marduk's Shalwar +1",
--	    sub="Vox grip",
--	    feet="Marduk's crackows +1"
--    }

--    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Helios spats"})
-- 
--    sets.midcast.Pet['Elemental Magic'].Resistant = {}


--[#12 Idle/DT sets ]--

-- Resting sets
sets.resting = {
	main="Chatoyant Staff",
	sub="Oneiros grip",
	waist="Fucho-no-obi",
	legs="Assiduity pants +1",
}

sets.idlekeep = {
	hands="Asteria Mitts +1",
}
-- Idle sets
sets.idle = {
	--main="Nirvana",
	main=refreshstaff,
	sub="Elan Strap +1",
	ammo="Sancus Sachet +1",
	head="Convoker's Horn +2",
	body="Apogee Dalmatica +1",
	hands=merlinic_hands_refresh,
	legs="Assiduity pants +1",
	feet=merlinic_feet_refresh,
	neck="Loricate Torque +1",
	waist="Shinjutsu-no-obi +1",
	left_ear="Etiolation Earring",
	right_ear="Evans earring",
	left_ring={name="Mephitas's Ring +1",priority=4},
	right_ring={name="Mephitas's Ring",priority=4},
	back=conveyance,
	--ammo="Seraphicaller",
	--body="Shomonjijoe +1",
	--left_ear="Evans Earring",
	--left_ear="Etiolation Earring",
	--right_ear="Odnowa Earring +1",
	--left_ring="Defending Ring",
	--right_ring="Gelatinous Ring +1",
	--back="Solemnity Cape",--4
}
sets.damagetaken = {}
sets.damagetaken.None = {
}
sets.damagetaken.DT = {
	head="Blistering sallet",
	body="Onca Suit",--10
	hands="",
	legs="",
	feet="",
	neck="Loricate Torque +1", --6
	left_ring="Defending Ring",--10
	right_ear="Genmei Earring",
	back="Solemnity Cape",--4
}
sets.damagetaken.PDT = { --
	main="Mafic Cudgel", --10
	sub="Genmei Shield", --10
	left_ring="Defending Ring",--10
	right_ring="Gelatinous Ring +1",--6
	left_ear="Etiolation Earring", --3mdt
	right_ear="Genmei Earring",
	neck="Loricate Torque +1", --6
	head="Blistering sallet",
	body="Onca Suit", --10
	hands="",
	legs="",
	feet="",
	back="Solemnity Cape"--4
	--main="Earth Staff", --20
	--back="Umbra Cape"--6, 12 at night
}
sets.damagetaken.MDT = {--Shell V is around 24%
	main="Mafic Cudgel",
	sub="Genmei Shield",
	ammo="Sancus Sachet +1",
	head="Inyanga Tiara +1",
	body="Inyanga Jubbah +1", 
	hands="Inyan. Dastanas +1",
	legs="Inyanga shalwar +1",
	feet="Inyan. Crackows +1",
	neck="Loricate Torque +1",
	waist="Lucidity Sash",
	left_ear="Etiolation Earring",
	right_ear="Genmei Earring",
	left_ring="Defending Ring",
	right_ring="Gelatinous Ring +1",
	back="Solemnity Cape",
	--ammo="Seraphicaller",
	--body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	--legs="Gyve Trousers",
	--right_ear="Rimeice Earring",
--	main="Mafic Cudgel", --10
--	sub="Genmei Shield", --10
--	left_ring="Defending Ring",--10
--	back="Solemnity Cape",--4
--	left_ear="Etiolation Earring", --3mdt
--	neck="Loricate Torque +1", --6
	--left_ring="Vengeful Ring",--magiceva
}
sets.magiceva = {
	head="Inyanga Tiara +1",
	body="Inyanga Jubbah +1", 
	hands="Inyan. Dastanas +1",
	legs="Inyanga shalwar +1",
	feet="Inyan. Crackows +1",
	neck="Loricate Torque +1",
	waist="Lucidity Sash",
	ear1="Etiolation Earring",
	ear2="Evans earring",
	left_ring="Purity Ring",
	right_ring="Vengeful Ring",
	back=campestres_idle
	--right_ear="Rimeice Earring",
	--right_ear="Genmei Earring",
	--back="Solemnity Cape",
}
sets.pullmode = set_combine(sets.damagetaken.MDT,{body="Vanya Robe",feet="Hippomenes Socks +1"})
sets.pullmode2 = {
	main="Mafic Cudgel", --10
	sub="Genmei Shield", --10
	right_ring="Gelatinous Ring +1",--7
	left_ring="Defending Ring",--10
	left_ear="Etiolation Earring", --3mdt
	neck="Loricate Torque +1", --6
	feet="Hippomenes Socks +1",
	back="Solemnity Cape"--4
	--back="Umbra Cape"--6, 12 at night
}
--sets.damagetaken.MagicEvasion = {
	--left_ring="Vengeful Ring",--9
	--right_ring="Purity Ring",--10
	--back="Felicitas Cape +1",--10
	--body="Onca Suit" -- 252
	--body 91, hands 48, legs 118, feet 118
	--left_ear="Eabani Earrng", --8
	--right_ear="Flashward Earrng", --8
	--head 86
	--
--}
sets.petdamagetaken = {}
sets.petdamagetaken.DT = {
	main="Sucellus",--3
	sub="Genmei Shield",
	neck="Empath Necklace",
	head=selenian,--10
	--neck="Adad Amulet",--4
	left_ear="Handler's Earring +1",--4PDT
	right_ear="Enmerkar Earring",--3
	body="Apogee Dalmatica",--3
	legs="Psycloth Lappas",--4
	feet="Apogee Pumps +1",
	waist="Lucidity Sash",
	back=campestres_idle
	--right_ear="Handler's Earring",
}
--27 DT
--4 PDT
--7 DT stout servant
--50 Native PDT
--88PDT
--34MDT,BDT

sets.petdamagetaken.Full = {
	main="Sucellus",
	sub="Genmei Shield",
	body="Apogee Dalmatica",
	neck="Empath Necklace",
	--neck="Adad Amulet",
	left_ear="Handler's Earring +1",
	right_ear="Rimeice earring",
	legs="Psycloth Lappas",
	--main=bpmagicstaff,
	head=selenian,
	--right_ear="Handler's Earring",
}

sets.precast.FC.PDT = set_combine(sets.precast.FC, sets.damagetaken.PDT)
sets.idle.PDT = {--mixes refresh with pdt
	ammo="Sancus Sachet +1",
	head="Convoker's Horn +2",
	body="Apogee Dalmatica +1",
	--hands="Asteria Mitts +1",
	hands=merlinic_hands_refresh,
	legs="Assiduity pants +1",
	waist="Fucho-no-obi",
	left_ear="Andoaa earring",
	right_ear=moonshade,
	right_ring="Gelatinous Ring +1", --6
	left_ring="Defending Ring", --10
	back="Solemnity Mantle"--4
	--ammo="Seraphicaller",
	--body="Shomonjijoe +1",
	--feet="Convoker's Pigaches +1",
}

-- perp costs:
-- spirits: 7
-- carby: 11 (5 with mitts)
-- fenrir: 13
-- others: 15
-- avatar's favor: free, if you minimized perp cost already, -4 a tick with no -perp gear.  Weird I know but it's true, test it yourself

-- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
-- Aim for -14 perp, and refresh in other slots.
--

-- -perp gear:
-- Grivardor: -5
-- Glyphic Horn: -4
-- Caller's Doublet +2/Glyphic Doublet: -4
-- Evoker's Ring: -1
-- Convoker's Pigaches: -4
-- total: -18

-- Can make due without either the head or the body, and use +refresh items in those slots.


sets.idle.PDT = {}
sets.idle.Spirit = set_combine(sets.midcast.Pet.BloodPactWard, {main="Nirvana",legs=glyphicspats})

--[#13 Perp Sets ]--
sets.idle.Avatar = { 
	main="Nirvana",
	sub="Vox Grip",
	head="Beckoner's Horn +1",
	body="Apogee Dalmatica +1",
	--hands="Asteria Mitts +1",
	hands=merlinic_hands_refresh,
	legs="Assiduity pants +1",
	neck="Caller's Pendant",
	ammo="Sancus Sachet +1",
	waist="Lucidity sash",
	left_ear="Evans earring",
	right_ear="Andoaa Earring",
	feet=merlinic_feet_refresh,
	left_ring={name="Mephitas's Ring +1",priority=3},
	right_ring="Evoker's ring",
	back=campestres_idle
	--back=conveyance
	--left_ring="Globidonta Ring",
	--body="Shomonjijoe +1",
	--ammo="Seraphicaller",
	--right_ear="Moonshade Earring",
	--left_ear="Summoning earring",
}
sets.favor= {}
sets.favor.mpsaver={ -- don't sacrifice refresh gear for smn skill gear
	main="Nirvana",
	sub="Vox Grip",
	ammo="Sancus Sachet +1",
	head="Beckoner's Horn +1",
	body="Apogee Dalmatica +1",
	--hands="Asteria Mitts +1",
	hands=merlinic_hands_refresh,
	legs="Assiduity Pants +1",
	feet=merlinic_feet_refresh,
	neck="Caller's Pendant",
	waist="Lucidity sash",
	left_ear="Summoning earring",
	right_ear="Andoaa Earring",
	left_ring="Globidonta Ring",
	right_ring="Evoker's ring",
	back=campestres_att
	--left_ear="Evans earring",
	--right_ear="Moonshade Earring",
	--body="Shomonjijoe +1",
	--ammo="Seraphicaller",
	--back=conveyance
}
sets.favor.mpsaver=sets.idle.Avatar
sets.favor.allout={ -- equip all the favor and smn skill you can while not losing MP
	main="Nirvana",
	sub="Vox Grip",
	ammo="Sancus Sachet +1",
	head="Beckoner's Horn +1",
	body="Beck. Doublet +1",
	--hands="Asteria Mitts +1",
	hands=merlinic_hands_refresh,
	legs="Beck. Spats +1",
	feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
	neck="Incanter's Torque",
	waist="Lucidity Sash",
	left_ear="Andoaa Earring",
	right_ear=moonshade,
	left_ring="Globidonta Ring",
	right_ring="Evoker's Ring",
	back=conveyance
	--ammo="Seraphicaller",
}

sets.idle.Spirit = set_combine(sets.midcast.Pet.BloodPactWard, {main="Nirvana",left_ear=moonshade,legs=glyphicspats})
sets.perp = sets.idle.Avatar
sets.engaged = sets.perp 
sets.engaged.Perp = sets.perp
sets.idlehealer = {
	main="Nirvana", --10
	sub="Vox Grip",
	head="Beckoner's Horn +1",
	right_ring="Gelatinous Ring +1",--7
	left_ring="Defending Ring",--10
	left_ear="Etiolation Earring", --3mdt
	right_ear=moonshade,
	neck="Loricate Torque +1", --6
	back="Solemnity Cape",--4
	--hands="Asteria Mitts +1",
	hands=merlinic_hands_refresh,
	legs="Assiduity pants +1",
	body="Apogee Dalmatica +1",
	feet=merlinic_feet_refresh,
	--body="Shomonjijoe +1",
}


-- -5 staff
--    head +2
--    body +3
-- -3 pants +2
--    hands +2
--    earring +1
-- -1 ring
-- -2 waist
-- -8 feet
-- -2 earring
-- Caller's Bracer's halve the perp cost after other costs are accounted for.
-- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
-- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
-- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
--sets.perp.Day = {body="Hagondes Coat +1"}
--sets.perp.Weather = {neck="Caller's Pendant",body="Hagondes Coat +1"}
sets.perp.Weather = {neck="Caller's Pendant"}
-- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh
--    sets.perp.Carbuncle = {
--	    hands="Carbuncle Mitts"
--    }
sets.perp.Carbuncle = set_combine(sets.perp, {hands="Asteria Mitts +1"})
sets.perp['Cait Sith'] = set_combine(sets.perp, {hands="Lamassu Mitts +1"})
sets.perp.LightSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {main=smnskillstaff,right_ear=moonshade,legs=glyphicspats})
sets.perp.AirSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {legs=glyphicspats})
sets.perp.FireSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {legs=glyphicspats})
--can add other spirits too 

--    sets.perp.staff_and_grip = {main=gear.perp_staff}
--[#14 Avatar Melee/DT Sets ]--
sets.Avatar = {}
sets.Avatar.Haste = { --Warning! This set equipped whenever your pet is engaged, even if you aren't
	main=avatarattackstaff,
	sub="Vox Grip",
	head="Convoker's Horn +2",--5
	--feet="Tali'ah Crackows +1",--7
	left_ear="Enmerkar Earring",
	right_ear="Rimeice Earring", --1
	waist="Klouskap Sash",--8
	back=campestres_att--10
--	head="Beckoner's Horn +1",
--	--body="Shomonjijoe +1",
--	body="Apogee Dalmatica",
--	hands="Asteria Mitts +1",
--	legs="Assiduity pants +1",
--	feet="Apogee pumps +1",
--	feet={ name="Merlinic Crackows", augments={'STR+10','Pet: "Mag.Atk.Bns."+23','"Refresh"+2','Accuracy+4 Attack+4','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
--	ammo="Seraphicaller",
--	right_ear="Moonshade Earring",
--	left_ring="Globidonta Ring",
--	right_ring="Evoker's ring",
	--right_ear="Rimeice earring",--3
	--waist="Moepapa Stone",--5
	--left_ring="Varar Ring",
	--right_ring="Varar Ring",
	--back="Penetrating Cape",
	--neck="Empath necklace",
}
--Pet Haste: 18
sets.Avatar.Haste.Full = { --Warning! This set equipped whenever your pet is engaged, even if you aren't
}


--[#15 Engaged Sets ]--
if use_melee then
	sets.engaged.Melee = {
		main="Nirvana",
		sub="Flanged Grip",
		head="Tali'ah Turban +1",
		body="Tali'ah Manteel +1",
		hands="Tali'ah Gages +1",
		legs="Tali'ah Seraweels +1",
		feet="Tali'ah Crackows +1",
		neck="Subtlety spectacles",
		left_ring="Cacoethic Ring +1",
		right_ring="Varar Ring",
		--left_ear="Zennaroi Earring",
		left_ear="Telos Earring",
		right_ear="Dignitary's Earring",
		--waist="Olseni Belt",
		waist="Klouskap sash",
		back=campestres_att
		--back="Penetrating Cape"
	}

	sets.meleehybrid = {
		neck="Empath Necklace",
		left_ear="Zennaroi Earring",
		right_ear="Cessance Earring",
		waist="Olseni Belt",
		back=campestres_att
	}
else
	sets.engaged.Melee = {
		sub="Flanged Grip",
		body="Onca Suit",
		right_ring="Evoker's Ring",
		back=campestres_att
	}
	sets.engaged.Kclub = {
		main="Kraken Club",
		body="Onca Suit",
		right_ring="Evoker's Ring",
		back=campestres_att
	}
end
-- For future use, ignore for now -- 
-- Magic Accuracy setting, overrides gear above
-- commented section here (anything after -- are comments) for future versions
--sets.bp_magic_acc = {
--	main=bpmagicaccstaff,
--	hands="Apogee Mitts",
--	back=conveyance
--}
---- Physical Accuracy setting, overrides physical pact
--sets.bp_phys_acc = {
--	hands="Apogee Mitts",
--	back=conveyance
--}
---- Hybrid Accuracy setting, overrides hybrid pact
--sets.bp_hybrid_acc = {
--	main=bpmagicaccstaff,
--	hands="Apogee Mitts",
--	back=conveyance
--}

--sets.midcast.FastRecast = {
--	    main="Marin Staff",
--	    sub="Vivid Strap",
--	    ammo="Seraphicaller",
--	    head="Haruspex hat",
--	    neck="Jeweled collar",
--	    ear2="Loquacious earring",
--	    hands="Regimen mittens",
--	    body="Vanir cotehardie",
--	    ring1="Weatherspoon ring",
--	    ring2="Prolix ring",
--	    back="Swith cape",
--	    waist="Witful belt",
--	    legs="Lengo pants",
--	    feet="Glyph pigaches +1"
--}
