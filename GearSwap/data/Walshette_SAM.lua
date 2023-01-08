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

    --[[ Set up JSE Capes ]]--
    gear.strWSCape = {name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.dexTPCape = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
    gear.eleWSCape = {name="Smertrios's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}}

    --[[ Set up Augmented Gear ]]--
    gear.valorWSHead = { name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +5%','DEX+1',}}
    gear.valorJinpuHead = { name="Valorous Mask", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +4%','Attack+9',}}
    --hands={ name="Valorous Mitts", augments={'Attack+20','Weapon skill damage +4%','DEX+4','Accuracy+11',}}
    gear.valorWSHands = { name="Valorous Mitts", augments={'Attack+23','Weapon skill damage +4%','STR+4',}}
    gear.valorWSLegs={ name="Valorous Hose", augments={'"Store TP"+3','STR+10','Weapon skill damage +4%','Accuracy+18 Attack+18','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
    gear.valorWSFeet = { name="Valorous Greaves", augments={'Weapon skill damage +7%',}}    
    gear.valorJinpuFeet = { name="Valorous Greaves", augments={'Magic burst dmg.+3%','Pet: AGI+9','Weapon skill damage +3%','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
    
    sets.baseMelee = {
        sub="Utu Grip",
        ammo="Coiste Bodhar", 
        head="Flamma Zucchetto +2",
        neck="Samurai's Nodowa +2",
        ear1="Cessance Earring", -- Dedition Earring
        ear2="Kasuga Earring",
        body="Kasuga Domaru +3",
        hands="Tatenashi Gote +1",
        ring1="Chirich Ring +1", -- Niqmaddu Ring
        ring2="Chirich Ring +1",
        back="Takaha Mantle",
        waist="Sailfi Belt +1",
        legs="Kasuga Haidate +3",
        feet="Tatenashi Sune-ate +1", -- Ryuo
    }

    sets.meleeAcc = set_combine(sets.baseMelee, {
       -- ammo="Amar Cluster",
       -- head="Wakito Kabuto +3",
       -- ear1="Schere Earring",
       -- ear2="Telos Earring",
       -- body="Wakido Domaru +3",
       -- hands="Wakido Kote +3",
       back=gear.dexTPCape,
       -- waist="Ioskeha Belt +1",
       -- legs="Tatenashi Haidate +1",
       -- feet="Wakido Sune-ate +3",
    })

    sets.meleeHybrid = set_combine(sets.baseMelee, {
       -- head="Kasuga Kabuto +3",
       back=gear.dexTPCape,
    })
    
    sets.baseWS = {
        sub="Utu Grip",
        ammo="Knobkierrie",
        head=gear.valorWSHead,   
        neck="Samurai's Nodowa +2",
        ear1="Thrud Earring",
        ear2="Moonshade Earring",
        body="Sakonji Domaru +3",
        hands=gear.valorWSHands, 
        ring1="Epaminondas's Ring",
        ring2="Sroda Ring",
        back=gear.strWSCape,    
        waist="Sailfi Belt +1",   
        legs=gear.valorWSLegs, 
        feet=gear.valorWSFeet,
    }     

    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Impulse Drive'] = set_combine(sets.baseWS, {        
    })

    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.baseWS, {        
    })

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.baseWS, {  
        head="Flamma Zucchetto +2",  
        body="Sakonji Domaru +3",    
        hands="Tatenashi Gote +1",
        legs="Kasuga Haidate +1",
        feet=gear.valorJinpuFeet,        

        ammo="Knobkierrie",
        neck="Samurai's Nodowa +2",
        ear1="Friomisi Earring",   
        ear2="Moonshade Earring",     
        ring1="Epaminondas's Ring",
        ring2="Chirich Ring +1",
        back=gear.eleWSCape,
    })

    sets.precast.WS['Tachi: Goten'] = sets.precast.WS['Tachi: Jinpu']

    sets.precast.FC = {
       
    }
    
    sets.baseIdle = {
       
    }

    sets.precast.JA['Meditate'] = {head="Wakido Kabuto +1", hands="Sakonji Kote +3", back=gear.dexTPCape}

    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}

    sets.moveSpeed = {}
    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.TH = {head="Wh. Rarab Cap +1"}   
    sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}   
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=(sets.baseIdle), engaged=(sets.baseMelee)},
		[1] = {name="DPS-Acc", idle=(sets.baseIdle), engaged=(sets.meleeAcc)},
		[2] = {name="DPS-Hybrid", idle=(sets.baseIdle), engaged=(sets.meleeHybrid)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Shining One", set={main="Shining One", sub=""}},
        [1] = {name="Dojikiri", set={main="Dojikiri Yasutsuna", sub=""}},        
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
        ["sam"] = {
            ["index"] = 0,
            [0] = "Off",
			[1] = "On",
        },
        ["coop"] = {
            ["index"] = 0,
            [0] = "Off",
			[1] = "On",
        }
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

end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	-- Setup my binds

	-- Set default macro book / page
    set_macro_page(1, 5)
	
	-- Load addons

	-- Set style lock
	windower.send_command:schedule(4, 'input /lockstyleset 8')	

    send_command('bind @q gs c cycleSAM')
    send_command('bind @c gs c cycleCOOP')
	set_macro_page(1, 2)
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)	

end

function job_post_precast(spell, action, spellMap, eventArgs)

end

function job_pretarget(spell, action, spellMap, eventArgs)

end

function extendedJobMidcast(spell, action, spellMap, eventArgs)

end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
    for buff,active in pairs(state.Buff) do
		if active and sets.buff[buff] then
			equip(sets.buff[buff])
        end
    end

    if(dayWeatherIntensity(spell.element)) > 0 then
        equip({waist="Hachirin-no-Obi"})
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
    if state.Buff[buff] == nil and active then
        state.Buff[buff] = true
    else
        state.Buff[buff] = nil
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)	
    --[[ Cycle Auto SAM ]]--
    if cmdParams[1] == 'cycleSAM' then
        auto.sam.index = auto.sam.index + 1
        if auto.sam.index > #auto.sam then
            auto.sam.index = 0
        end
        windower.add_to_chat(013,'[SAM: '..auto.sam[auto.sam.index]..']')
    end

    if cmdParams[1] == 'cycleCOOP' then
        auto.coop.index = auto.coop.index + 1
        if auto.coop.index > #auto.coop then
            auto.coop.index = 0
        end
        windower.add_to_chat(013,'[Co-op: '..auto.coop[auto.coop.index]..']')
    end

    modeHud('update')
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
    skyblue = '\\cs(135,206,250)'
    red = '\\cs(255,0,0)'
	green = '\\cs(0,255,0)'
    textColorSAM = red
    textColorCOOP = red
    if auto.sam[auto.sam.index] == 'On' then
        textColorSAM = green
    end

    if auto.coop[auto.coop.index] == 'On' then
        textColorCOOP = green
    end

    hudText:append(skyblue..'SAM: '..textColorSAM..auto.sam[auto.sam.index]..white)
    hudText:append(skyblue..'Co-op: '..textColorCOOP..auto.coop[auto.coop.index]..white)
	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
scWS1Ready = true
scWS2Ready = false
scWait = false
scTimer = 0

function autoActions()
    local abilRecast = windower.ffxi.get_ability_recasts()
    local meikyoRecast = abilRecast[0]
    local jumpRecast = abilRecast[158]
    local highJumpRecast = abilRecast[159]  
    local konzenRecast = abilRecast[132]
    local hassoRecast = abilRecast[138]
    local meditateRecast = abilRecast[134]
    local sekkanokiRecast = abilRecast[140]
    local sengikoriRecast = abilRecast[141]
    local hagakureRecast = abilRecast[54]
    local lastResortRecast = abilRecast[87]
    local me = windower.ffxi.get_player()    

    if auto.coop[auto.coop.index] == 'On' then
        if me.status == 1 then
            local enemy = windower.ffxi.get_mob_by_target('t')

            if scWS1Ready == true and scTimer < 1 and player.tp >= 1000 then
                add_to_chat(207, '[~ Input: Starting SC (Tachi: Goten) ~]')
                send_command('/tachigoten')
                return
            end

            if scWS2Ready == true and scTimer > 0 and player.tp >= 1000 then
                add_to_chat(207, '[~ Input: Closing SC (Tachi: Jinpu) ~]')
                send_command('/tachijinpu')
                return
            end

            if scTimer > 0 then
                scTimer = scTimer - 1
                add_to_chat(207, '[~ Tick! (Timer now at '..scTimer..') ~]')
                if scTimer == 0 and scWS2Ready == true then                    
                    add_to_chat(207, '[~ Missed SC Window, Resetting... ~]')
                    scWS1Ready = true
                    scWS2Ready = false
                end
            end

        -- Reset SC/WS when disengaged
        elseif me.status == 0 then
            scTimer = 0
            scWS1Ready = true
            scWS2Ready = false
            return
        end
    end

    if(auto.sam[auto.sam.index] == 'On' and not actionInProgress and not moving) then
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

        if not buffactive['Sekkanoki'] and sekkanokiRecast == 0 then
            add_to_chat(207, '[~ Sekkanoki ~]')
            send_command('/sekkanoki')
            return
        end    
        
        if jumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
            add_to_chat(207, '[~ Jump ~]')
            send_command('/jump')
            return
        end

        if highJumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
            add_to_chat(207, '[~ High Jump ~]')
            send_command('/highjump')
            return
        end

        if weaponMode[weaponMode.index].name == "Dojikiri" then
            if player.tp >= 1000 or (buffactive['Meikyo Shisui'] and player.tp >= 1000) then
                send_command('/tachishoha')
                return
            end
        else
            if player.tp >= 1750 or (buffactive['Meikyo Shisui'] and player.tp >= 1000) then
                send_command('/impulsedrive')
                return
            end
        end
    end

    if (auto.buff[auto.buff.index] == 'On' and not moving) then
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

        if not buffactive['Sekkanoki'] and sekkanokiRecast == 0 then
            add_to_chat(207, '[~ Sekkanoki ~]')
            send_command('/sekkanoki')
            return
        end    
        --[[
        if not buffactive['Sengikori'] and sengikoriRecast == 0 then
            add_to_chat(207, '[~ Sengikori ~]')
            send_command('/sengikori')
            return
        end
        ]]--
        if not buffactive['Hagakure'] and hagakureRecast == 0 then
            add_to_chat(207, '[~ Hagakure ~]')
            send_command('/hagakure')
            return
        end     
    end
    
    if (auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
        local enemy = windower.ffxi.get_mob_by_target('t')       

        if jumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
            add_to_chat(207, '[~ Jump ~]')
            send_command('/jump')
            return
        end

        if highJumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
            add_to_chat(207, '[~ High Jump ~]')
            send_command('/highjump')
            return
        end

        if lastResortRecast == 0 and player.sub_job == 'DRK' then
            add_to_chat(207, '[~ Last Resort ~]')
            send_command('/lastresort')
            return
        end

        if meikyoRecast == 0 then
            add_to_chat(207, '[~ Meikyo Shisui ~]')
            send_command('/meikyoshisui')
            return
        end
        
        if konzenRecast == 0 then
            add_to_chat(207, '[~ Konzen Ittai ~]')
            send_command('/konzenittai')
            return
        end
        
        if weaponMode[weaponMode.index].name == "Dojikiri" then
            if player.tp >= 1000 or (buffactive['Meikyo Shisui'] and player.tp >= 1000) then
                send_command('/tachishoha')
                return
            end
        else
            if player.tp >= 1750 or (buffactive['Meikyo Shisui'] and player.tp >= 1000) then
                send_command('/impulsedrive')
                return
            end
        end

        if not buffactive['Food'] then
            send_command('input /item "Rolanberry Daifuku" <me>')
            return
        end   
    end
end

windower.register_event('action',function(act)

    if auto.coop[auto.coop.index] == 'On' then
        local actor = windower.ffxi.get_mob_by_id(act.actor_id)
        local self = windower.ffxi.get_player()
        local category = act.category
        local param = act.param -- WS ID (from weapon_skills resource)
        local targets = act.targets
        local targetsParam = targets.param

        if actor and self and actor.id == self.id and category == 3 then
            -- 03: Finish Weapon Skill    (param 24931 = initiation, 28787 = failure)
            -- Objects in 03 return a targets array and an actions array of everyone who is hit by the spell
            local wsName = res.weapon_skills[param].en
            add_to_chat(013, '~ WS Detected ('..param..':'..wsName..') ~')  

            if wsName == "Tachi: Goten" then
                add_to_chat(013, '~ WS1 Detected ('..wsName..') | Starting Timer (5) ~')   
                scWS1Ready = false
                scWS2Ready = true
                scTimer = 10             
            elseif wsName == "Tachi: Jinpu" then
                add_to_chat(013, '~ WS2 Detected ('..wsName..') | Starting Timer (8) ~')
                scWS1Ready = true
                scWS2Ready = false
                scTimer = 10
            end
        end
    end
end)
