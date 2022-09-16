-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
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

	sets.idle = sets.AvatarPerp
	--sets.engaged = set_combine(sets.AvatarPerp, sets.MeleeAvatar, {})
	sets.engaged = sets.AvatarPerp
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
	
	-- Toggle Modes
	--Setup gearMode
	sets.gearMode = {}
    sets.gearMode.index = {'DPS','DT'}
    gearMode_ind = 1
	
	--Setup weaponMode
	sets.weaponMode = {}
	sets.weaponMode.index = {'PhysBP','MagicBP'}
	weaponMode_ind = 1

	--Setup modeMod
	sets.modeMod = {}
	sets.modeMod.index = {'Normal','CP'}
	modeMod_ind = 1

	--Setup autoBuff
	sets.autoBuff = {}
	sets.autoBuff.index = {'Off','On'}
	autoBuff_ind = 1
end

function job_setup()
	-- i'm not actually using these for anything yet - probably should?   just saved them from someone else's .lua so i'd know the breakdowns if 
	-- i ever wanted to get that crazy with it
	magicalRagePacts = S{
		'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
		'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
		'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
		'Thunderspark','Meteorite','Nether Blast','Meteor Strike',
		'Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
		'Holy Mist','Lunar Bay','Night Terror','Level ? Holy',
		'Conflag Strike','Crag Throw'}
	hybridRagePacts = S{'Burning Strike','Flaming Crush'}


	-- and these might maybe turn into that thing i was talking about - where keybinds update on the fly based on what avatar you have out...
	-- again, not used for anything yet.  just sorting into common categories so each avatar would have the same "set" of buttons
	pacts = {}
	pacts.cure = {['Carbuncle']='Healing Ruby'}
	pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
	pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder',
		['Fenrir']='Ecliptic Growl'}
	pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward',
		['Ramuh']='Lightning Armor', ['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield', ['Cait Sith']='Reraise II'}
	pacts.buffspecial = {['Ifrit']='Inferno Howl', ['Garuda']='Fleet Wind', ['Titan']='Earthen Armor',['Shiva']='Crystal Blessing', ['Leviathan']='Soothing Current',['Diabolos']='Dream Shroud',
		['Carbuncle']='Soothing Ruby', ['Fenrir']='Heavenward Howl', ['Cait Sith']='Raise II'}
	pacts.debuff1 = {['Shiva']='Diamond Storm', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Fenrir']='Lunar Cry',
		['Diabolos']='Pavor Nocturnus', ['Cait Sith']='Eerie Eye'}
	pacts.debuff2 = {['Shiva']='Sleepga', ['Leviathan']='Slowga', ['Fenrir']='Lunar Roar', ['Diabolos']='Somnolence'}
	pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare', ['Cait Sith']='Mewing Lullaby'}
	pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',
		['Ramuh']='Thunder II', ['Leviathan']='Water II'}
	pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',
		['Ramuh']='Thunder IV', ['Leviathan']='Water IV'}
	pacts.bp70 = {['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
		['Ramuh']='Chaotic Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite',
		['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'}
	pacts.bp75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
		['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall', ['Carbuncle']='Holy Mist', ['Fenrir']='Lunar Bay',
		['Diabolos']='Night Terror', ['Cait Sith']='Level ? Holy'}
	pacts.bp99 = {['Ifrit']='Conflag Strike', ['Shiva']='Rush', ['Garuda']='Wind Blade', ['Titan']='Crag Throw',
		['Ramuh']='Volt Strike', ['Carbuncle']='Holy Mist', ['Fenrir']='Impact', ['Diabolos']='Blindside'}
	pacts.astralflow = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
		['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon',
		['Diabolos']='Ruinous Omen', ['Cait Sith']="Altana's Favor"}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
function user_setup()
	--Setup my binds
	send_command('bind F9 gs c toggleGearMode')
	send_command('bind ^F9 gs c toggleWeaponMode')
	send_command('bind F10 gs c toggleModeMod')
	send_command('bind F11 gs c toggleAutoBuff')
	send_command('bind F12 input //gs reload')
	
	send_command('bind != gs c elesiphon')

	--Set default macro book / page
    set_macro_page(1, 9)

	--Set style lock
	windower.send_command('wait 2; input /lockstyleset 7')
end

-------------------------------------------------------------------------------------------------------------------
function user_unload()
    send_command('unbind ^=')
	send_command('unbind !=')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind F9')
	send_command('unbind ^F9')
	send_command('unbind F10')
	send_command('unbind F11')
	send_command('unbind F12')
end

-------------------------------------------------------------------------------------------------------------------
-- Precast
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	--add_to_chat(167, '~Ability Name: '..spell.english..' RecastID: '..spell.recast_id..'~')
	
	-- don't try to do stuff if we can't do stuff
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
        return
    end

   	-- DarkArts --> Addendum: Black
	if spell.english == 'Dark Arts' and buffactive['Addendum: Black'] then
		cancel_spell()
		send_command('input /ja "Manifestation" <me>')
		return
	end
	if spell.english == 'Dark Arts' and buffactive['Dark Arts'] then
		cancel_spell()
		send_command('input /ja "Addendum: Black" <me>')
		return
	end

	-- LightArts --> Addendum: White
	if spell.english == 'Light Arts' and buffactive['Addendum: White'] then
		cancel_spell()
		send_command('input /ja "Accession" <me>')
		return
	end
	if spell.english == 'Light Arts' and buffactive['Light Arts'] then
		cancel_spell()
		send_command('input /ja "Addendum: White" <me>')
		return
	end

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

-------------------------------------------------------------------------------------------------------------------
-- Post Midcast
-------------------------------------------------------------------------------------------------------------------
function job_post_midcast(spell, action, spellMap, eventArgs)
	-- if spell element matches day or weather element, and it's not a weaponskill, use mega obi
	if spell.type ~= 'WeaponSkill' then
		if (spell.element == world.day_element or spell.element == world.weather_element) then
			equip {waist="Hachirin-no-obi"}
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function job_self_command(cmdParams, eventArgs)
	-- Elemental Siphon Handling
	if cmdParams[1]:lower() == 'elesiphon' then
		send_command('input //gs c toggleautobuff')
		send_command('/release')
		send_command:schedule(2,'/airspirit')
		send_command:schedule(6,'/elementalsiphon')
		send_command:schedule(8,'input //gs c toggleautobuff')
	end
	
	-- Change current gear mode
	if cmdParams[1]:lower() == 'togglegearmode' then
        gearMode_ind = gearMode_ind + 1
        if gearMode_ind > #sets.gearMode.index then 
			gearMode_ind = 1 
		end
		update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.modeMod.index[modeMod_ind])
		add_to_chat(122,'-- GearMode:' .. sets.gearMode.index[gearMode_ind] .. ' --')
	end
	
	-- Change current weapon
	if cmdParams[1]:lower() == 'toggleweaponmode' then
        weaponMode_ind = weaponMode_ind + 1
        if weaponMode_ind > #sets.weaponMode.index then 
			weaponMode_ind = 1 
		end
		
		add_to_chat(122,'-- WeaponMode:' .. sets.weaponMode.index[weaponMode_ind] .. ' --')
		
		if sets.weaponMode.index[weaponMode_ind] == "PhysBP" then
			sets.weapons = {main="Gridarvor", sub="Elan Strap +1"}
		end
		if sets.weaponMode.index[weaponMode_ind] == "MagicBP" then
			sets.weapons = {main="Espiritus", sub="Elan Strap +1"}
		end
		equip(sets.weapons)
	end
	
	-- Toggle autoBuff on / off
	if cmdParams[1]:lower() == 'toggleautobuff' then
		autoBuff_ind = autoBuff_ind + 1
		if autoBuff_ind > #sets.autoBuff.index then
			autoBuff_ind = 1
		end
		add_to_chat(122,'-- autoBuff:' .. sets.autoBuff.index[autoBuff_ind] .. ' --')
	end
	
	-- Change current modeMod
	if cmdParams[1]:lower() == 'togglemodemod' then
        modeMod_ind = modeMod_ind + 1
        if modeMod_ind > #sets.modeMod.index then 
			modeMod_ind = 1 
		end
		update_IdleEngagedSets(sets.gearMode.index[gearMode_ind],sets.modeMod.index[modeMod_ind])
		add_to_chat(122,'-- ModeMod:' .. sets.modeMod.index[modeMod_ind] .. ' --')
	end

	-- autofite
	if cmdParams[1]:lower() == 'autofite' then
		if autoFite == nil or autoFite == 0 then
			autoFite = 1
		else
			autoFite = 0
		end
		add_to_chat(122,'-- AutoFite set to:'..autoFite..' --')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Idle / Engaged set handling
-------------------------------------------------------------------------------------------------------------------
function update_IdleEngagedSets(gearMode, modeModifier)
	if modeModifier == 'CP' then
		sets.idle = set_combine(sets.idle, {back="Mecisto. Mantle"})
		sets.engaged = set_combine(sets.engaged, {back="Mecisto. Mantle"})
	end
	if modeModifier ~= 'CP' then
		sets.idle = set_combine(sets.idle, {back="Campestres's Cape"})
		sets.engaged = set_combine(sets.engaged, {back="Campestres's Cape"})
	end
	
	evalState_equipGear()
end

-------------------------------------------------------------------------------------------------------------------
-- Equip gear based on state
-------------------------------------------------------------------------------------------------------------------
function evalState_equipGear()
	if player.status == 'Idle' then
		equip(sets.idle)
    else
		equip(sets.engaged)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping
-------------------------------------------------------------------------------------------------------------------
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


-------------------------------------------------------------------------------------------------------------------
-- Auto tic ~once per second
-------------------------------------------------------------------------------------------------------------------

function partyLowHP(hpLevel)
	local partyInfo = windower.ffxi.get_party()
	for _,info in pairs(partyInfo) do
		if type(info) == 'table' and info.mob then
			local partyMember = info.mob
			if partyMember.hpp < hpLevel then
				return true
			end
		end
	end
	return false
end

function autoActions()
	local abil_recasts = windower.ffxi.get_ability_recasts()
	local rageRecast = abil_recasts[173]
	local wardRecast = abil_recasts[174]
	local subRecast = abil_recasts[234]
	local siphonRecast = abil_recasts[175]
	local currAvatar = windower.ffxi.get_mob_by_target('pet')

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

	-- Myrkr!
	if player.mpp < 35 and player.tp > 2500 then
		add_to_chat(122,'-- MP below 35% - Myrkr! --')
		send_command('input /ws "Myrkr" <me>')
		return
	end

	-- Avatar's Favor Handling
	if pet.isvalid and not buffactive["Avatar's Favor"] then
		send_command('input /ja "Avatar\'s Favor" <me>')
	end

	-- Autofite only
	if autoFite == 1 then
		local mainAvatar = "Ifrit"
		
		--[[ if not buffactive['Haste'] then
			requiredAvatar = 'Garuda'
		elseif not buffactive['TP Bonus'] then
			requiredAvatar = 'Shiva'
		else ]]
		if not buffactive['Phalanx'] then
			requiredAvatar = 'Diabolos'
		else
			requiredAvatar = mainAvatar
		end
		
		if pet.isvalid then
			currAvatar = windower.ffxi.get_mob_by_target('pet')
			if currAvatar.name ~= requiredAvatar then
				send_command('/release')
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
			if windower.ffxi.get_player().status == 1 and windower.ffxi.get_mob_by_target('pet').status == 0 then
				send_command('/assault')
			end
		end

		if currAvatar.name == 'Ifrit' then
			if currAvatar.status == 1 and mainAvatar == "Ifrit" and rageRecast == 0 and player.mpp >= 35 then
				send_command('/flamingcrush')
				return
			end
			
			if not buffactive['Warcry'] and wardRecast == 0 then
				send_command('/crimsonhowl')
				return
			end
		end

		if currAvatar.name == 'Ramuh' then
			if currAvatar.status == 1 and mainAvatar == "Ramuh" and rageRecast == 0 and player.mpp >= 35 then
				send_command('/voltstrike')
				return
			end
			
			if not buffactive['Warcry'] and wardRecast == 0 then
				send_command('/lightningarmor')
				return
			end
		end

		if currAvatar.name == 'Carbuncle' then
			if partyLowHP(60) and wardRecast == 0 then
				send_command('/healingruby2')
			end

			if not buffactive['Shining Ruby'] and wardRecast == 0 then
				send_command('/shiningruby')
				return
			end
		end

		if currAvatar.name == 'Garuda' then
			if not buffactive['Haste'] and wardRecast == 0 then
				send_command('/Hastega II')
				return
			end
		end

		if currAvatar.name == 'Diabolos' then
			if not buffactive['Phalanx'] and wardRecast == 0 then
				send_command('/noctoshield')
				return
			end
		end

		if currAvatar.name == 'Shiva' then
			if not buffactive['TP Bonus'] and wardRecast == 0 then
				send_command('/Crystal Blessing')
				return
			end
		end
	end
end


slowTick = 0
castingTic = 0
castInProgress = false

windower.raw_register_event('postrender',function()
	slowTick = slowTick + 1;
	if slowTick > 60 then
		slowTick = 0
		if sets.autoBuff.index[autoBuff_ind] == 'On' and not actionInProgress and not moving then
			autoActions()
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------
-- Turn off autoBuff when we zone
-------------------------------------------------------------------------------------------------------------------
windower.register_event('zone change', function()
	if sets.autoBuff.index[autoBuff_ind] == 'On' then
		autoBuff_ind = 1
		add_to_chat(122,'-- autoBuff set to ' .. sets.autoBuff.index[autoBuff_ind] .. ' --')
	end
end)