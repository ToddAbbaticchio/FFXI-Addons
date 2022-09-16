--1.13.2017
-------------------------------------------------------------------------------------------------------------------
-- Under the hood after this point, modify at your own risk
-------------------------------------------------------------------------------------------------------------------
function setup_hud()
    smn_property = { avatar = "\\cs(255,0,0)None\\cr", pacts = {['Rage']="",['Ward']=""}, }
    smn_info = {}
    smn_info.box = {
		pos={x = 1700, y = 250},
		text = {
			font='Segoe UI Symbol',
			size = 12,
			Fonts = { 'sans-serif' },
		},
		bg = { alpha = 220, red = 0, green = 15, blue = 0 },
		flags = { draggable = false },
		padding = 7
	}
    window = texts.new(smn_info.box)
    initialize(window, smn_info.box)
    window:show()
    updatedisplay()
end

if use_icon then
	images =require('images')
end
inwkr = 0
--display_hud=true

function d_chat(s)
    if debug_gs1 then add_to_chat(122,s) end
end
function get_sets()
    mote_include_version = 2
 
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('organizer-lib')
end
 
function initialize(text, settings)
	local properties = L{}
	properties:append('Avatar : ${avatar}')
	properties:append('${ragepacts}')
	properties:append('${wardpacts}')
	properties:append('${pactinfo}')
	properties:append('${modestates}')
	text:clear()
	text:append(properties:concat('\n'))
end
function concat_strings(s)
    local t = { }
    for k,v in ipairs(s) do
        t[#t+1] = tostring(v)
    end
    return table.concat(t,"\n")
end
fenrir_effects = {
	'Lunar Cry\n\\cs(125,125,255) Eva. -31 Acc. -1\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +1 Eva. +25\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +1 \n AGI/INT/MND/CHR +7\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -26 Acc. -6\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +5 Eva. +21\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +2 \n AGI/INT/MND/CHR +6\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -21 Acc. -11\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +9 Eva. +17\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +3 \n AGI/INT/MND/CHR +5\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -16 Acc. -16\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +13 Eva. +13\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +4 \n AGI/INT/MND/CHR +4\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -11 Acc. -21\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +17 Eva. +9\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +5 \n AGI/INT/MND/CHR +3\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -6 Acc. -26\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +21 Eva. +5\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +6 \n AGI/INT/MND/CHR +2\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -1 Acc. -31\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +25 Eva. +1\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +7 \n AGI/INT/MND/CHR +1\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -6 Acc. -26\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +21 Eva. +5\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +6 \n AGI/INT/MND/CHR +2\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -11 Acc. -21\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +17 Eva. +9\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +5 \n AGI/INT/MND/CHR +3\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -16 Acc. -16\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +13 Eva. +13\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +4 \n AGI/INT/MND/CHR +4\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -21 Acc. -6\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +9 Eva. +17\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +3 \n AGI/INT/MND/CHR +5\\cr',
	'Lunar Cry\n\\cs(125,125,255) Eva. -26 Acc. -1\\cr\nEcliptic Howl\n\\cs(125,125,255) Acc. +5 Eva. +21\\cr\nEcliptic Growl\n\\cs(125,125,255) STR/DEX/VIT +2 \n AGI/INT/MND/CHR +6\\cr'
}
diabolos_effects = {
	'Dream Shroud\n\\cs(125,125,255) MAB +13, MDB +1\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +12, MDB +2\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +11, MDB +3\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +10, MDB +4\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +9, MDB +5\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +8, MDB +6\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +7, MDB +7\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +6, MDB +8\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +5, MDB +9\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +4, MDB +10\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +3, MDB +11\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +2, MDB +12\\cr',
	'Dream Shroud\n\\cs(125,125,255) MAB +1, MDB +13\\cr',
}
local res = require('resources')
function set_hud_info()
	if pet.name then 
		smn_property.avatar = "\\cs(125,125,255)"..pet.name.."\\cr"
	else
		smn_property.avatar = "\\cs(125,125,125)None\\cr"
	end
	--print('c:'..pet.name)
	tmp_sort = {['Rage']={},['Ward']={}}
	--print(tostring(tmp_sort['Ward']))
	smn_property.pacts['Rage'] = ''
	smn_property.pacts['Ward'] = ''
	for index,value in pairs(pacts) do
		--print('p:'..smn_property.pacts)
		--print('i:'..index)
		--print('v:'..pacts[index][pet.name])
		if pacts[index][pet.name] then 
			keybindtxt = ''
			category = ''
			for k,v in pairs(pact_keys[index]) do 
				category = k
				keybindtxt = v
				break 
			end
			--print (category..keybindtxt)
			tmp_sort[category][keybindtxt] = smn_property.pacts[category].."\n     ".. keybindtxt.. ": \\cs(125,125,255)".. pacts[index][pet.name]..'\\cr     ' 
		end
	end
	for index,value in spairs(tmp_sort['Rage']) do
		smn_property.pacts['Rage'] = smn_property.pacts['Rage']..value
	end
	for index,value in spairs(tmp_sort['Ward']) do
		smn_property.pacts['Ward'] = smn_property.pacts['Ward']..value
	end
	if smn_property.pacts['Rage'] ~= '' then smn_property.pacts['Rage'] = "-- Rage --"..smn_property.pacts['Rage'] end
	if smn_property.pacts['Ward'] ~= '' then smn_property.pacts['Ward'] = "\n-- Ward --"..smn_property.pacts['Ward'] end
	if display_states then 
		modestates_table = {
			'\n-- Modes --\n     Offense: \\cs(125,125,255)'..tostring(state.OffenseMode.value)..'\\cr',
			'     Casting: \\cs(125,125,255)'..tostring(state.CastingMode.value)..'\\cr',
			'     DT: \\cs(125,125,255)'..tostring(state.damagetaken.value)..'\\cr',
			'     Pet DT: \\cs(125,125,255)'..tostring(state.petdamagetaken.value)..'\\cr',
			'     Capacity Points: \\cs(125,125,255)'..tostring(state.cpmode.value)..'\\cr',
			'     Movement: \\cs(125,125,255)'..tostring(state.movement.value)..'\\cr',
			'     TP/Staff Lock: \\cs(125,125,255)'..tostring(state.tplock.value)..'\\cr',
			'     Impact Debuff: \\cs(125,125,255)'..tostring(state.impactmode.value)..'\\cr',
			'     Favor: \\cs(125,125,255)'..tostring(state.favor.value)..'\\cr',
			'     Magic Burst: \\cs(125,125,255)'..tostring(state.burstmode.value)..'\\cr',
		}
		smn_property.modestates = concat_strings(modestates_table)
	else
		smn_property.modestates = ''
	end
	moon = res.moon_phases[windower.ffxi.get_info().moon_phase].english
	enaspirMoons = S{ "Waxing Crescent","New Moon","Waning Crescent","Last Quarter Moon" }
	smn_property.pactinfo = ''
	howl = ''
	if pet.name=="Fenrir" then
		moon_phase = windower.ffxi.get_info().moon_phase + 1
		--if moon_phase == 1 or moon_phase > 6 then
		if enaspirMoons:contains(moon) then
			howl='\n \\cs(125,125,255)Enaspir\\cr'
		else
			howl='\n \\cs(125,125,255)Endrain\\cr'
		end
		smn_property.pactinfo = {
			fenrir_effects[moon_phase],
			'Heavenward Howl '..howl
		}
		smn_property.pactinfo = '\n'..concat_strings(smn_property.pactinfo)
	elseif pet.name=="Diabolos" then
		local hour = math.floor(windower.ffxi.get_info().time / 60)
		if hour > 12 then
			hour = 24 - hour
		end
		smn_property.pactinfo = {
			diabolos_effects[hour + 1]
		}
		smn_property.pactinfo = '\n'..concat_strings(smn_property.pactinfo)
	end
end
update_delay=0
function updatedisplay() --update hud display
	if update_delay ~=0 then
		coroutine.sleep(update_delay)
		update_delay = 0
	end
	set_hud_info()
	local info = {}
	info.avatar = smn_property.avatar
	info.ragepacts = smn_property.pacts['Rage']
	info.wardpacts = smn_property.pacts['Ward']
	info.pactinfo = smn_property.pactinfo
	info.modestates = smn_property.modestates
	if pet.name then 
		icon = pet.name:lower()
	else
		icon = 'base'
	end
	if use_icon then
		images.path(avatar_icon,base_icon_dir..icon..'.png')
		images.pos(avatar_icon,smn_info.box.pos.x,smn_info.box.pos.y-32)
		images.update(avatar_icon)
	end
	--button:update(info)
	--button:show()
	window:update(info)
	if display_hud then
		window:show()
	end
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff["Avatar's Favor"] = buffactive["Avatar's Favor"] or false
    state.Buff["Astral Conduit"] = buffactive["Astral Conduit"] or false
    buffrotation = {
	    [0] = {['Hastega II']='Garuda'},
	    [1] = {['Aerial Armor']='Garuda'},
	    [2] = {['Crimson Howl']='Ifrit'},
	    [3] = {['Earthen Armor']='Titan'},
	    [4] = {['Crystal Blessing']='Shiva'},
	    [5] = {['Frost Armor']='Shiva'},
	    [6] = {['Ecliptic Growl']='Fenrir'},
	    [7] = {['Ecliptic Howl']='Fenrir'},
	    [8] = {['Heavenward Howl']='Fenrir'},
	    [9] = {['Dream Shroud']='Diabolos'},
	    [10] = {['Noctoshield']='Diabolos'},
	    [11] = {['Soothing Current']='Leviathan'},
    }
    rotationfavor = 'Ifrit'
    buffrot_count = 0
    for index, value in pairs( buffrotation ) do
	    buffrot_count = buffrot_count + 1
    end
 
    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith"}
 
    magicalRagePacts = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV','Chaotic strike',
        'Thunderspark','Volt strike','Burning Strike','Meteorite','Nether Blast',
        'Meteor Strike','Conflag Strike','Heavenly Strike','Wind Blade','Geocrush','Crag Throw','Grand Fall','Thunderstorm',
        'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Impact','Zantetsuken'}
    enticersRagePacts = S{
	    'Impact','Conflag Strike', 'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
	    'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV'
    }
    physicalEnticersRagePacts = S{
		'Mountain Buster','Rock Buster','Crescent Fang','Eclipse Bite','Blindside'
	}
    meritPacts = S{
	    'Heavenly Strike','Wind Blade','Geocrush','Thunderstorm','Meteor Strike','Grand Fall'
    }
    enticersWardPacts = S{
	    'HealingRuby II','Healing Ruby'
    }
    healingWardPacts = S{
	    'HealingRuby II','Healing Ruby'
    }
    hybridPacts = S{
	    'Flaming Crush'
    }
 
    sets.cpmode = {back="Mecisto. Mantle"}
--    sets.dtmode = {
--	    main="Earth Staff",
--	    left_ring="Gelatinous Ring +1",
--	    right_ring="Defending Ring",
--    }
 
    pacts = {}
    pacts.cure = {['Carbuncle']='Healing Ruby'}
    pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
    pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder',
        ['Fenrir']='Ecliptic Growl'}
    pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward',
        ['Ramuh']='Lightning Armor', ['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield', ['Cait Sith']='Reraise II'}

    pacts.buffspecial = {['Ifrit']='Inferno Howl', ['Garuda']='Fleet Wind', ['Titan']='Earthen Armor', ['Diabolos']='Dream Shroud',
        ['Carbuncle']='Soothing Ruby',['Carbuncle']='Pacifying ruby', ['Shiva']='Crystal blessing',['Fenrir']='Heavenward Howl', ['Leviathan']='Soothing current',['Cait Sith']='Raise II',}

    pacts.debuff1 = {['Shiva']='Diamond Storm', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Fenrir']='Lunar Cry',
        ['Diabolos']='Pavor Nocturnus', ['Cait Sith']='Eerie Eye',['Carbuncle']='Soothing Ruby' }
    pacts.debuff2 = {['Leviathan']='Slowga', ['Fenrir']='Lunar Roar', ['Diabolos']='Somnolence'}
    pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare', ['Cait Sith']='Mewing Lullaby'}
    pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',
        ['Ramuh']='Thunder II', ['Leviathan']='Water II'}
    pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',
        ['Ramuh']='Thunder IV', ['Leviathan']='Water IV',['Fenrir']='Crescent Fang'}
    pacts.bp70 = {
	    ['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
	    ['Ramuh']='Chaotic Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite',
	    ['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'
    }
    pacts.bp75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
        ['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall', ['Carbuncle']='Holy Mist', ['Fenrir']='Lunar Bay',
        ['Diabolos']='Night Terror', ['Cait Sith']='Level ? Holy'}
    pacts.astralflow = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
        ['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon',
        ['Diabolos']='Ruinous Omen', ['Cait Sith']="Altana's Favor"}
    pacts.bprage1 = {['Fenrir']='Impact',['Ramuh']='Volt Strike',['Cait Sith']='Regal Gash',['Carbuncle']='Poison Nails',['Ifrit']='Conflag Strike',['Titan']='Crag Throw',['Diabolos']='Blindside',['Leviathan']='Tail Whip'}
    pacts.misc1 = {['Ramuh']='Thunderspark',['Fenrir']='Moonlit Charge'}
    pacts.misc2 = {['Diabolos']='Ultimate Terror'}

    --Note this is only for display on the Summoner HUD, if you want to change the actual keybinds you need to go to the user_setup function, this saves string comparisons but mostly makes it easier on the programmer (me)
    pact_keys = {}
    pact_keys.cure = {['Ward']='Alt 1'}
    pact_keys.curaga = {['Ward']='Alt 2'}
    pact_keys.buffoffense = {['Ward']='Alt 3'}
    pact_keys.buffdefense = {['Ward']='Alt 4'}
    pact_keys.buffspecial = {['Ward']='Alt 5'}
    pact_keys.debuff1 = {['Ward']='Alt 6'}
    pact_keys.debuff2 = {['Ward']='Alt 7'}
    pact_keys.sleep = {['Ward']='Alt 8'}
    pact_keys.nuke2 = {['Rage']='Ctrl 1'}
    pact_keys.nuke4 = {['Rage']='Ctrl 2'}
    pact_keys.bp70 = {['Rage']='Ctrl 3'}
    pact_keys.bp75 = {['Rage']='Ctrl 4'}
    pact_keys.bprage1 = {['Rage']='Ctrl 5'}
    pact_keys.astralflow = {['Rage']='Ctrl 6'}
    pact_keys.misc1 = {['Rage']='Ctrl 7'}
    pact_keys.misc2 = {['Ward']='Alt 9'}
 
    -- Wards table for creating custom timers  
    wards = {}
    -- Base duration for ward pacts.
    -- Icons to use when creating the custom timer.
    -- Base duration for ward pacts.
    wards.durations = {
        ['Crimson Howl'] = 60, ['Earthen Armor'] = 60, ['Inferno Howl'] = 60, ['Heavenward Howl'] = 60,
        ['Rolling Thunder'] = 120, ['Fleet Wind'] = 120,
        ['Shining Ruby'] = 180, ['Frost Armor'] = 180, ['Lightning Armor'] = 180, ['Ecliptic Growl'] = 180,
        ['Glittering Ruby'] = 180, ['Hastega'] = 180, ['Hastega II'] = 180,['Noctoshield'] = 180, ['Ecliptic Howl'] = 180,
        ['Dream Shroud'] = 180,
        ['Reraise II'] = 3600
    }
    -- Icons to use when creating the custom timer.
--    wards.icons = {
--        ['Earthen Armor']   = 'spells/00299.png', -- 00299 for Titan
--        ['Shining Ruby']    = 'spells/00043.png', -- 00043 for Protect
--        ['Dream Shroud']    = 'spells/00304.png', -- 00304 for Diabolos
--        ['Noctoshield']     = 'spells/00106.png', -- 00106 for Phalanx
--        ['Inferno Howl']    = 'spells/00298.png', -- 00298 for Ifrit
--        ['Hastega']         = 'spells/00358.png', -- 00358 for Hastega
--        ['Hastega II']         = 'spells/00358.png', -- 00358 for Hastega
--        ['Rolling Thunder'] = 'spells/00104.png', -- 00358 for Enthunder
--        ['Frost Armor']     = 'spells/00250.png', -- 00250 for Ice Spikes
--        ['Lightning Armor'] = 'spells/00251.png', -- 00251 for Shock Spikes
--        ['Reraise II']      = 'spells/00135.png', -- 00135 for Reraise
--        ['Fleet Wind']      = 'abilities/00074.png', --
--    }
	if custom_includes then 
		include('custom_aliases.lua')
	end

end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
function user_unload()
    send_command('unbind !1')
    send_command('unbind !2')
    send_command('unbind !3')
    send_command('unbind !4')
    send_command('unbind !5')
    send_command('unbind !6')
    send_command('unbind !7')
    send_command('unbind !8')
    send_command('unbind !9')
    send_command('unbind !0')

    send_command('unbind ^1')
    send_command('unbind ^2')
    send_command('unbind ^3')
    send_command('unbind ^4')
    send_command('unbind ^5')
    send_command('unbind ^6')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')
    send_command('unbind !%numpad1')
    send_command('unbind !%numpad2')
    send_command('unbind !%numpad3')
    send_command('unbind !%numpad4')
    send_command('unbind !%numpad5')
    send_command('unbind !%numpad6')
    send_command('unbind !%numpad7')
    send_command('unbind !%numpad8')
    send_command('unbind !%numpad9')
    send_command('unbind !%numpad0')
    send_command('unbind !%numpadenter')
    send_command('unbind !%numpad.')

    send_command('unbind !%delete')
    send_command('unbind !%pagedown')
    send_command('unbind !%end')

    send_command('unbind @%numpad0')
    send_command('unbind #0')
    send_command('unbind #9')

    send_command('unbind ^o')
    send_command('unbind !q')
    send_command('unbind !o')
    send_command('unbind !%numpad+')
    send_command('unbind !%numpad-')
    send_command('unbind f11')
    send_command('unbind !f11')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind !f10')
    send_command('unbind !f9')
    send_command('unbind ^[')
    send_command('unbind ![')
    send_command('unbind ^]')
    --send_command('unbind %numpad1 setkey f8 down;wait .1;setkey f8 up;input /pet "Heavenly Strike" <t>')
    --send_command('unbind %numpad3 setkey f8 down;wait .1;setkey f8 up;input /pet "Sleepga" <t>')
    send_command('unbind %numpad3')
    send_command('unbind !%numpad.')
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
--swapspaused = false
--function pauseswaps(seconds)
--	swapspaused = true
--	coroutine.sleep(seconds)
--	swapspaused = false
--end

is_midpact = false
function check_midpact(spell,eventArgs)
    local recast = windower.ffxi.get_ability_recasts()
    d_chat('checking if mid pact prev is '..tostring(is_midpact))
    --174 BP Ward
    --173 BP Rage

    if spell.type == "BloodPactWard" and recast[174] ~= 0 then 
		d_chat('Blood Pact Ward Cancelled, it is on cooldown')
        eventArgs.handled = true
		return true
    end
    if spell.type == "BloodPactRage" and recast[173] ~= 0 then 
	d_chat('Blood Pact Rage Cancelled, it is on cooldown')
        eventArgs.handled = true
		return true
    end
--    if (spell.type == "BloodPactRage" and recast[173] == 0) or (spell.type=="BloodPactWard" and recast[174] == 0) then 
--	swapspaused = true
--	coroutine.schedule(function()
--		swapspaused = false
--	end, 3000)
--    end
    if pet_midaction() then
		d_chat('Avatar Midaction, cancelling')
        eventArgs.handled = true
		return true
    end
    return false
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	d_chat("Job Precast")
--    if state.damagetaken.value ~= "None" then 
--	    tempset = {}
--	    pr (eventArgs)
--	    pr(action)
--    end
--
    --if swapspaused then eventArgs.handled = true end
    beforemp = player.mp
    is_midpact = check_midpact(spell,eventArgs)
--    if is_midpact then 
--	    d_chat('job_precast return due to midpact')
--	    return 
--    end
    if buffactive['Astral Conduit'] and conduit_lock then
        eventArgs.handled = true
    end
    if buffactive['Apogee'] and conduit_lock then
        eventArgs.handled = true
    end
    if state.damagetaken.value ~= "None" then 
	    state.CastingMode:set('PDT')
	    --eventArgs.handled = true
    elseif state.CastingMode.value == 'PDT' then 
	    state.CastingMode:reset()
    end
end
 
function job_midcast(spell, action, spellMap, eventArgs)
    --if swapspaused then eventArgs.handled = true end
    is_midpact = check_midpact(spell,eventArgs)
	if spellMap == nil and spell.skill=="Enhancing Magic" then
		spellMap="Enhancing Magic"
	end
    --print ('check '..check)
--    if is_midpact then 
--	    d_chat('job_midcast return due to midpact')
--	    return 
--    end
    --print (spell.english)
    --print(spell.type)
    --if state.Buff['Astral Conduit'] and pet_midaction() then
    --    eventArgs.handled = true
    --end
--    elseif spell.type=='SummonerPact' then
--	equip(sets.midcast.interruption)
--        eventArgs.handled = true
--    end
end
function job_post_midcast(spell, action, spellMap, eventArgs)
end
function job_pet_midcast(spell,action,spellMap,eventArgs)
    d_chat('Pet Midcast')
end
sets.cait = {
	hands="Lamassu Mitts +1"
}
function job_post_pet_midcast(spell,action,spellMap,eventArgs)--override equip sets for bloodpacts without lots of messy sets
	d_chat('Pet Post Midcast')
	if pet.name=='Cait Sith' then
		--equip({ hands="Lamassu Mitts +1", })
	elseif pet.name=='Carbuncle' then
		--equip({ hands="Asteria Mitts +1", })
	end
--	if state.bpmagicacc.current=='on' and (spellMap == 'TPMagicalBloodPactRage' or spellMap == 'MagicalBloodPactRage' or spellMap == 'IfritMagicalBloodPactRage') then
--		spellMap = spellMap .. ".Acc"
--	--if state.bpmagicacc.current=='on' then
--		equip(sets.bp_magic_acc)
--	end
--	if state.bpmagicacc.current=='on' and (spellMap == 'PhysicalBloodPactRage') then
--		equip(sets.bp_phys_acc)
--	end
--	if state.bpmagicacc.current=='on' and (spellMap == 'HybridBloodPactRage') then
--		equip(sets.bp_hybrid_acc)
--	end
	if state.burstmode.value=='Burst' and enticersRagePacts:contains(spell.english) and spell.english~="Impact" then
		equip(sets.burstmode.Burst)
	end
end
function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.type=="BloodPactRage" or spell.type=="BloodPactWard" then
		eventArgs.handled=true
	end
--	if pet_midaction() then
--		eventArgs.handled=true
--	end
	--if swapspaused then eventArgs.handled = true end
	is_midpact = check_midpact(spell,eventArgs,false)
	d_chat('Job Aftercast')
	--if is_midpact then return end

	--print('spell '..spell.type..' aftercast')
	--handle_equipping_gear(player.status,pet.status)
	--    if spell.type == 'Summoning' then
	--	return 'idle.Avatar'
	--    end
end
 
-- Runs when pet completes an action.
function job_pet_aftercast(spell, action, spellMap, eventArgs)
	is_midpact = check_midpact(spell,eventArgs)
	d_chat('Job Pet Aftercast')
	d_chat('player status is'..player.status)
	handle_equipping_gear(player.status,pet.status)
	--if is_midpact then return end
--	if is_midpact then 
--		d_chat('job_pet_aftercast returned due to midpact')
--		return
--	end

	--d_chat('check is '..tostring(is_midpact))
	--add_to_chat(122,'Player Status is '..player.status)
	--    if not spell.interrupted and spell.type == 'BloodPactWard' and spellMap ~= 'DebuffBloodPactWard' then
	--        wards.flag = true
	--        wards.spell = spell.english
	--        send_command('wait 4; gs c reset_ward_flag')
	--    end
	--    if player.status == 'Engaged' then
	--	equip(sets.engaged)
	--    end
--	aftermp = player.mp
--	diffmp = beforemp - aftermp
--	savemp = 100*diffmp/248
--	savemp = tonumber(string.format("%.3f", savemp))
	--if(spell.en == "Hastega II" and diffmp < 248) then add_to_chat (122,'Blood Boon! Cost was about '..savemp..'% ['..diffmp..'] before:'..beforemp..' after:'..aftermp) end
	--handle_equipping_gear(player.status,pet.status)
	--print ('pet aftercast '..pet.status..' action '..action)
	--    if pet.isvalid and pet.status == 'Engaged'  then
	--	    print('pet aftercast')
	--	    equip(sets.Avatar.Haste)
	--	    return 'Avatar.Haste'
	--    end
	--    if pet.isvalid and not midaction() and not pet_midaction() then
	--	    if player.status == "Idle" then
	--		    --equip(sets.idle.Avatar)
	--		    return 'idle.Avatar'
	--	    end
	--    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    elseif storms:contains(buff) then
        handle_equipping_gear(player.status)
    end
    if gain and buff=="quickening" then
        handle_equipping_gear(player.status)
    end
    if pet.isvalid and buff == 'sleep' then
	    if gain then
		    equip(sets.wakeup)
	    end
    end
end
 
 
-- Called when the player's pet's status changes.
-- This is also called after pet_change after a pet is released.  Check for pet validity.
function job_pet_status_change(newStatus, oldStatus, eventArgs)
--   local check = check_midpact(spell,eventArgs)
    --d_chat('Pet Status Change new '..newStatus..' old '..oldStatus..' player'..player.status..' midaction '..tostring(pet_midaction())..' is_midpact '..tostring(is_midpact))
    d_chat('Pet Status Change new '..newStatus..' old '..oldStatus..' player'..player.status..' midaction '..tostring(pet_midaction()))
    if pet_midaction() then 
	    --d_chat('check is '..tostring(is_midpact))
	    d_chat('Pet Status Change cancelled')
	    eventArgs.handled=true
	    return 
	    --coroutine.sleep(1)
    end
    handle_equipping_gear(player.status,newStatus)

end
 
function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end
-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
	trackavatar = pet.name
	smn_property.pacts = {['Rage']="",['Ward']=""} 
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
	updatedisplay()
    else
	smn_property.avatar = "\\cs(255,0,0)None\\cr"
	smn_property.pacts = {['Rage']="",['Ward']=""} 
	updatedisplay()
    end
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    if pet_midaction() then
		eventArgs.handled = true
		send_command('wait 1;gs c updategear')
	end
end

 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping.
function job_get_spell_map(spell)
	--print(pet.tp)
	--print(pet_tp)
	spellMapMod = ""
	if state.bpmagicacc.current=='on' then
		spellMapMod = "Acc"
	end
	if spell.type == 'BloodPactRage' then
		if spell.english == "Impact" and state.impactmode.value==true then
			return 'DebuffBloodPactWard'
		elseif spell.english == "Tail Whip" then
			return 'DebuffBloodPactWard'
		elseif (meritPacts:contains(spell.english) and pet_tp < 749) then
			return 'TPMagicalBloodPactRage'..spellMapMod
		elseif (enticersRagePacts:contains(spell.english) and pet_tp < 2350) then
			--elseif enticersRagePacts:contains(spell.english) and spell.english ~= 'Impact' then
			return 'TPMagicalBloodPactRage'..spellMapMod
			--return 'MagicalBloodPactRage'
		elseif (physicalEnticersRagePacts:contains(spell.english) and pet_tp < 2350) then
			return 'TPPhysicalBloodPactRage'..spellMapMod
		elseif hybridPacts:contains(spell.english) then
			return 'HybridBloodPactRage'..spellMapMod
		elseif magicalRagePacts:contains(spell.english) and pet.name=="Ifrit" then
			return 'IfritMagicalBloodPactRage'..spellMapMod
		elseif magicalRagePacts:contains(spell.english) then
			return 'MagicalBloodPactRage'..spellMapMod
		else
			return 'PhysicalBloodPactRage'..spellMapMod
		end
	elseif spell.type=='BloodPactWard' and healingWardPacts:contains(spell.english) then
		return 'HealingWard'
	elseif spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
		return 'DebuffBloodPactWard'
    elseif spell.type=='BloodPactWard' and enticersWardPacts:contains(spell.english) then
	    return 'TPBloodPactWard'
    end
	if spell.skill=="Enhancing Magic" then
		return 'Enhancing Magic'
	end
    if spell.english:contains('Refresh') and spell.target.name == player.name then
		return 'RefreshSelf'
	end
    if spell.english:startswith('Cure') and spell.target.name == player.name and buffactive['Aurorastorm'] then
		return 'CureSelfAurora'
    end
    if spell.english:startswith('Cure') and spell.target.name == player.name then
		return 'CureSelf'
    end
    if buffactive['Aurorastorm'] then
		return 'CureAurora'
    end
    if spell.english:contains('Cursna') and spell.target.name == player.name then
		return 'CursnaSelf'
    end
    --log_data_structure(buffactive)
end
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	--print('customize idle set')
	if pet.isvalid and not areas.Cities:contains(world.area) then
		if pet.element == world.day_element then
			idleSet = set_combine(idleSet, sets.perp.Day)
		end
		if pet.element == world.weather_element then
			idleSet = set_combine(idleSet, sets.perp.Weather)
		end
		if sets.perp[pet.name] then
			idleSet = set_combine(idleSet, sets.perp[pet.name])
		end
--		gear.perp_staff.name = elements.perpetuance_staff_of[pet.element]
--		if gear.perp_staff.name and (player.inventory[gear.perp_staff.name] or player.wardrobe[gear.perp_staff.name]) then
--			idleSet = set_combine(idleSet, sets.perp.staff_and_grip)
--		end
		if state.Buff["Avatar's Favor"] and avatars:contains(pet.name) then
			--idleSet = set_combine(idleSet, sets.idle.Avatar.Favor)
			idleSet = set_combine(idleSet,sets.favor[state.favor.value])
		end
		if pet.status == 'Engaged' then
			idleSet = set_combine(idleSet, sets.Avatar.Haste)
		end
	end
--	if player.max_mp - player.mp < 100 and usemephitas then
--		if pet.isvalid then idleSet = set_combine(idleSet, {right_ring="Mephitas's Ring +1" })
--		else idleSet = set_combine(idleSet, {right_ring="Mephitas's Ring +1"})
--		end
--	end
	if pet.name=='Cait Sith' then
		--idleSet = set_combine(idleSet, {hands="Lamassu Mitts +1"})
	end

	if player.mpp < 51 then -- this won't work because gear isn't considered only base
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end
    
	if state.damagetaken.value ~= "None" then idleSet = set_combine(idleSet,sets.damagetaken[state.damagetaken.value]) end
	if state.petdamagetaken.value ~= "None" then idleSet = set_combine(idleSet,sets.petdamagetaken[state.petdamagetaken.value]) end

	if areas.Cities:contains(world.area) and world.area:contains("Adoulin") then
		idleSet = set_combine(idleSet, sets.adoulinmovement)
		--windower.send_command('input /ja Release <me>;wait 2;input /ma '..tosummon..' <me>')
	elseif buffactive["Quickening"] or buffactive["Fleet Wind"] or areas.Cities:contains(world.area) then
		if pet.isvalid and not  areas.Cities:contains(world.area) then
			idleSet = set_combine(idleSet, sets.movement)
		else
			idleSet = set_combine(idleSet, sets.movementtown)
		end
	elseif state.movement.current == 'on' then 
		idleSet = set_combine(idleSet, sets.movement)
	end
	if  world.area:contains("Mog Garden") then
		idleSet = set_combine(idleSet, sets.farmer)
	end

	
	if state.cpmode.current == 'on' then idleSet = set_combine(idleSet,sets.cpmode) end
	if state.tplock.current == 'on' then 
		idleSet = set_combine(idleSet,sets.tplock) 
		equip(idleSet)
		disable('main','sub')
	elseif state.kclub.current == 'on' then 
		idleSet = set_combine(idleSet,sets.kclub) 
		equip(idleSet)
		disable('main','sub')
	elseif state.pullmode.current == 'on' then 
		--disable('main','sub')
	else
		enable('main','sub')
	end
	if state.pullmode.current == 'on' then idleSet = set_combine(idleSet,sets.pullmode) end
	if state.idlehealer.current == 'on' then idleSet = set_combine(idleSet,sets.idlehealer) end
	if state.magiceva.current == 'on' then idleSet = set_combine(idleSet,sets.magiceva) end
	
	if inwkr == 1 then 
		idleSet = set_combine(idleSet, sets.inwkr)
	end
	equip(idleSet)

	return idleSet
end

function customize_melee_set(meleeSet)
    if state.damagetaken.value ~= "None" then meleeSet = set_combine(meleeSet,sets.damagetaken[state.damagetaken.value]) end
    if state.petdamagetaken.value ~= "None" then meleeSet = set_combine(meleeSet,sets.petdamagetaken[state.petdamagetaken.value]) end
    if state.cpmode.current == 'on' then meleeSet = set_combine(meleeSet,sets.cpmode) end
    if state.tplock.current == 'on' then 
	    meleeSet = set_combine(meleeSet,sets.tplock) 
	    equip(meleeSet)
	    disable('main','sub')
    elseif state.kclub.current == 'on' then 
	    meleeSet = set_combine(meleeSet,sets.kclub) 
	    equip(meleeSet)
	    disable('main','sub')
    elseif state.pullmode.current == 'on' then 
	    --disable('main','sub')
    else
	    enable('main','sub')
    end
    if state.OffenseMode.value == 'Perp' then
	    if pet.status == 'Engaged' then
		    meleeSet = set_combine(meleeSet, sets.Avatar.Haste)
	    end
    end
    if state.pullmode.current == 'on' then meleeSet = set_combine(meleeSet,sets.pullmode) end
    if state.idlehealer.current == 'on' then idleSet = set_combine(idleSet,sets.idlehealer) end
    if state.magiceva.current == 'on' then meleeSet = set_combine(meleeSet,sets.magiceva) end
    if inwkr == 1 then 
	    meleeSet = set_combine(meleeSet, sets.inwkr)
    end
    return meleeSet
    --if state.dtmode.current == 'on' then meleeSet = set_combine(meleeSet,sets.dtmode) end
end
function customize_resting_set(restingSet)
    if state.damagetaken.value ~= "None" then restingSet = set_combine(meleeSet,sets.damagetaken[state.damagetaken.value]) end
	
    if state.cpmode.current == 'on' then restingSet = set_combine(restingSet,sets.cpmode) end
    return restingSet
end

 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end
end
 
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
 
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------
 
modepage = 0
movement=0
buffrotkey=0
pet_tp=0
-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)

	if cmdParams[1] == 'toggleAutoBuffMode' then
		if autoBuffMode == nil or autoBuffMode == 'Off' then
			autoBuffMode = 'On'
		else
			autoBuffMode = 'Off'
		end
		add_to_chat(122, '-- SMN autoBuffMode set to: '..autoBuffMode..' --')
	end

    if cmdParams[1] == 'toggle' or cmdParams[1] == 'cycle' then
	    send_command('wait .5;gs c force_hud_refresh')-- there is no way to hook into motes modes function when called, if I update now it is before motes does, a .5 second delay is minimal for update to hud and seems to work well.  coroutine.sleep gives a return error because we have function returns going on
    end
    if cmdParams[1] == 'printtp' then
	    print(pet_tp)
    end
    if cmdParams[1]:lower() == 'petweather' then
        handle_petweather()
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'test' then
	pr(buffactive['Apogee']) 
    elseif cmdParams[1]:lower() == 'siphon' then
        handle_siphoning()
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'pact' then
        handle_pacts(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1] == 'reset_ward_flag' then
        wards.flag = false
        wards.spell = ''
        eventArgs.handled = true
    elseif cmdParams[1] == 'smn' then
	tosummon = cmdParams[2]
	smntarget = "<me>"
	if tosummon=='atomos' then smntarget="<t>" end
	if tosummon == 'caitsith' then tosummon='cait sith' end
	if tosummon == 'lightspirit' then tosummon='light spirit' end
        if pet.isvalid and pet.name:lower()==tosummon then
		add_to_chat(122,cmdParams[2].." is already summoned!")
        elseif pet.isvalid then
		windower.send_command('input /ja Release <me>;wait 2;input /ma '..tosummon..' '..smntarget)
        else  
		windower.send_command('input /ma '..tosummon..' '..smntarget)
	end
        eventArgs.handled = true
    elseif cmdParams[1] == 'fleet_wind' then
		if pet.isvalid and pet.name:lower()=='garuda' then
			send_command('input /ma Fleet Wind <me>')
		elseif pet.isvalid then
			send_command('input /ja Release <me>;wait 1;input /ma Garuda <me>;wait 5;input /ma Fleet Wind <me>;wait 2')
		else
			send_command('input /ma Garuda <me>;wait 5;input /ma Fleet Wind <me>')
		end
    elseif cmdParams[1] == 'supportmode' then
	    send_command('input /ja "Light Arts";wait 1;input /ja "Sublimation";wait 1;input /ja "Addendum: White";wait 1;input /ma "Aurorastorm" <me>')
    elseif cmdParams[1] == 'nukemode' then
	    send_command('input /ja "Dark Arts";wait 1;input /ja "Sublimation";wait 1;input /ja "Addendum: Black";wait 1;input /ma "Firestorm" <me>')

    elseif cmdParams[1] == 'release' then
        set_macro_page(1,2)
	send_command('input /pet "Release" <me>')
    elseif cmdParams[1] == 'buffrotation' then
	    buffability,buffavatar = next(buffrotation[buffrotkey]) 
	    if pet.isvalid and pet.name ~= buffavatar then
		    send_command('input /ja "Release" <me>;wait 1;input /ma "'..buffavatar..'" <me>;wait 5;input /ja "'..buffability..'"')
	    elseif not pet.isvalid then
		    send_command('input /ma "'..buffavatar..'" <me>;wait 5;input /ja "'..buffability..'"')
	    else
		    send_command('input /ja "'..buffability..'"')
	    end
	    buffrotkey = buffrotkey + 1
	    if buffrotkey >= buffrot_count then buffrotkey=0 end
    elseif cmdParams[1] == 'warpring' then
	    equip({left_ring="Warp Ring"})
	    send_command('gs disable left_ring;wait 10;input /item "Warp Ring" <me>;wait 1;input /item "Warp Ring" <me>;wait 1;input /item "Warp Ring" <me>;wait 10;gs enable left_ring')
    elseif cmdParams[1] == 'toggle_hud' then
	    if display_hud==true then 
		    display_hud = false
		    window:hide()
			if use_icon then
				images.hide(avatar_icon)
			end
	    else 
		    display_hud=true
		    window:show()
			if use_icon then
				images.show(avatar_icon)
			end
	    end
    elseif cmdParams[1] == 'toggle_states' then
	    if display_states==true then 
		    display_states = false
	    else 
		    display_states=true
	    end
	    updatedisplay()
    elseif cmdParams[1] == 'force_hud_refresh' then
	    updatedisplay()
    elseif cmdParams[1] == 'toggle' and cmdParams[2]=='cpmode' then
	--logic is reversed b/c it's true/false and lags behind motes toggle since this is called first
	if state.cpmode.current ~= 'on' then 
		equip(sets.cpmode) 
		send_command('gs disable back')
	else
		send_command('gs enable back')
	end
    elseif cmdParams[1] == "switch_dualbox_binds" then -- disables stp_m1 to stp_m10 for dual box commands, or enables them
	    if use_dualbox then
		    if cureIV then
			    send_command('alias stp_m1 input /ma "Cure IV" <p0>')
			    send_command('alias stp_m2 input /ma "Cure IV" <p1>')
			    send_command('alias stp_m3 input /ma "Cure IV" <p2>')
			    send_command('alias stp_m4 input /ma "Cure IV" <p3>')
			    send_command('alias stp_m5 input /ma "Cure IV" <p4>')
			    send_command('alias stp_m6 input /ma "Cure IV" <p5>')
			    send_command('alias stp_m7 input /ma "Cure IV"')
		    else
			    send_command('alias stp_m1 input /ma "Cure III" <p0>')
			    send_command('alias stp_m2 input /ma "Cure III" <p1>')
			    send_command('alias stp_m3 input /ma "Cure III" <p2>')
			    send_command('alias stp_m4 input /ma "Cure III" <p3>')
			    send_command('alias stp_m5 input /ma "Cure III" <p4>')
			    send_command('alias stp_m6 input /ma "Cure III" <p5>')
			    send_command('alias stp_m7 input /ma "Cure III"')
		    end
		    send_command('alias stp_m8 gs c nukemode')
		    send_command('alias stp_m9 gs c supportmode')
		    use_dualbox=false
	    else
		    send_command('alias stp_m1 nil')
		    send_command('alias stp_m2 nil')
		    send_command('alias stp_m3 nil')
		    send_command('alias stp_m4 nil')
		    send_command('alias stp_m5 nil')
		    send_command('alias stp_m6 nil')
		    send_command('alias stp_m7 nil')
		    send_command('alias stp_m8 nil')
		    send_command('alias stp_m9 nil')
		    --send_command('alias stp_m10 nil')
		    use_dualbox=true
	    end
    elseif cmdParams[1] == 'pet_tp' then
	    --print('pet tp is now '..tostring(pet_tp))
	    pet_tp = tonumber(cmdParams[2])
    elseif cmdParams[1] == 'conduit_lock' then
	    if conduit_lock then
		    conduit_lock = false
		    add_to_chat(122,"conduit lock off")
	    else
		    conduit_lock = true
		    add_to_chat(122,"conduit lock on")
	    end
    elseif cmdParams[1] == 'updategear' then
		handle_equipping_gear(player.status)

	end
	command = cmdParams[1]
	command2 = cmdParams[2]
	command3 = cmdParams[3]
	command4 = cmdParams[4]

	if custom_includes then
		include('custom_commands.lua')
	end

end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Cast the appopriate storm for the currently summoned avatar, if possible.
function handle_petweather()
    if player.sub_job ~= 'SCH' then
        add_to_chat(122, "You can not cast storm spells")
        return
    end
       
    if not pet.isvalid then
        add_to_chat(122, "You do not have an active avatar.")
        return
    end
   
    local element = pet.element
    if element == 'Thunder' then
        element = 'Lightning'
    end
   
--    if S{'Light','Dark','Lightning'}:contains(element) then
--        add_to_chat(122, 'You do not have access to '..elements.storm_of[element]..'.')
--        return
--    end
   
    local storm = elements.storm_of[element]
   
    if storm then
        send_command('@input /ma "'..elements.storm_of[element]..'" <me>')
    else
        add_to_chat(123, 'Error: Unknown element ('..tostring(element)..')')
    end
end
 
 
-- Custom uber-handling of Elemental Siphon
function handle_siphoning()
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'Cannot use Elemental Siphon in a city area.')
        return
    end
 
    local siphonElement
    local stormElementToUse
    local releasedAvatar
    local dontRelease
   
    -- If we already have a spirit out, just use that.
    if pet.isvalid and spirits:contains(pet.name) then
        siphonElement = pet.element
        dontRelease = true
        -- If current weather doesn't match the spirit, but the spirit matches the day, try to cast the storm.
        if player.sub_job == 'SCH' and pet.element == world.day_element and pet.element ~= world.weather_element then
--            if not S{'Light','Dark','Lightning'}:contains(pet.element) then
--                stormElementToUse = pet.element
--            end
	    stormElementToUse = pet.element
        end
    -- If we're subbing /sch, there are some conditions where we want to make sure specific weather is up.
    -- If current (single) weather is opposed by the current day, we want to change the weather to match
    -- the current day, if possible.
    elseif player.sub_job == 'SCH' and world.weather_element ~= 'None' then
        -- We can override single-intensity weather; leave double weather alone, since even if
        -- it's partially countered by the day, it's not worth changing.
        if get_weather_intensity() == 1 then
            -- If current weather is weak to the current day, it cancels the benefits for
            -- siphon.  Change it to the day's weather if possible (+0 to +20%), or any non-weak
            -- weather if not.
            -- If the current weather matches the current avatar's element (being used to reduce
            -- perpetuation), don't change it; just accept the penalty on Siphon.
            if world.weather_element == elements.weak_to[world.day_element] and
                (not pet.isvalid or world.weather_element ~= pet.element) then
                -- We can't cast lightning/dark/light weather, so use a neutral element
--                if S{'Light','Dark','Lightning'}:contains(world.day_element) then
--                    stormElementToUse = 'Wind'
--                else
--                    stormElementToUse = world.day_element
--                end
				stormElementToUse = world.day_element
            end
        end
    end
   
    -- If we decided to use a storm, set that as the spirit element to cast.
    if stormElementToUse then
        siphonElement = stormElementToUse
    elseif world.weather_element ~= 'None' and (get_weather_intensity() == 2 or world.weather_element ~= elements.weak_to[world.day_element]) then
        siphonElement = world.weather_element
    else
        siphonElement = world.day_element
    end

    local command = ''
    local releaseWait = 0
    local elementused = ''
   
    if pet.isvalid and avatars:contains(pet.name) then
        command = command..'input /pet "Release" <me>;wait 1.1;'
        releasedAvatar = pet.name
        releaseWait = 10
    end
   
    if stormElementToUse then
        command = command..'input /ma "'..elements.storm_of[stormElementToUse]..'" <me>;wait 5;'
        releaseWait = releaseWait - 4
	elementused = stormElementToUse
    end
   
    if not (pet.isvalid and spirits:contains(pet.name)) then
        command = command..'input /ma "'..elements.spirit_of[siphonElement]..'" <me>;wait 5;'
        releaseWait = releaseWait - 4
	elementused = siphonElement
    end
	if world.day_element ~= "Light" and world.day_element ~= "Dark" then
		sets.precast.JA['Elemental Siphon'] = set_combine(sets.precast.JA['Elemental Siphon'],sets.SiphonZodiac)
	else
		sets.precast.JA['Elemental Siphon'] = set_combine(sets.precast.JA['Elemental Siphon'],sets.SiphonLightDarkDay)
	end
   
    command = command..'input /ja "Elemental Siphon" <me>;'
    releaseWait = releaseWait - 1
    releaseWait = releaseWait + 0.1
   
    if not dontRelease then
        if releaseWait > 0 then
            command = command..'wait '..tostring(releaseWait)..';'
        else
            command = command..'wait 1.1;'
        end
       
        command = command..'input /pet "Release" <me>;'
    end
   
    if releasedAvatar then
        command = command..'wait 1.1;input /ma "'..releasedAvatar..'" <me>'
    end
   
    send_command(command)
end
 
 
-- Handles executing blood pacts in a generic, avatar-agnostic way.
-- cmdParams is the split of the self-command.
-- gs c [pact] [pacttype]
function handle_pacts(cmdParams)
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'You cannot use pacts in town.')
        return
    end
 
    if not pet.isvalid then
        --add_to_chat(122,'No avatar currently available. Returning to default macro set.')
        return
    end
 
    if spirits:contains(pet.name) then
        add_to_chat(122,'Cannot use pacts with spirits.')
        return
    end
 
    if not cmdParams[2] then
        add_to_chat(123,'No pact type given.')
        return
    end
   
    local pact = cmdParams[2]:lower()
   
    if not pacts[pact] then
        add_to_chat(123,'Unknown pact type: '..tostring(pact))
        return
    end
   
    if pacts[pact][pet.name] then
        if pact == 'astralflow' and not buffactive['astral flow'] then
            add_to_chat(122,'Cannot use Astral Flow pacts at this time.')
            return
        end
       
		if pacts[pact][pet.name]=="Shock Squall" then
			send_command('wait  13.5;input /echo Shock Squall Max Duration Stun Wearing')
		end
		if pacts[pact][pet.name]=="Volt Strike" then
			send_command('wait  13.5;input /echo Volt Strike Max Duration Stun Wearing')
		end
        -- Leave out target; let Shortcuts auto-determine it.
        send_command('@input /pet "'..pacts[pact][pet.name]..'"')
    else
        add_to_chat(122,pet.name..' does not have a pact of type ['..pact..'].')
    end
end
 
function select_default_macro_book(reset)
    -- Default macro set/book
    set_macro_page(1, 2)
end
if load_debugging then
	function log_data_structure(data_object)
		str = inspect(data_object)
		local ouf = assert(io.open(debug_log, "a"))
		if ouf then
			ouf:write(tostring(str))
			ouf:write("\n")
			io.close(ouf)
			--print('wrote to file')
		else
			--print('could not open file to write')
		end
	end
	inspect = require 'inspect'
end

--windower.send_command('lua l pet_tp')
pet_tp = 0
--Fix missing Pet.TP field by getting the packets from the fields lib
packets = require('packets')
function update_pet_tp(id,data) 
	if id == 0x068 then
		pet_tp = 0
		local update = packets.parse('incoming', data)
		pet_tp = update["Pet TP"]
		windower.send_command('lua c gearswap c pet_tp '..pet_tp)
	end
end
id = windower.raw_register_event('incoming chunk', update_pet_tp)

-------------------------------------------------------------------------------------------------------------------
-- THE LOOOOOOOOOOOP
-------------------------------------------------------------------------------------------------------------------
-- initial vars for autoCast looping
actionInProgress = false
time_start = os.time()
-- initial vars for movement detection / movespeed swap
mov = {counter=0}
moving = false
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

windower.raw_register_event('prerender',function()
    -- determine if we're moving or not, handle movespeed gear swaps
	mov.counter = mov.counter + 1;
    if mov.counter > 2 then
        local player = windower.ffxi.get_mob_by_index(player.index)
        if player and player.x and mov.x then
            local movement = math.sqrt( (player.x-mov.x)^2 + (player.y-mov.y)^2 + (player.z-mov.z)^2 ) > 0.1
            if movement and not moving then
				moving = true
                windower.send_command('input //gs equip sets.moveSpeed')
            elseif not movement and moving then
				moving = false
                if player.status == engaged then
                    windower.send_command('input //gs equip sets.engaged')
                else
                    windower.send_command('input //gs equip sets.idle')
                end
            end
        end
        if player and player.x then
            mov.x = player.x
            mov.y = player.y
            mov.z = player.z
        end
        mov.counter = 0
	end

	-- everytime os.time updates (once a second) call autoActions() if it exists and handle actionDelay counter
	if os.time() > time_start then
		time_start = os.time()		
		if autoActions ~= nil then
			autoActions()
		end

		-- Compensate for cast animations lasting longer than 'actual' spellcast
		if actionDelay then
			actionDelay = actionDelay + 1
			if actionDelay > 3 then
				actionInProgress = false
				actionDelay = nil
			end
		end
	end
end)

function buffIdActive(buffId)
	local currentBuffs = windower.ffxi.get_player().buffs
	for _, v in pairs(currentBuffs) do
		if v == buffId then
			return true
		end
	end
	return false
end