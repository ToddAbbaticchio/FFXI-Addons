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


    --[[ Set up Augmented Gear ]]--
    gear.valorWSHead = { name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +5%','DEX+1',}}
    gear.valorJinpuHead = { name="Valorous Mask", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +4%','Attack+9',}}
    --hands={ name="Valorous Mitts", augments={'Attack+20','Weapon skill damage +4%','DEX+4','Accuracy+11',}}
    gear.valorWSHands = { name="Valorous Mitts", augments={'Attack+23','Weapon skill damage +4%','STR+4',}}
    gear.valorWSLegs={ name="Valorous Hose", augments={'"Store TP"+3','STR+10','Weapon skill damage +4%','Accuracy+18 Attack+18','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
    gear.valorWSFeet = { name="Valorous Greaves", augments={'Accuracy+22 Attack+22','Weapon skill damage +4%','Accuracy+2',}}    
    
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
        neck="Samurai's Nodowa +2",
        ear1="Thrud Earring",
        ear2="Moonshade Earring",
        body="Sakonji Domaru +3",
        ring1="Epaminondas's Ring",
        ring2="Ifrit Ring +1",
        back=gear.strWSCape,    
        waist="Sailfi Belt +1",    
    }     

    -- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Impulse Drive'] = set_combine(sets.baseWS, {
        ammo="Knobkierrie",
        head=gear.valorWSHead, --head="Mpaca's Cap",        
        hands=gear.valorWSHands, --- Kasuga +3
        legs=gear.valorWSLegs, -- Wakido +3
        feet=gear.valorWSFeet, --Kasuga +3
    })

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.baseWS, {
        --ammo="Knobkierrie",
        head=gear.valorJinpuHead,
        ear1="Friomisi Earring",
        body="Sakonji Domaru +3",
        hands=gear.valorWSHands, -- Valor Jinpu Aug / Kasuga (Empy) Kote +3
        -- ring2= ???
        back=strWSCape, -- Jinpu Ambu Cape needed
        -- waist = o.sash or ???
        legs=gear.valorWSLegs, -- Valor Jinpu Aug needed
        feet=gear.valorWSFeet, -- Valor Jinpu Aug needed
    })

    sets.precast.FC = {
       
    }
    
    sets.baseIdle = {
       
    }

    sets.precast.JA['Meditate'] = {head="Wakido Kabuto +1", hands="Sakonji Kote +3", back=gear.dexTPCape}

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
        [1] = {name="Ichigo", set={main="Ichigohitofuri", sub=""}},        
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

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)

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

    modeHud('update')
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
    skyblue = '\\cs(135,206,250)'
    red = '\\cs(255,0,0)'
	green = '\\cs(0,255,0)'
    textColor = red
    if auto.sam[auto.sam.index] == 'On' then
        textColor = green
    end

    hudText:append(skyblue..'SAM: '..textColor..auto.sam[auto.sam.index]..white)
	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
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
    end

    if (auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
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

        if not buffactive['Sengikori'] and sengikoriRecast == 0 then
            add_to_chat(207, '[~ Sengikori ~]')
            send_command('/sengikori')
            return
        end

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

        if player.tp >= 1750 or (buffactive['Meikyo Shisui'] and player.tp >= 1000) then
            send_command('/impulsedrive')
            return
        end

        if not buffactive['Food'] then
            send_command('input /item "S. Salis. Steak" <me>')
            return
        end   
    end
end