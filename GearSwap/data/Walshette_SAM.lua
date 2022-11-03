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
    gear.strWSCape = {name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','DEX+10'}}
    gear.dexTPCape = {name="Smertrios's Mantle", augments={'DEX+20'}}

    --[[ Set up Augmented Gear ]]--
    gear.valorWSHands = { name="Valorous Mitts", augments={'Weapon skill damage +4%','Accuracy+2','Attack+9',}}
    gear.valorJinpuHead = { name="Valorous Mask", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +4%','Attack+9',}}
    
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
        ear1="Thrud Earring",
        ear2="Moonshade Earring",
        back=gear.strWSCape,
        --body = Sakonji Domaru +3 during Overwhelm (need to code Overwhelm logic)
    }     

    -- WS Sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Impulse Drive'] = set_combine(sets.baseWS, {
        --ammo="Knobkierrie",
        head=gear.valorJinpuHead, --head="Mpaca's Cap",
        neck="Samurai's Nodowa +2",
        body="Kasuga Domaru +3", -- Sakonji +3
        hands=gear.valorWSHands, --- Kasuga +3
        ring1="Apate Ring", -- Niqmaddu Ring
        ring2="Ifrit Ring +1",
        waist="Sailfi Belt +1",
        legs="Valorous Hose", -- Wakido +3
        feet="Valorous Greaves", --Kasuga +3
    })

    sets.precast.FC = {
       
    }
    
    sets.baseIdle = {
       
    }

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
        [1] = {name="GK", set={main="", sub=""}},        
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
	windower.send_command:schedule(4, 'input /lockstyleset 9')	
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

    --modeHud('update')
end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
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
    local sengikoriRecast = abilRecast[141]
    local hagakureRecast = abilRecast[54]
    local lastResortRecast = abilRecast[87]
    local me = windower.ffxi.get_player()    

    if (auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
        if player.tp > 1750 and konzenRecast == 0 then
            add_to_chat(207, '[~ Konzen Ittai ~]')
            send_command('/konzenittai')
            send_command:schedule(0.8, '/impulsedrive')
            return
        end

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

        if player.tp >= 1750 or (buffactive['Meikyo Shisui'] and player.tp >= 1000) then
            send_command('/impulsedrive')
            return
        end
        --[[
        if not buffactive['Food'] then
            send_command('input /item "Pork Cutlet Bowl" <me>')
            return
        end   
        ]]--
    end
end