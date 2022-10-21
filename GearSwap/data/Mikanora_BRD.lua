include('RST\\sharedFunctions.lua')
res = require 'resources'
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
	--gear.meleeTPCape = {name="Intarabus's Cape", augments={'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10',}}
	gear.magicAccCape = {name="Intarabus's Cape", augments={'CHR+20',}}
    gear.savageCape = {name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    -- Base sets (these are 'complete' sets - all others are partial or inherit from others)
    sets.baseTp = {
        --ranged="Linos",
        head="Ayanmo Zucchetto +2",
        body="Ayanmo Corazza",
        hands="Ayanmo Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Bard's Charm +2",
        waist="Grunfeld Rope",
        ear1="Telos Earring",
        ear2="Eabani Earring",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        --back="",
    }

    sets.baseDt = {
    }

    sets.baseWS = {
        --ranged="Linos",
        head="Nyame Helm",
        body="Bihu Jstcorps. +3",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Telos Earring",
        ear2="Mache Earring",
        ring1="Karieyh Ring",
        ring2="Ramuh Ring",
        --back="",
    }

    sets.baseIdle = {
        --neck = "",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
    }

    sets.precast.FC = {
        body="Inyanga Jubbah +2",
        ear1="Loquac. Earring",
        ear2="Etiolation Earring",
        ring1="Prolix Ring",
        ring2="Kishar Ring",
        waist="Witful Belt",
        back="Swith Cape"
    }

    -- One-off and small sets
    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.moveSpeed = {feet="Fili Cothurnes +2"}
    sets.TH = {waist="Chaac Belt", head="Wh. Rarab Cap +1", "Per. Lucky Egg"}
    sets.windSkill = {head="Bihu Roundlet +3", body="Fili Hongreline +2", hands="Fili Manchettes +2", legs="Brioso Cann. +1", ear2="Fili Earring"}
    sets.stringSkill = { head="Brioso Roundlet +1", body="Brioso Justaucorps +1", hands="Fili Manchettes +2", legs="Fili Rhingrave +2", ear2="Fili Earring"}
    sets.emSkill = {hands="Chironic Gloves", ring1="Stikini Ring +1", ring2="Stikini Ring +1"}
    sets.emDuration = {}
    sets.interrupt = {waist="Rumination Sash", hands="Chironic Gloves",}
    sets.magicAcc = {ring1 = "Stikini Ring +1", ring2 = "Stikini Ring +1", back=gear.magicAccCape}
    sets.curePotency = {hands="Chironic Gloves", legs="Chironic Hose", neck="Phalaina Locket", ear1="Mendi. Earring", ear2="Roundel Earring"}

    -- AutoTriggered Sets (actually makes gear change when actions are performed) --
    -- JA Sets
    sets.precast.JA['Nightingale'] = {feet="Bihu Slippers +3"}
    sets.precast.JA['Troubadour'] = {body="Bihu Jstcorps. +3"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}
    sets.precast.JA['Waltz'] = {legs="Dashing Subligar", ring1="Valseur's Ring"}

    -- WS Sets
    sets.precast.WS = sets.baseWS
    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS, {})
    sets.precast.WS['Exenterator'] = set_combine(sets.baseWS, {})
    sets.precast.WS['Mordant Rime'] = set_combine(sets.baseWS, {})
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.baseWS, {})
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.baseWS, {})
    sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {})

    -- Magic Sets
    sets.precast.FC['Cure'] = set_combine(sets.precast.FC, {feet="Vanya Clogs", body="Chironic Doublet"})
    sets.precast.FC['BardSong'] = set_combine(sets.precast.FC, {head="Fili Calot +2"})
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.midcast['Utsusemi'] = sets.interrupt
    sets.midcast['Enhancing Magic'] = set_combine(sets.interrupt, sets.emSkill, sets.emDuration)
    sets.midcast['Cure'] = set_combine(sets.interrupt, sets.curePotency)
    sets.midcast['Cursna'] = set_combine(sets.interrupt, {hands="Hieros Mittens", neck="Debilis Medallion", ear1="Beatific Earring", back="Oretan. Cape +1", ring1="Ephedra Ring"})
    sets.midcast['Enhancing Magic'] = {}
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {head="Inyanga Tiara +2"})
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
    
    sets.songDuration  = {legs="Inyanga Shalwar +2", body="Fili Hongreline +2", feet="Brioso Slippers +1", neck="Moonbow Whistle +1", back=gear.magicAccCape}
    sets.midcast['Ballad'] = set_combine(sets.songDuration, {legs="Fili Rhingrave +2"})
    sets.midcast['Minuet'] = set_combine(sets.songDuration, {body="Fili Hongreline +2"})
    sets.midcast['March'] = set_combine(sets.songDuration, {hands="Fili Manchettes +2"})
    sets.midcast['Madrigal'] = set_combine(sets.songDuration, {head="Fili Calot +2"})
    sets.midcast['Paeon'] = set_combine(sets.songDuration, {head="Brioso Roundlet +3"})
    sets.midcast["Adventurer's Dirge"] = set_combine(sets.songDuration, {hands="Bihu Cuffs +3"})
    sets.midcast['Foe Sirvente'] = set_combine(sets.songDuration, {head="Bihu Roundlet +3"})
    sets.midcast['Magic Finale'] = set_combine(sets.songDuration, {legs="Fili Rhingrave +2"})
    sets.midcast["Sentinel's Scherzo"] = set_combine(sets.songDuration, {feet="Fili Cothurnes +2"})
    sets.midcast['Lullaby'] = set_combine(sets.songDuration, sets.magicAcc, sets.bardSkill, {hands="Brioso Cuffs +1"})
    
    -- Don't have this gear (yet?) --
    --sets.midcast['Etude'] = {head="Mousai Turban +1"}
    --sets.midcast['Threnody'] = {body="Mou. Manteel +1"}
    --sets.midcast['Minne'] = {legs="Mou. Seraweels +1"}
    --sets.midcast['Carol'] = {hands="Mousai Gages +1"}
    --sets.midcast['HonorMarch'] = {range="Marsyas", hands="Fili Manchettes +2"}
    --sets.midcast.Mambo = {feet="Mou. Crackows +1"}
end

-------------------------------------------------------------------------------------------------------------------
-- Setup mode tables
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=set_combine(sets.baseTp, sets.baseIdle, sets.songDuration), set_combine(sets.baseTp, sets.songDuration)},
        [1] = {name="Tank", idle=set_combine(sets.baseDt, sets.baseIdle), engaged=sets.baseDt},
	}

    weaponMode = {
		["index"] = 0,
		[0] = {name="Carn", set={main="Carnwenhan", sub="Gleti's Knife"}},
        [1] = {name="Naegling", set={main="Naegling", sub="Gleti's Knife"}},
	}

	auto = {
		["buff"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
		["fite"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "Pull",
            [2] = "Assist"
		},		
        ["sing"] = {
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
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
    bardSongs = { 
        [195]="Paeon",
        [196]="Ballad",
        [197]="Minne",
        [198]="Minuet",
        [199]="Madrigal",
        [200]="Prelude",
        [201]="Mambo",
        [202]="Aubade",
        [203]="Pastoral",
        [204]="Hum",
        [205]="Fantasia",
        [206]="Operetta",
        [207]="Capriccio",
        [208]="Serenade",
        [209]="Round",
        [210]="Gavotte",
        [211]="Fugue",
        [212]="Rhapsody",
        [213]="Aria",
        [214]="March",
        [215]="Etude",
        [216]="Carol",
        [217]="Threnody",
        [218]="Hymnus",
        [219]="Mazurka",
        [220]="Sirvente",
        [221]="Dirge",
        [222]="Scherzo",
    }

    autoSongs = {
        ['Valor Minuet V'] = {name="Valor Minuet V", expireTime=0, active=false},
        ['Blade Madrigal'] = {name="Blade Madrigal", expireTime=0, active=false},
        ['Victory March'] = {name="Victory March", expireTime=0, active=false},
        ['Valor Minuet IV'] = {name="Valor Minuet IV", expireTime=0, active=false},
        ['Valor Minuet III'] = {name="Valor Minuet IV", expireTime=0, active=false},
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
    send_command('bind ^F11 gs c cycleSing')
	set_macro_page(1, 2)
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast Phase Extensions
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)	
    if spell.type == 'BardSong' then
        local maxSongs = tablelength(autoSongs) - 1
        local currCount = countSongs()
        if buffactive['Clarion Call'] then
            maxSongs = maxSongs + 1
        end

        if currCount >= maxSongs then
            add_to_chat(015, '- Equipping Gjallarhorn -')
            equip({ranged="Gjallarhorn"})
            return
        end

        add_to_chat(015, '- Equipping Daurdabla -')
        equip({ranged="Daurdabla"})
    end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)	

end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)	

end

-------------------------------------------------------------------------------------------------------------------
-- Job specific functions and function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	--[[ Cycle Auto Sing ]]--
    if cmdParams[1] == 'cycleSing' then
        auto.sing.index = auto.sing.index + 1
        if auto.sing.index > #auto.sing then
            auto.sing.index = 0
        end
        windower.add_to_chat(013,'[Sing: '..auto.sing[auto.sing.index]..']')
    end

    modeHud('update')
end

function extendedModeHud(hudText)
    skyblue = '\\cs(135,206,250)'
    red = '\\cs(255,0,0)'
	green = '\\cs(0,255,0)'
    textColor = red
    if auto.sing[auto.sing.index] == 'On' then
        textColor = green
    end

    hudText:append(skyblue..'Sing: '..textColor..auto.sing[auto.sing.index]..white)
	return hudText
end

function countAutoSongs()
    local count = 0
    for k,v in pairs(autoSongs) do
        if v.active == true then
            count = count + 1
        end        
    end
    return count
end

function countSongs()
    local count = 0
    for k,v in pairs(windower.ffxi.get_player().buffs) do
        if v >= 195 and v <= 222 then
            count = count + 1
        end
    end
    return count
end

function resetSongTimers()
    -- Set all songs to buffer limit so they look like they need to be re-sung
    for k,v in pairs(autoSongs) do
        v.expireTime = os.time() + songBuffer
    end
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction function: called ~once per second
-------------------------------------------------------------------------------------------------------------------
songTimer = os.time()
songInProgress = false
baseSongDuration = 330
songBuffer = 60

function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()
    local curingWaltzRecast = abilRecast[186]
    local soulVoiceRecast = abilRecast[0]
    local clarionRecast = abilRecast[254]
    local nightingaleRecast = abilRecast[109]
    local troubadourRecast = abilRecast[110]
    local marcatoRecast = abilRecast[48]

    -- If we're pulling that takes priority over buffs
    if auto.fite[auto.fite.index] == 'Pull' and not player.status == engaged then
        return
    end

    if auto.sing[auto.sing.index] == 'On' and not songInProgress then
        if (countSongs() < tablelength(autoSongs) and countSongs() >= 2 and (clarionRecast == 0 and auto.fite[auto.fite.index] ~= 'Off' and not buffactive['Clarion Call'])) then
            add_to_chat(038, '! Clarion Call Needed !')
            send_command('/clarioncall')
            resetSongTimers()
            return
        elseif (countSongs() < tablelength(autoSongs)-1  and countSongs() >= 2 and (clarionRecast > 0 or auto.fite[auto.fite.index] == 'Off')) then
            -- This is (hopefully) handled by job precast
            add_to_chat(038, '! Bonus Song Needed !')
        end
        
        -- Soul Voice (only if AutoFite is on)
        if (soulVoiceRecast == 0 and auto.fite[auto.fite.index] ~= 'Off' and not buffactive['Soul Voice']) then
            send_command('/soulvoice')
            resetSongTimers()
            return
        end

        -- JAs: Nightingale/Troubadour/Marcato  
        -- Marcato (if Soul Voice is not on, combine with Nitro)
        if (not buffactive['Soul Voice'] and marcatoRecast == 0 and nightingaleRecast == 0 and troubadourRecast == 0) then
            add_to_chat(013, '~ Marcato ~')
            send_command('/marcato')
            return
        end
        -- Nitro should be saved for SV if it's going to be used soon 
        if (nightingaleRecast == 0 and troubadourRecast == 0 and (soulVoiceRecast > 300 and auto.fite[auto.fite.index] ~= 'Off') and not buffactive['Nightingale']) then
            -- TODO: Set first song's expiry to 0 so it plays next
            -- TODO: Set other songs right after so they get re-sung with nitro duration
            add_to_chat(013, '~ Nitro ~')
            send_command('/nightingale')
            return
        end
        if (buffactive['Nightingale'] and troubadourRecast == 0 and not buffactive['Troubadour']) then
            send_command('/troubadour')
            resetSongTimers()
            return
        end

        -- Sing songs that expire soon
        for name,info in pairs(autoSongs) do
            if not info.active or info.expireTime - os.time() < songBuffer then                
                add_to_chat(013, '~ Input: '..name..' (Expiry: '..(info.expireTime - os.time())..')')
                send_command('input /ma "'..name..'" <me>')
                return
            end
        end
    end

    -- Emergency mode -- maybe missed a song completion and stuck in songInProgress
    if auto.sing[auto.sing.index] == 'On' and songInProgress then       
        for name,info in pairs(autoSongs) do
            if info.expireTime - os.time() < songBuffer*0.5 then                
                add_to_chat(038, '~ Emergency Input: '..name..' (Expiry: '..(info.expireTime - os.time())..')')
                send_command('input /ma "'..name..'" <me>')
                return
            end
        end
    end

    --[[ Auto Buff includes: /DNC Haste Samba ]]--
    --[[ Haste Samba handing when auto.buff is on ]]--
	if auto.buff[auto.buff.index] == 'On' and not songInProgress then
        if player.sub_job == 'DNC' and player.tp >= 350 and not buffactive['Haste Samba'] then
            add_to_chat(122, '[Haste Samba]')
            send_command('/haste samba')
            return
        end
	end
end

windower.register_event('action',function(act)
    if auto.sing[auto.sing.index] == 'On' then
        if not act then return end

        local actor = windower.ffxi.get_mob_by_id(act.actor_id) or nil
        local self = windower.ffxi.get_player() or nil
        
        if actor and self and actor.id == self.id then
            local category = act.category
            local param = act.param
            local targets = act.targets
            local targetsParam = targets.param
        
            -- 08: Start spell casting    (param 24931 = initiation, 28787 = failure)
            if category == 8 then
                local spellName = res.spells[act.targets[1].actions[1].param].en or nil
                if param == 24931 then
                    songInProgress = true
                    add_to_chat(013, '~ Singing Song ('..spellName..') ~')
                end
                if param == 28787 then
                    songInProgress = false
                    add_to_chat(011, '~ Song Interrupted! ('..spellName..') ~')
                end
            end

            -- 04: Finish spell casting 
            if category == 4 then
                songInProgress = false
                local spellName = res.spells[param].en
                if autoSongs[spellName] ~= nil then
                    -- Don't update expiry very far out it was Harp (want to re-sing it with Gjallarhorn in 60 sec)
                    if (player.equipment.range == "Daurdabla") then                    
                        autoSongs[res.spells[param].en].expireTime = os.time() + songBuffer*2
                        add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : expireTime Set Short ('..(songBuffer*2)..')] ~')
                        autoSongs[spellName].active = true
                    else
                        if buffactive['Troubadour'] then 
                            autoSongs[res.spells[param].en].expireTime = os.time() + baseSongDuration*2
                            add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : expireTime Updated x2 ('..(baseSongDuration*2)..')] ~')
                        else
                            autoSongs[res.spells[param].en].expireTime = os.time() + baseSongDuration
                            add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : expireTime Updated ('..baseSongDuration..')] ~')
                        end                
                        
                        autoSongs[spellName].active = true
                    end            
                else
                    add_to_chat(013, '~ Song Complete ['..res.spells[param].en..' : No Changes] ~')
                end

                if auto.sing[auto.sing.index] == 'On' then
                    --enable('head','body','hands','legs','feet','neck')
                end
            end
        end
    end
end)

function extendedZoneChange()
    if auto.sing.index == 1 then
        auto.sing.index = 0
    end
end