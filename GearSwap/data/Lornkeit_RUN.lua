include('sharedFunctions.lua')

-------------------------------------------------------------------------------------------------------------------
-- dumb name.  is required.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
        gear.STRCape = {name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
        gear.DEXCape = {name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
        gear.EvaCape = {name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
        gear.CASTCape = {name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
        gear.EnmityCape = {name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
        gear.TankCape = {name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
        gear.LungeCape = {name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
        gear.meleeHercBoots = {name="Herculean Boots", augments={'Accuracy+19 Attack+19'}}
        gear.treasureHunterHercBoots = {name="Herculean Boots", augments={'Treasure Hunter +1'}}

        sets.baseMelee = {
            ammo="Coiste Bodhar",
            head="Adhemar Bonnet +1",
            body="Adhemar Jacket +1",
            hands="Adhemar Wristbands +1",
            legs="Samnuha Tights",
            feet=gear.meleeHercBoots,
            neck="Anu Torque",
            waist="Windbuffet Belt +1",
            left_ear="Brutal Earring",
            right_ear="Sherida Earring",
            left_ring="Epona's Ring",
            right_ring="Moonlight Ring",
            back=gear.DEXCape
        }
        -- 42 DT; 52PDTx 
        sets.baseTank = {
            ammo="Staunch Tathlum +1",  --3 DT
            head="Nyame Helm",          --7 DT
            body="Erilaz Surcoat +2",
            hands="Turms Mittens +1",
            legs="Erilaz Leg Guards +2", -- -12 DT
            feet="Turms Leggings +1",
            neck="Futhark Torque +2", -- -5 DT (will be 7.. some day)
            waist="Engraved Belt",
            left_ear="Eabani Earring", 
            right_ear="Sherida Earring",
            left_ring="Moonlight Ring", -- -5 DT
            right_ring="Defending Ring", -- -10 DT
            back=gear.TankCape -- -10 PDT
        }
        sets.deathTank = set_combine(sets.baseTank, {
            body="Samnuha Coat",
            ring1="Shadow Ring",
            ring2="Warden's Ring"
        })
        sets.baseWS = {
            ammo="Seething Bomblet +1",
            head="Adhemar Bonnet +1",
            body="Adhemar Jacket +1",
            hands="Meghanada Gloves +2",
            legs="Samnuha Tights",
            feet="Meghanada Jambeaux +2",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            left_ear="Moonshade Earring",
            right_ear="Sherida Earring",
            left_ring="Epona's Ring",
            right_ring="Rajas Ring",
            back=gear.STRCape,
        }
        -- -34/37(grip) DT, -17 PDT, -5 PDTII (Aettir)
        sets.TankMeleeHybrid = {
            -- -3DT from Grip
            ammo="Staunch Tathlum", -- -3 DT
            head="Ayanmo Zucchetto +2", -- -3 DT
            body="Ayanmo Corazza +2", -- -6 DT
            hands="Nyame Gauntlets", -- -7 DT
            legs="Samnuha Tights",
            feet=gear.meleeHercBoots, -- -7 PDT
            neck="Sanctity Necklace",
            waist="Windbuffet Belt +1",
            left_ear="Brutal Earring", 
            right_ear="Sherida Earring",
            left_ring="Moonlight Ring", -- -5 DT
            right_ring="Defending Ring", -- -10 DT
            back=gear.TankCape -- -10 PDT
        }
        sets.meleeAcc = {
            ammo="Coiste Bodhar",
            head="Ayanmo Zucchetto +2",
            body="Ayanmo Corazza +2",
            hands="Meghanada Gloves +2",
            legs="Meghanada Chausses +2",
            feet="Meghanada Jambeaux +2",
            neck="Sanctity Necklace",
            waist="Kentarch Belt",
            left_ear="Brutal Earring",
            right_ear="Sherida Earring",
            left_ring="Patricius Ring",
            right_ring="Rajas Ring",
            back=gear.DEXCape
        }
        sets.evaTank = set_combine(sets.baseTank, {
            sub="Kupayopl",
            ammo="Yamarang",
            head="Nyame Helm",
            body="Nyame Mail",
            hands="Nyame Gauntlets",        
            legs="Nyame Flanchard",
            feet="Nyame Sollerets",         
            neck="Combatant's Torque",
            waist="Engraved Belt",
            ear1="Eabani Earring",
            ear2="Infused Earring",
            ring1="Vengeful Ring",
            ring2="Moonlight Ring",
            back=gear.EvaCape,
        })
    
        sets.magicEvaTank = set_combine(sets.baseTank, {
            ammo="Yamarang",
            head="Nyame Helm",                --DT07
            body="Runeist Coat +1",
            hands="Nyame Gauntlets",
            legs="Nyame Flanchard",           --DT08
            feet="Nyame Sollerets",
            neck="Futhark Torque +2",         --DT07
            waist="Engraved Belt",
            ear1="Tuisto Earring",
            ear2="Odnowa Earring +1",
            ring1="Moonlight Ring",       --DT05
            ring2="Defending Ring",      --DT10
            back=gear.EnmityCape,
        })
        sets.superTank = set_combine(sets.baseTank, {
            ammo="Yamarang",
            head="Nyame Helm",                --DT07
            body="Runeist Coat +1",
            hands="Nyame Gauntlets",
            legs="Nyame Flanchard",           --DT08
            feet="Nyame Sollerets",
            neck="Futhark Torque +2",         --DT07
            waist="Engraved Belt",
            ear1="Tuisto Earring",
            ear2="Odnowa Earring +1",
            ring1="Moonlight Ring",       --DT05
            ring2="Defending Ring",      --DT10
            back=gear.EnmityCape,
        })
        sets.baseEnmity = {             --Total: 69 Enmity currently
            ammo="Aqreqaq Bomblet",      --2
            head="Rabid Visor",             --6
            neck="Futhark Torque +2",       --10
            ear1="Hades Earring +1",        --2 Upgrade: Cryptic +4
            ear2="Friomisi Earring",        --2
            body="Emet Harness",            --9 the +1 is UNM item for 10
            hands="Futhark Mitons +1",      --4 Kurys Gloves +9
            legs="Erilaz Leg Guards +2",    --12
            feet="Erilaz Greaves +2",       --7
            waist="Sulla Belt",             --3
            ring1="Provocare Ring",         --5
            ring2="Petrov Ring",            --4
            back=gear.EnmityCape,           --10
        }
        --TODO
        sets.interrupt = set_combine(sets.baseTank, {   --Total: 103
            -- level 5 merits                           --10
            ammo="Impatiens",                           --10
            head="Agwu's Cap",
            body="Herculean Vest",                      --10
            hands="Rawhide Gloves",                     --15 
            legs="Carmine Cuisses +1",                  --20
            --feet
            --neck="Moonbeam Necklace",                 --10
            waist="Audumbla Sash",                      --10
            ear1="Halasz Earring",                      --05
            ear2="Magnetic Earring",                    --08
            ring1="Evanescence Ring",                   --05
            ring2="Moonlight Ring",
            back=gear.CASTCape,                         --10
        })
        --TODO
        sets.emSkill = {
            ammo="Aqreqaq Bomblet",
            --head="Carmine Mask",            --10
            --body="Manasa Chasuble", ???
            hands="Runeist's Mitons +1",      --15
            legs="Carmine Cuisses +1",        --18
            feet="Carmine Greaves +1",
            neck="Incanter's Torque",         --10
            waist="Olympus Sash",             --05
            ear1="Andoaa Earring",        --05
            ear2="Mimir Earring",        --10
            ring1="stikini ring +1",      --08
            ring2="stikini ring +1",     --08
            back="Merciful Cape",             --05
        }
        sets.MagicBurst = {
            ammo="Seething Bomblet +1",
            head="Agwu's Cap",
            body="Samnuha Coat",
            hands="Agwu's Gages",
            legs="Agwu's Slops",
            feet="Agwu's Pigaches",
            neck="Sanctity Necklace",
            waist="Eschan Stone",
            ear1="Friomisi Earring",
            ear2="Crematio Earring",
            ring1="Locus Ring",
            ring2="Mujin Band",
            back=gear.LungeCape,
        }
        sets.precast.FC = {
            Ammo="Impatiens",
            Head="Runeist Bandeau +1",
            body="Agwu's Robe",
            hands="Agwu's Gages",
            legs="Agwu's Slops",
            feet="Agwu's Pigaches",
            Neck="Incanter's Torque",
            left_ear="Loquac. Earring",
            right_ear="Etiolation earring",
            left_ring="Lebeche ring",
            right_ring="Kishar ring",
            waist="Siegel Sash",
        }

    sets.baseIdle = {
        ammo="Staunch Tathlum +1",
        head="Erilaz Galea +2",
        body="Agwu's Robe",
        hands="Erilaz Gauntlets +2",
        legs="Eri. Leg Guards +2",
        feet="Erilaz Greaves +2",
        neck={ name="Futhark Torque +2", augments={'Path: A',}},
        waist="Engraved Belt",
        left_ear="Eabani Earring",
        right_ear="Etiolation Earring",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back=gear.TankCape
    }
        sets.moveSpeed = {legs="Carmine Cuisses +1"}
        sets.wakeUp = {head="Frenzy Sallet"}
        sets.Obi = {waist="Hachirin-no-Obi"}
        sets.TH = {waist='Chaac Belt', head='Wh. Rarab Cap +1', ammo='Per. Lucky Egg', feet=gear.treasureHunterHercBoots}
        --TODO
        sets.emDuration = {legs="Futhark Trousers +2",head="Erilaz Galea +2",}
        sets.MagicFreeCast = set_combine(sets.MagicBurst, {ring1='Shiva Ring +1', ring2="Shiva Ring +1"})
        sets.naked = {head=empty, body=empty, hands=empty, legs=empty, feet=empty, neck=empty, waist=empty, ear1=empty, ear2=empty, ring1=empty, ring2=empty, back=empty}
    
        -- JA Sets
        sets.precast.JA['Odyllic Subgerfuge'] = sets.baseEnmity
        sets.precast.JA['Vallation'] = set_combine(sets.baseEnmity, {body="Runeist Coat +1", legs="Futhark Trousers +2",})
        sets.precast.JA['Valiance'] = set_combine(sets.baseEnmity, {body="Runeist Coat +1", legs="Futhark Trousers +2",})
        sets.precast.JA['Pflug'] = sets.baseEnmity
        sets.precast.JA['Battuta'] = set_combine(sets.baseEnmity, {head="Futhark Bandeau +1"})
        sets.precast.JA['Liement'] = set_combine(sets.baseEnmity, {body="Futhark Coat +1"})
        sets.precast.JA['Lunge'] = sets.MagicBurst
        sets.precast.JA['Swipe'] = sets.MagicBurst
        sets.precast.JA['Gambit'] = {hands="Runeist's Mitons +1"}
        sets.precast.JA['Rayke'] = {feet="Futhark Boots +1"}
        sets.precast.JA['Elemental Sforzo'] = set_combine(sets.baseEnmity, {body="Futhark Coat +1"})
        sets.precast.JA['Swordplay'] = set_combine(sets.baseEnmity, {hands="Futhark Mitons +1"})
        sets.precast.JA['Vivacious Pulse'] = set_combine(sets.baseEnmity, {head="Erilaz Galea +2"})
        sets.precast.JA['Weapon Bash'] = set_combine(sets.tank, sets.TH)
    
        -- WS Sets
        sets.precast.WS = set_combine(sets.baseWS, {})
        sets.precast.WS['Resolution'] = set_combine(sets.baseWS, {back=gear.STRCape, head="Adhemar Bonnet +1",body="Adhemar Jacket +1",ring1="Epona's Ring"})
        sets.precast.WS['Dimidiation'] = set_combine(sets.baseWS, {back=gear.DEXCape, neck="Republican Platinum Medal", ammo="Knobkierrie"})
        sets.precast.WS['Shockwave'] = {sets.MagicBurst}
        sets.precast.WS['Ground Strike'] = set_combine(sets.baseWS, {})
        sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {ring2="Rufescent Ring"})
        sets.precast.WS['Requiescat'] = {sets.baseWS}
        sets.precast.WS['Sanguine Blade'] = set_combine(sets.MagicFreeCast, {head="Pixie Hairpin +1",})
    
        -- Magic sets
        sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +2", waist="Siegel Sash"})
        sets.midcast['Enhancing Magic'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration)
        sets.midcast['Crusade'] = set_combine(sets.baseTank, sets.interrupt, sets.emDuration)
        sets.midcast['Temper'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration)
        sets.midcast['Phalanx'] = set_combine(sets.baseTank, sets.interrupt, sets.emSkill, sets.emDuration, {head="Futhark Bandeau +1", body="Taeon Tabard", hands="Taeon Gloves", feet="Taeon Boots"})
        sets.midcast['Aquaveil'] = set_combine(sets.baseTank, sets.emSkill, sets.emDuration, sets.interrupt, {})
        sets.midcast['Regen'] = set_combine(sets.baseTank, sets.emDuration, {head="Runeist Bandeau +1",right_ear="Erilaz Earring",neck="Sacro Gorget",waist="Sroda Belt"})
        sets.midcast['Cure'] = set_combine(sets.baseTank, {waist="Sroda Belt"})
        sets.midcast['Refresh'] = set_combine(sets.baseTank, sets.emDuration, {waist="Gishdubar Sash", head="Erilaz Galea +2",})
        sets.midcast['Cocoon'] = sets.baseTank
        sets.midcast['Stoneskin'] = set_combine(sets.baseTank, sets.emSkill, {waist="Siegel Sash",})
        sets.midcast['Sheep Song'] = set_combine(sets.tank, sets.TH)
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
    gearMode = {
		["index"] = 0,
		[0] = {name="Tank", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseTank)},
		[1] = {name="DPS", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
        -- [2] = {name="DeathTank", idle=sets.deathTank, engaged=sets.deathTank},
        -- [2] = {name="Death", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(set_combine(sets.baseMelee, {left_ring = "Shadow Ring", right_ring = "Warden's Ring"}))},
		-- [2] = {name="DpsTankHybrid", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.TankMeleeHybrid)},
		-- [3] = {name="DPSAcc", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.meleeAcc)},
		-- [2] = {name="MagicTank", idle=(sets.magicEvaTank), engaged=(sets.magicEvaTank)},
		-- [3] = {name="EvaTank", idle=sets.evaTank, engaged=sets.evaTank},
		-- [4] = {name="SuperTank", idle=(sets.superTank), engaged=(sets.baseTank)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Aettir", set={main="Aettir", sub="Utu Grip"}},
		[1] = {name="Montante +1", set={main="Montante +1", sub="Utu Grip"}},
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
		["rune"] = {
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
    magicMaps = {}
    magicMaps.Enmity = S{'Blank Gaze', 'Jettatura', 'Soporific', 'Blitzstrahl', 'Chaotic Eye', 'Flash', 'Foil', 'Stun'}
	magicMaps.Interrupt = S{'Aquaveil', 'Utsusemi: Ichi', 'Utsusemi: Ni', 'Poisonga', 'Sheep Song', 'Geist Wall'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	--Setup my binds
	send_command('bind ^F11 gs c toggleAutoRune')
	send_command('bind ^= rh useRune')
	send_command('bind != rh useBarSpell')
    send_command('bind ^home rh runesUp')
    send_command('bind ^delete rh runesDown')

	--Set default macro book / page
    if player.sub_job == 'DRK' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'BLU' then
        set_macro_page(2, 3)
    end
	
	--Load runehelper addon
	windower.send_command('lua load runehelper')

	--Handle weapons and stylelock based on subjob
	if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
		--weaponMode.index = 3
		--equip(weaponMode[weaponMode.index].set)
		windower.send_command:schedule(4, 'input /lockstyleset 181')
	else
		--weaponMode.index = 0
		--equip(weaponMode[weaponMode.index].set)
		windower.send_command:schedule(4, 'input /lockstyleset 181')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	--add_to_chat(001, '-- Spell: '..spell.english..' Type: '..spell.type..' --')
	
	-- Spell/ability audibles
	if spell.english == 'Lunge' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
            eventArgs.cancel = true
			send_command('input /ja "Swipe" ' .. tostring(spell.target.raw))
        end
    end
    if spell.english == 'Valiance' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            eventArgs.cancel = true
			send_command('input /ja "Vallation" ' .. tostring(spell.target.raw))
        elseif spell.english == 'Valiance' and buffactive['vallation'] then
            cast_delay(0.2)
            send_command('cancel Vallation')
		end
    end
	
	-- /DRK Spell/ability audibles
	if spell.english == 'Swordplay' and player.sub_job == 'DRK' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            eventArgs.cancel = true
			send_command('input /ja "Last Resort" ' .. tostring(spell.target.raw))
        end
	end
	if player.sub_job == 'DRK' and spell.english == 'Flash' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 then
			eventArgs.cancel = true
			send_command('input /ma "Stun" ' .. tostring(spell.target.raw))
		end
	end

	--[[ if player.sub_job == 'DRK' and spell.english == 'Flash' then
		eventArgs.cancel = true
		send_command('input /ma "Stun" ' .. tostring(spell.target.raw))
	end ]]
	
	-- /BLU Spell/ability audibles
	if player.sub_job == 'BLU' and spell.english == 'Geist Wall' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 then
			eventArgs.cancel = true
			send_command('input /ma "Sheep Song" ' .. tostring(spell.target.raw))
		end
	end
	if player.sub_job == 'BLU' and spell.english == 'Flash' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 then
			eventArgs.cancel = true
			send_command('input /ma "Blank Gaze" ' .. tostring(spell.target.raw))
		end
	end
	
	-- Use the obi on swipe/lunge if it'd help
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    end

    -- Utsusemi helper
	if spell.english:contains('Utsusemi') then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            eventArgs.cancel = true
            add_to_chat(123, '**!! ' .. spell.english .. ' Canceled: [3+ IMAGES] !!**')
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end

	-- Autofite mode audibles
	if auto.buff[auto.buff.index] == 'On' and spell.english:contains('Protect') and not(windower.ffxi.get_ability_recasts()[72] > 0) then
		eventArgs.cancel = true
		send_command('input /ja "Embolden" <me>; wait 2; input /ma "'..spell.name..'" '..tostring(spell.target.raw))
	end
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
	if magicMaps.Enmity:contains(spell.english) then
		equip(sets.baseEnmity)
	end
	if magicMaps.Interrupt:contains(spell.english) then
		equip(sets.interrupt)
	end

	if spell.action_type == 'Magic' and buffactive['Embolden'] then
		add_to_chat(122, "Embolden cape gooooo!")
		equip({back="Evasionist's Cape"})
        -- equip(set_combine(sets.midcast['Enhancing Magic'], {back="Evasionist's Cape"}))
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
	if buff == "Doom" then
		if active then
			send_command('input /p "Doomed, pls halp!')
			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
			disable('ring1','waist')
		else
			send_command('input /p "I am saved! ...or Doom killed me?')
			enable('ring1','waist')
			evalState_equipGear()
		end
	end

	--[[ if active then
		if showSpellInfo == 1 then add_to_chat(122,'-- Buff: '..buff..' BuffState: true --') end
		state.Buff[buff] = true
	else
		if showSpellInfo == 1 then add_to_chat(122,'-- Buff: '..buff..' BuffState: false --') end
		state.Buff[buff] = nil
	end ]]
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedTWM(cmdParams, eventArgs)
	-- if weaponMode[weaponMode.index].name == "Aettir" and gearMode[gearMode.index].name ~= "MagicTank" then
	-- 	weaponMode.index = weaponMode.index + 1
	-- 	if weaponMode.index > #weaponMode then
	-- 		weaponMode.index = 0;
	-- 	end
	-- end
	-- if weaponMode[weaponMode.index].name == "DW-Swords" and (player.sub_job ~= "NIN" and player.sub_job ~= "DNC") then
	-- 	weaponMode.index = weaponMode.index + 1
	-- 	if weaponMode.index > #weaponMode then
	-- 		weaponMode.index = 0;
	-- 	end
	-- end
end

function extendedJobSelfCommand(cmdParams, eventArgs)
	-- for runeHelper addon
	if cmdParams[1]:lower() == 'toggleautorune' then
		auto.rune.index = auto.rune.index + 1
		if auto.rune.index > #auto.rune then
			auto.rune.index = 0
		end
		add_to_chat(122,'-- autoRune:'..auto.rune[auto.rune.index]..' --')
		modeHud('update')
	end
	if cmdParams[1]:lower() == 'setrune' then
		add_to_chat(122,'-- set rune to: '..cmdParams[2]..' --')
		auto.rune.index = 0
		currRune = cmdParams[2]
	end

	-- spike health for omen healing objective
	if cmdParams[1]:lower() == 'spikehealth' then
		equip(sets.naked)

	end
end

function extendedEvalState_equipGear()
	-- if gearMode[gearMode.index].name == 'EvaTank' then
	-- 	sets.weapons.sub = "Kupayopl"
	-- else
	-- 	if gearMode[gearMode.index].name == 'DW-Swords' then
	-- 		sets.weapons.sub = "Reikiko"
	-- 	else
	-- 		sets.weapons.sub = "Utu Grip"
	-- 	end
	-- end
end

function extendedModeHud(hudText)
	modeHud_xPos = 550
	modeHud_yPos = 0

	local autoRune = auto.rune[auto.rune.index]
	hudText:append(white..'auto.Rune: '..getBoolColor(autoRune))
	return hudText
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()
	local runeRecast = abilRecast[92]

	-- auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- handle auto wake on sleep with frenzy sallet
	if buffactive['Sleep'] and player.status == "Engaged" then 
		send_command('input //gs equip sets.wakeUp')
	elseif player.equipment.head == "Frenzy Sallet" and not buffactive['Sleep'] then
		if player.status == "Engaged" then
			send_command('input //gs equip sets.engaged')
		else
			send_command('input //gs equip sets.idle')
		end
	end

	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		-- auto rune
		if not currRune then currRune = 'Tenebrae' end
		if buffactive[currRune] ~= 3 and auto.rune[auto.rune.index] == 'On' and runeRecast == 0 then
			windower.send_command('rh userune')
			return
		end

		-- spells when in tank mode
		--if gearMode[gearMode.index].name:contains('Tank') then
			-- if not buffactive['Aquaveil'] then
			-- 	--actionInProgress = true
			-- 	add_to_chat(122,'-- Aquaveil is down. Trying to recast... --')
			-- 	send_command('input /ma "Aquaveil" <me>')
			-- 	return
			-- end

			-- if not buffactive['Enmity Boost'] then
			-- 	--actionInProgress = true
			-- 	add_to_chat(122,'-- Crusade is down. Trying to recast... --')
			-- 	send_command('input /ma "Crusade" <me>')
			-- 	return
			-- end

			-- if not buffactive['Phalanx'] then
			-- 	--actionInProgress = true
			-- 	add_to_chat(122,'-- Phalanx is down. Trying to recast... --')
			-- 	send_command('input /ma "Phalanx" <me>')
			-- 	return
			-- end

            -- if not buffactive['Regen'] then
            --     add_to_chat(122,'-- Regen is down. Trying to recast... --')
			-- 	send_command('input /ma "Regen IV" <me>')
			--     return
			-- end

            -- Temper
		if not buffactive['Multi Strikes'] and (player.status == 'Engaged' or gearMode[gearMode.index].name ~= 'SuperTank') then
			--actionInProgress = true
			add_to_chat(122,'-- Temper is down. Trying to recast... --')
			send_command('input /ma "Temper" <me>')
			return
		end
        
        if player.sub_job == 'BLU' and not buffactive['Defense Boost'] then
			--actionInProgress = true
			add_to_chat(122,'-- Cocoon is down. Trying to recast... --')
			send_command('input /ma "Cocoon" <me>')
			return
		end 		
		
		if not buffactive['Refresh'] and player.mpp < 50 then
			--actionInProgress = true
			add_to_chat(122,'-- Refresh is needed. Trying to recast... --')
			send_command('input /ma "Refresh" <me>')
			return
		end

		-- Autofite only
		if auto.fite[auto.fite.index] == 'On' then
			if not buffactive['Protect'] then
				send_command('/protect4')
			end
			if not buffactive['Shell'] then
				send_command('/shell5')
			end
			if player.hpp < 80 and not buffactive['Regen'] then
				send_command('/regen4')
				return
			end
			if (buffactive['Tenebrae'] and player.mpp < 80) or (not buffactive['Tenebrae'] and player.hpp < 80) then
				send_command('/Vivacious Pulse')
			end
		end
	end
end