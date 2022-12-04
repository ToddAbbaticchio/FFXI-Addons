-- -------------------------------------------------------------------------------------------------------------------
-- -- Setup functions for this job.  Generally should not be modified.
-- -------------------------------------------------------------------------------------------------------------------

include('RST/sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()

	gear.WSDCape = {name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}  
		gear.STPCape = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}} 
	    gear.HybridCape = {name="Smertrios's Mantle", augments={'STR+20','Magic Accuracy+20 Magic Attack+20','Magic Damage +10','Weapon skill damage +10%', "Phys. dmg. taken-10%",}}
	    gear.Aeolian = {}   -- need to make 
	
		sets.baseMelee = {
			ammo="Coiste Bodhar",
			head="Flamma Zucchetto +2", --target Wakido
			body="Kasuga Domaru +3", 
			hands="Wakido Kote +3",  --target hands="Wakido Kote +3",
			legs="Kasuga Haidate +3",
			feet="Tatenashi Sune-ate +1", -- target Wakido
			neck="Sam. Nodowa +2",
			waist="Sailfi Belt +1", 
			left_ear="Dedition Earring",
			right_ear="Kasuga Earring", --SAM Sortie Earring
			left_ring="Niqmaddu Ring",
			right_ring="Chirich Ring +1",   --need +1
	        back=gear.STPCape,
		}


		sets.baseWS = {
			ammo="Knobkierrie",    
			head="Mpaca's Cap",
			body="Nyame Mail",
			hands="Kasuga Kote +3",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Samurai's Nodowa +2",
			waist="Sailfi Belt +1",
			left_ear="Moonshade Earring",
			right_ear="Thrud Earring",
			left_ring="Karieyh Ring",
			right_ring="Epaminondas's Ring",
			back=gear.WSDCape,
		}
	    sets.baseSubtleBlow = {
	        ammo="Aurgelmir Orb",
	        head="Ken. Jinpachi +1",
	        body="Dagon Breastplate",
	        hands="Wakido Kote +3",
	        --legs="Mpaca's Hose",
	        --feet="Ryuo Sune-Ate +1",   --path c 
	        --neck="Bathy Choker +1",
	        --waist="Sarissapho. Belt",
	        --left_ear="Dignitary's earring",
	        right_ear="Schere Earring",
	        left_ring="Niqmaddu Ring",
	        right_ring="Chirich Ring +1",
	        back=gear.STPCape,
		}
		sets.DamageTaken = {
	        ammo="Staunch Tathlum +1",
	        head="Nyame Helm",
	        body="Nyame Mail",
	        hands="Nyame Gauntlets",
	        legs="Nyame Flanchard",
	        feet="Nyame Sollerets",
	        --neck="Warder's Charm +1",
	--        waist="Carrier's Sash",
	       -- left_ear="Flashward Earring",
	        --right_ear="Eabani Earring",
	        --left_ring="Purity Ring",
	        right_ring="Defending Ring",
	        back=gear.MVACape,
		}

		sets.MeleeHybrid = {
	        ammo="Knobkierrie",
	        head="Nyame Helm",
	        body="Nyame Mail",
	        hands="Nyame Gauntlets",
	        legs="Nyame Flanchard",
	        feet="Nyame Sollerets",
	        neck="Samurai's Nodowa +2",
	        waist="Orpheus's Sash",
	        left_ear="Friomisi Earring",
	        right_ear="Moonshade Earring",
	        left_ring="Epaminondas's Ring",
	        right_ring="Karieyh Ring",
	        back=gear.HybridCape,
		}

		sets.defaulttemplate = {
	        ammo="",
	        head="",
	        body="",
	        hands="",
	        legs="",
	        feet="",
	        neck="",
	        waist="",
	        left_ear="",
	        right_ear="",
	        left_ring="",
	        right_ring="",
	        back="",
		}
	
		-- Idle and initial engaged set
	    sets.baseIdle = {head="Wakido Kabuto +1",right_ring="Defending Ring",left_ring="Karieyh Ring",}
	    sets.moveSpeed = {}
	    sets.wakeUp = {neck="Vim Torque",}
	
		-- JA Sets
		sets.precast.JA['Hasso'] = {hands="Wakido Kote +3",legs="Kasuga Haidate +3"}
	    sets.precast.JA['Meditate'] = {head="Wakido Kabuto +1",hands="Sakonji Kote +3"}
	    sets.precast.JA['Seigan'] = {head="Kasuga Kabuto +2"} -- remain on while seigan is active 
	    sets.precast.JA['Third Eye'] = {hands="Wakido Kote +3"}
	    sets.precast.JA['Sekkanoki'] = {hands=empyrean_hands}  -- this needs to be on while Sekkanoki is active 
	    sets.precast.JA['Konzen-ittai'] = {}
	    sets.precast.JA['Shikikoyo'] = {legs="Sakonji Haidate +3"}
	    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}
	    sets.precast.JA['Sengikori'] = {feet="Kasuga Sune-Ate +3"}
	    sets.precast.JA['Hamanoha'] = {}
	    sets.precast.JA['Ikishoten'] = {head="Sakonji Kabuto +3"}
	    sets.precast.JA['Hagakure'] = {}
	    sets.precast.JA['Yaegasumi'] = {}
	    sets.precast.JA['Meikyo Shisui'] = {feet="Sakonji Sune-Ate +3"}
	
		
	
		-- WS Sets
		sets.precast.WS['Tachi: Enpi'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Tachi: Hobaku'] = set_combine(sets.baseWS, {})
		sets.precast.WS['Tachi: Goten'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Tachi: Kagero'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.baseWS, {left_ear="Friomisi Earring",hands="Nyame Gauntlets",head="Nyame Helm",waist="Orpheus's Sash"})
	    sets.precast.WS['Tachi: Koki'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.baseWS, {hands="Kasuga Kote +3"})
	    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.baseWS, {hands="Kasuga Kote +3"})
	    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.baseWS, {hands="Kasuga Kote +3"})
	    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.baseWS, {head="Kasuga Kabuto +2",body="Kasuga Domaru +3",hands="Kasuga Domaru +3",legs="Kasuga Haidate +3",feet="Kasuga Sune-Ate +3",neck="Sanctity Necklace",})
	    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Tachi: Kaiten'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.baseWS, {hands="Kasuga Kote +3"})
	    sets.precast.WS['Tachi: Rana'] = set_combine(sets.baseWS, {})
	
	
	    sets.precast.WS['Impulse Drive'] = set_combine(sets.baseWS, {head="Mpaca's Cap", hands="Kasuga Kote +3", body="Sakonji Domaru +3",ring1="Niqmaddu Ring",feet="Kasuga sune-ate +3"})
	    sets.precast.WS['Stardiver'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Apex Arrow'] = set_combine(sets.baseWS, {})
	    sets.precast.WS['Empyreal Arrow'] = set_combine(sets.baseWS, {})
		sets.precast.WS['Aeolian Edge'] = set_combine(sets.baseWS, {head="Nyame Helm",hands="Nyame Gauntlets",right_ear="Friomisi Earring",back=gear.HybridCape})
	end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=(sets.baseIdle), engaged=(sets.baseMelee)},
		[1] = {name="DPS-SB", idle=(sets.baseIdle), engaged=(sets.baseSubtleBlow)},
		[2] = {name="DPS-Hybrid", idle=(sets.baseIdle), engaged=(sets.MeleeHybrid)},
		[3] = {name="Damage taken", idle=(sets.baseIdle), engaged=(sets.DamageTaken)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Shining One", set={main="Shining One", sub="Utu Grip",}},
		[1] = {name="Hime", set={main="Himetsuruichimonji", sub="Utu Grip",}},
		[2] = {name="Iapetus", set={main="Iapetus", sub="Utu Grip",}},
		[3] = {name="Lotus Katana", set={main="Lotus Katana", sub="Utu Grip",}},
		[4] = {name="Soboro", set={main="Soboro Sukehiro", sub="Utu Grip",}},
		[5] = {name="Signet", set={main="Federation Signet Staff", sub="Utu Grip",}},
        --[2] = {name="MasamuneRange", set={main="Masamune", sub="Utu Grip", range="Ullr",ammo=""}},
 		--[3] = {name="ShiningOneRange", set={main="Shining One", sub="Utu Grip",range="Ullr",ammo=""}},
		--[4] = {name="Malevolence", set={main="Malevolence", sub=""}},
	}

	weaponskills = {
		["index"] = 0,
		[0] = 'Tachi: Enpi',
		[1] = 'Tachi: Hobaku',
		[2] = 'Tachi: Goten',
		[3] = 'Tachi: Kagero',
		[4] = 'Tachi: Jinpu',
		[5] = 'Tachi: Koki',
		[6] = 'Tachi: Yukikaze',
		[7] = 'Tachi: Gekko',
		[8] = 'Tachi: Kasha',
		[9] = 'Tachi: Ageha',
		[10] = 'Tachi: Shoha',
		[11] = 'Tachi: Kaiten',
		[12] = 'Tachi: Fudo',
		[13] = 'Tachi: Rana',
		[14] = 'Impulse Drive',
		[15] = 'Stardiver',
	}



	food = {
		["index"] = 0,
		[0] = 'Grape Daifuku +1',
		[1] = 'Behemoth Steak',
		[2] = 'Dragon Steak',
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
		["stance"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "Hasso",
			[2] = "Seigan",
		},
		["doom"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
		["foodmode"] = {
			["index"] = 0,
			[0] = "Off",
			[1] = "On",
		},
		["weaponskillmode"] = {
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
	send_command('bind ^F12 gs c togglestance')
	send_command('bind ^F8 gs c toggleautofoodmode')
	send_command('bind !F8 gs c togglefood')
	send_command('bind ^F7 gs c toggleweaponskillmode')
	send_command('bind !F7 gs c toggleweaponskill')

	-- Set default macro book / page
    set_macro_page(1, 14)
	
	-- Load addons

	-- Set style lock
	windower.send_command:schedule(4, 'input /lockstyleset 10')	
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



-- function job_buff_change(buff, gain)
-- 	if buff == 'Doom' then
-- 		if gain then
-- 			send_command('input /p Doomed! Haaaaaalp!')
-- 			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
-- 			disable('ring1','waist')
-- 		else
-- 			enable('ring1','waist')
-- 			evalState_equipGear()
-- 		end
-- 	end
 end
-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)

end

function extendedJobSelfCommand(cmdParams, eventArgs)	
	if cmdParams[1]:lower() == 'togglestance' then
		auto.stance.index = auto.stance.index + 1
		if auto.stance.index > #auto.stance then
			auto.stance.index = 0
		end
		modeHud('update')
	end

	if cmdParams[1]:lower() == 'toggleautofoodmode' then
		auto.foodmode.index = auto.foodmode.index + 1
		if auto.foodmode.index > #auto.foodmode then
			auto.foodmode.index = 0
		end
		modeHud('update')
	end
	if cmdParams[1]:lower() == 'togglefood' then
		food.index = food.index + 1
		if food.index > #food then
			food.index = 0
		end
		modeHud('update')
	end
	if cmdParams[1]:lower() == 'toggleweaponskillmode' then
		auto.weaponskillmode.index = auto.weaponskillmode.index + 1
		if auto.weaponskillmode.index > #auto.weaponskillmode then
			auto.weaponskillmode.index = 0
		end
		modeHud('update')
	end
	if cmdParams[1]:lower() == 'toggleweaponskill' then
		weaponskills.index = weaponskills.index + 1
		if weaponskills.index > #weaponskills then
			weaponskills.index = 0
		end
		modeHud('update')
	end

end

function extendedEvalState_equipGear()

end

function extendedModeHud(hudText)
	local autoStance = auto.stance[auto.stance.index]
	hudText:append(white..'auto.stance: '..getStanceColor(autoStance))
	

	local autoFoodMode = auto.foodmode[auto.foodmode.index]
	hudText:append(white..'auto.autoFoodMode: ' ..getBoolColor(autoFoodMode))
	
	
	local autoFood = food[food.index]
	hudText:append(white..'food: '..autoFood)
	

	local autoWeaponSkillMode = auto.weaponskillmode[auto.weaponskillmode.index]
	hudText:append(white..'auto.autoWeaponSkillMode: ' ..getBoolColor(autoWeaponSkillMode))

	local WeaponSkill = weaponskills[weaponskills.index]
	hudText:append(white..'WeaponSkill: ' ..getBoolColor(WeaponSkill))

	return hudText
end

function getStanceColor(bool)
	if bool == 'Hasso' then
		return green..bool..white
	end
	return red..bool..white
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
	local seiganRecast = abilRecast[139]
	local thirdEyeRecast = abilRecast[133]
    local meditateRecast = abilRecast[134]
    local sengikoriRecast = abilRecast[141]
    local hagakureRecast = abilRecast[54]
    local lastResortRecast = abilRecast[87]
    local me = windower.ffxi.get_player()    


	-- handle auto wake on sleep with frenzy sallet
 	if buffactive['Sleep'] and player.status == "Engaged" then 
 		send_command('input //gs equip sets.wakeUp')
 	elseif player.equipment.neck == "Vim Torque" and not buffactive['Sleep'] then
 		if player.status == "Engaged" then
 			send_command('input //gs equip sets.engaged')
 		else
 			send_command('input //gs equip sets.idle')
 		end
 	end

	 if auto.stance[auto.stance.index] == 'Hasso' then
		if hassoRecast == 0 and not buffactive['Hasso'] then 
			send_command('input /ja "Hasso" <me>')
			return
		end
	end

	if auto.stance[auto.stance.index] == 'Seigan' then
		if seiganRecast == 0 and not buffactive['Seigan'] then 
			send_command('input /ja "Seigan" <me>')
			return
		end
		
		if thirdEyeRecast == 0 and not buffactive['Third Eye'] then
			send_command('input /ja "Third Eye" <me>')
			return
		end					
	end

    if auto.weaponskillmode[auto.weaponskillmode.index] == 'On' and (auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
        if player.tp > 1750 and konzenRecast == 0 then
        --    add_to_chat(207, '[~ Konzen Ittai ~]')
            send_command('/konzenittai')
            send_command:schedule(0.8, 'input /ws "' ..weaponskills[weaponskills.index].. '" <t>')
            return
        end


        if meditateRecast == 0 then
        --    add_to_chat(207, '[~ Meditate ~]')
            send_command('/meditate')
            return
        end

        if not buffactive['Sengikori'] and sengikoriRecast == 0 then
        --    add_to_chat(207, '[~ Sengikori ~]')
            send_command('/sengikori')
            return
        end

        if not buffactive['Hagakure'] and hagakureRecast == 0 then
         --   add_to_chat(207, '[~ Hagakure ~]')
            send_command('/hagakure')
            return
        end        
    end
    
    if (auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving and me.status == 1) then
        local enemy = windower.ffxi.get_mob_by_target('t')       

        if jumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
         --   add_to_chat(207, '[~ Jump ~]')
            send_command('/jump')
            return
        end

        if highJumpRecast == 0 and player.tp < 1750 and player.sub_job == 'DRG' then
         --   add_to_chat(207, '[~ High Jump ~]')
            send_command('/highjump')
            return
        end

        if lastResortRecast == 0 and player.sub_job == 'DRK' then
         --   add_to_chat(207, '[~ Last Resort ~]')
            send_command('/lastresort')
            return
        end

        if meikyoRecast == 0 then
         --   add_to_chat(207, '[~ Meikyo Shisui ~]')
            send_command('/meikyoshisui')
            return
        end

        if auto.weaponskillmode[auto.weaponskillmode.index] == 'On' and player.tp >= 1750 or (buffactive['Meikyo Shisui'] and player.tp >= 1000) then
            send_command('input /ws "' ..weaponskills[weaponskills.index].. '" <t>')
            return
		end 
    end

	if auto.foodmode[auto.foodmode.index] == 'On' and not buffactive['Food'] then
		send_command('input /item "' ..food[food.index].. '" <me>')
		return
	end  
end