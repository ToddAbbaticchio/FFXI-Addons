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
    gear.NukeCape = {
        name = "Nantosuelta's Cape",
        augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10'}
    }
    gear.PetRegenCape = {
        name = "Nantosuelta's Cape",
        augments = {'Pet: "Regen"+10'}
    }

    sets.baseMelee = {
        main = "Cath Palug Hammer",
        sub = "Ammurapi Shield",
        head = "Azimuth Hood +2",
        neck = "Sanctity Necklace",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        body = "Azimuth Coat +3",
        hands = "Jhakri Cuffs +2",
        left_ring = "Jhakri Ring",
        right_ring = "Toreador's Ring",
        waist = "Swift Belt",
        legs = "Jhakri Slops +2",
        feet = "Bagua Sandals +2",
        back = gear.PetRegenCape
    }

    sets.baseIdle = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Befouled crown",
        neck = "Sibyl Scarf",
        left_ear = "Loquacious Earring",
        right_ear = "Etiolation Earring",
        body = "Azimuth Coat +3",
        hands = "Bagua Mitaines +3",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        waist = "Embla Sash",
        legs = "Lengo Pants",
        feet = "Geomancy Sandals +3",
        back = gear.PetRegenCape
    }

    -- I need to survive; 48DT; 50+ PDT, 49MDT
    sets.stronkIdle = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2", -- -11DT
        body = "Nyame Mail", -- -9DT
        hands = "Azimuth Gloves +2", -- -11DT
        legs = "Nyame Flanchard", -- -8DT
        feet = "Azimuth Gaiters +2", -- -7DT
        neck = "Bagua Charm +2",
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring", -- -10DT
        right_ring = "Stikini Ring +1",
        back = gear.PetRegenCape,
        waist = "Embla Sash"
    }

    -- My pet needs to survive
    -- -24DT
    -- +24 regen
    sets.petStronkIdle = {
        main = "Solstice",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2",
        body = "Telchine Chasuble",
        hands = "Geomancy Mitaines +3",
        legs = "Psycloth Lappas",
        feet = "Bagua Sandals +2",
        neck = "Bagua Charm +2",
        left_ear = "Loquacious Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = gear.PetRegenCape,
        waist = "Embla Sash"
    }

    sets.afkSet = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2", -- 11% DT
        body = "Azimuth Coat +3", -- 4 Refresh
        hands = "Azimuth Gloves +2", -- 11% DT
        legs = "Nyame Flanchard", -- 8% DT
        feet = "Azimuth Gaiters +2", -- 10% DT
        neck = "Bagua Charm +2", -- Luopan things
        left_ear = "Cessance Earring",
        right_ear = "Brutal Earring",
        left_ring = "Defending Ring", -- 10% DT
        right_ring = "Stikini Ring +1", -- 1 Refresh
        back = gear.PetRegenCape, -- Luopan things
        waist = "Fucho-no-obi", -- 1 Refresh (below 50% MP)
        --[[ 50% DT, 6.5 Refresh ]]--
    }

    -- My pet and I both need to survive
    -- Me: -33DT; 38PDT, 34MDT
    -- Pet: -24DT
    sets.stronkTogetherIdle = {
        main = "Solstice",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2",
        body = "Nyame Mail",
        hands = "Geomancy Mitaines +3",
        legs = "Psycloth Lappas",
        feet = "Nyame Sollerets",
        neck = "Bagua Charm +2",
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Dark Ring",
        back = gear.PetRegenCape,
        waist = "Embla Sash"
    }
    -- I'm realizing now this is basically pointless...
    sets.baseTank = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2",
        body = "Nyame Mail",
        hands = "Azimuth Gloves +2",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Bagua Charm +2",
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Dark Ring",
        back = gear.PetRegenCape,
        waist = "Embla Sash"
    }
    -- Casting sets
    sets.basePrecast = {
        main = "C. Palug Hammer",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Amalric Coif +1",
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        legs = "Geomancy Pants +3",
        feet = "Agwu's Pigaches",
        neck = "Incanter's Torque",
        waist = "Witful Belt",
        left_ear = "Loquac. Earring",
        right_ear = "Malignance Earring",
        left_ring = "Lebeche Ring",
        right_ring = "Kishar Ring",
        back = "Perimede Cape"
    }

    sets.indiMagic = {
        main = "Solstice",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2",
        body = "Azimuth Coat +3",
        hands = "Azimuth Gloves +2",
        legs = "Bagua Pants +3",
        feet = "Azimuth Gaiters +2",
        neck = "Bagua Charm +2",
        waist = "Austerity Belt",
        left_ear = "Loquacious Earring",
        right_ear = "Malignance Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Lifestream Cape"
    }

    sets.fullMAB = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Azimuth Hood +2",
        body = "Azimuth Coat +3",
        hands = "Azimuth Gloves +2",
        legs = "Azimuth Tights +2",
        feet = "Azimuth Gaiters +2",
        neck = "Sibyl Scarf",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Shiva Ring +1",
        back = gear.NukeCape
    }

    sets.fullMACC = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2",
        body = "Azimuth Coat +3",
        hands = "Azimuth Gloves +2",
        legs = "Azimuth Tights +2",
        feet = "Mallquis Clogs +2",
        neck = "Incanter's Torque",
        waist = "Austerity Belt",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = gear.NukeCape
    }

    sets.cureMagic = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Welkin Crown",
        body = "Azimuth Coat +3",
        hands = "Regal CUffs",
        legs = "Azimuth Tights +2",
        feet = "Medium's Sabots",
        neck = "Incanter's Torque",
        waist = "Austerity Belt",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Lebeche Ring",
        right_ring = "Stikini Ring +1",
        back = "Aurist's Cape"
    }

    sets.enhancingMagic = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Befouled Crown",
        body = {
            name = "Telchine Chas.",
            augments = {'Pet: "Regen"+3', 'MND+2'}
        },
        hands = "Azimuth Gloves +2",
        legs = "Azimuth Tights +2",
        feet = "Geomancy Sandals +3",
        neck = "Incanter's Torque",
        waist = "Embla Sash",
        left_ear = "Regal Earring",
        right_ear = "Andoaa Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Fi Follet Cape"
    }
    sets.drainAspir = set_combine(sets.fullMACC, {
        main = "Rubicundity",
        neck = "Erra Pendant",
        head = "Pixie Hairpin +1",
        hands = "Azimuth Gloves +2",
        legs = "Azimuth Tights +2",
        feet = "Agwu's Pigaches",
        left_ear = "Regal Earring",
        left_ring = "Excelsis Ring",
        waist = "Fucho-no-obi",
        back = gear.NukeCape
    })
    sets.magicBursting = set_combine(sets.fullMAB, {}) -- todo
    sets.obi = {
        waist = "Hachirin-no-obi"
    }
    -- Precasts for FastCast
    sets.precast.FC = set_combine(sets.basePrecast, {})
    sets.precast.FC['Geomancy'] = set_combine(sets.indiMagic, {})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.basePrecast, {
        head = "Mallquis Chapeau +2",
        body = "Mallquis Saio +2",
        hands = "Bagua Mitaines +3",
        legs = "Mallquis Trews +2",
        feet = "Mallquis Clogs +2",
        right_ring = "Mallquis Ring"
    })
    sets.precast.FC['Dispelga'] = set_combine(sets.basePrecast, {
        main = "Daybreak"
    })
    sets.precast.FC['Stoneskin'] = set_combine(sets.basePrecast, {
        head = "Umuthi Hat",
        waist = "Siegel Sash",
        hands = "Carapacho Cuffs",
        legs = "Querkening Brais"
    })

    sets.midcast['Geomancy'] = set_combine(sets.indiMagic, {})
    sets.midcast['Refresh'] = set_combine(sets.fullMACC, {
        head = "Amalric Coif +1",
        waist = "Gishdubar Sash",
        feet = "Inspirited Boots"
    })
    sets.midcast['Cure'] = set_combine(sets.cureMagic, {})
    sets.midcast['Elemental Magic'] = set_combine(sets.fullMAB, {})
    sets.midcast['Enfeebling Magic'] = set_combine(sets.fullMACC, {
        hands = "Regal Cuffs",
        right_ring = "Kishar Ring",
        back = "Aurist's Cape"
    })
    sets.midcast['Enhancing Magic'] = set_combine(sets.enhancingMagic, {})
    sets.midcast['Stoneskin'] = set_combine(sets.enhancingMagic, {
        waist = "Siegel Sash"
    })
    sets.midcast['Aquaveil'] = set_combine(sets.enhancingMagic, {
        hands = "Regal Cuffs"
    })
    sets.midcast['Dispelga'] = set_combine(sets.fullMACC, {
        main = "Daybreak"
    })

    sets.midcast['Regen'] = set_combine(baseMagic, {
        main = "Bolelabunga"
    })

    sets.midcast['Drain'] = sets.drainAspir
    sets.midcast['Aspir'] = sets.drainAspir

    sets.precast.WS['Hexa Strike'] = {
        head="Bagua Galero +3",
        body="Azimuth Coat +3", -- 29 STR / 43 MND
        hands="Jhakri Cuffs +2",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        ear1="Ishvara Earring",
        ear2="Moonshade Earring",
        ring1="Apate Ring",
        ring2="Rufescent Ring",
        back="Rancorous Mantle",
        waist="Fotia Belt",
    }

    -- GEO Job Ability enhancements
    sets.midcast['Bolster'] = {
        body = "Bagua Tunic +3"
    }
    sets.midcast['Radial Arcane'] = {
        feet = "Bagua Sandals +2"
    }
    sets.midcast['Life Cycle'] = {
        body = "Geomancy Tunic +3"
    }
    sets.midcast['Full Circle'] = {
        head = "Azimuth Hood +2"
    }

    sets.moveSpeed = {
        feet = "Geomancy Sandals +3"
    }
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
    gearMode = {
        ["index"] = 0,
        [0] = {
            name = "Normal",
            idle = (sets.baseIdle),
            engaged = (sets.baseMelee),
            pet = {
                idle = (sets.baseIdle),
                engaged = (sets.baseMelee)
            }
        },
        [1] = {
            name = "Stronk",
            idle = (sets.stronkIdle),
            engaged = (sets.baseTank),
            pet = {
                idle = (sets.stronkIdle),
                engaged = (sets.baseMelee)
            }
        },
        [2] = {
            name = "PetStronk",
            idle = (sets.baseIdle),
            engaged = (sets.baseTank),
            pet = {
                idle = (sets.petStronkIdle),
                engaged = (sets.baseTank)
            }
        },
        [3] = {
            name = "TogetherStronk",
            idle = (sets.stronkTogetherIdle),
            engaged = (sets.baseTank),
            pet = {
                idle = (sets.stronkTogetherIdle),
                engaged = (sets.baseTank)
            }
        },
        [4] = {
            name = "AfkParty",
            idle = (sets.afkSet),
            engaged = (sets.afkSet),
            pet = {
                idle = (sets.afkSet),
                engaged = (sets.afkSet)
            }
        }
    }

    -- Not sure yet if I'll ever need this on GEO; leaving to remind myself to think about it
    weaponMode = {
        ["index"] = 0,
        [0] = {
            name = "Free",
            set = {}
        }
    }

    -- Setup autoBuff
    auto = {
        ["buff"] = {
            ["index"] = 0,
            [0] = "Off",
            [1] = "On"
        },
        ["fite"] = {
            ["index"] = 0,
            [0] = "Off",
            [1] = "On"
        },
        ["coop"] = {
            ["index"] = 0,
            [0] = "Off",
            [1] = "On"
        }
    }

    eleMode = {
        ["index"] = 0,
        [0] = {ele="Fire", st="/fire", helix="/pyrohelix2", weather="/firestorm2", aga="/fira3", msg="Ele Mode: Fire (Burst: Liquefaction, Fusion, Light, Radiance)", color="\\cs(250,128,114)"}, -- salmon
        [1] = {ele="Earth", st="/stone", helix="/geohelix2", weather="/sandstorm2", aga="/stonera3", msg="Ele Mode: Earth (Burst: Scission, Gravitation, Darkness, Umbra)", color="\\cs(218,165,32)"}, -- goldenrod    
        [2] = {ele="Water", st="/water", helix="/hydrohelix2", weather="/rainstorm2", aga="/watera3", msg="Ele Mode: Water (Burst: Reverberation, Distortion, Darkness, Umbra)", color="\\cs(0,191,255)"}, -- deepskyblue
        [3] = {ele="Wind", st="/aero", helix="/anemohelix2", weather="/windstorm2", aga="/aera3", msg="Ele Mode: Wind (Burst: Detonation, Fragmentation, Light, Radiance)", color="\\cs(50,205,50)"}, -- lime 
        [4] = {ele="Ice", st="/blizzard", helix="/cryohelix2", weather="/hailstorm2", aga="/blizzara3", msg="Ele Mode: Ice (Burst: Induration, Distortion, Darkness, Umbra)", color="\\cs(224,255,255)"}, -- lightcyan 
        [5] = {ele="Thunder", st="/thunder", helix="/ionohelix2", weather="/thunderstorm2", aga="/thundara3", msg="Ele Mode: Thunder (Burst: Impaction, Fragmentation, Light, Radiance)", color="\\cs(238,130,238)"}, -- violet
        [6] = {ele="Light", st="", helix="/luminohelix2", weather="/aurorastorm2", msg="Ele Mode: Light (Burst: Light, Radiance)", color="\\cs(255,255,240)"}, -- ivory  
        [7] = {ele="Dark", st="", helix="/noctohelix2", weather="/voidstorm2", msg="Ele Mode: Dark (Burst: Darkness, Umbra)", color="\\cs(148,0,211)"}, -- darkviolet         
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
    magicMaps.Interrupt = S{'Aquaveil'}
    spellSteps = {
		['Stone'] = {[0]='Stone V', [1]='Stone IV', [2]='Stone III', [3]='Stone II', [4]='Stone'},
        ['Stonera'] = {[0]='Stonera III', [1]='Stonera II', [2]='Stonera'},
		['Water'] = {[0]='Water V', [1]='Water IV', [2]='Water III', [3]='Water II', [4]='Water'},
        ['Watera'] = {[0]='Watera III', [1]='Watera II', [2]='Watera'},
		['Aero'] = {[0]='Aero V', [1]='Aero IV', [2]='Aero III', [3]='Aero II', [4]='Aero'},
        ['Aera'] = {[0]='Aera III', [1]='Aera II', [2]='Aera'},
		['Fire'] = {[0]='Fire V', [1]='Fire IV', [2]='Fire III', [3]='Fire II', [4]='Fire'},
        ['Fira'] = {[0]='Fira III', [1]='Fira II', [2]='Fira'},
		['Blizzard'] = {[0]='Blizzard V', [1]='Blizzard IV', [2]='Blizzard III', [3]='Blizzard II', [4]='Blizzard'},
        ['Blizzara'] = {[0]='Blizzara III', [1]='Blizzara II', [2]='Blizzara'},
		['Thunder'] = {[0]='Thunder V', [1]='Thunder IV', [2]='Thunder III', [3]='Thunder II', [4]='Thunder'},
        ['Thundara'] = {[0]='Thundara III', [1]='Thundara II', [2]='Thundara'},
		['Aspir'] = {[0]='Aspir III', [1]='Aspir II', [2]='Aspir'},
		['Sleep'] = {[0]='Sleep II', [1]='Sleep'},
		['Cure'] = {[0]='Cure IV', [1]='Cure III', [2]='Cure II', [3]='Cure'}
	}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
    -- Set default macro book / page
    if player.sub_job == 'RDM' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'WHM' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'SCH' then
        set_macro_page(3, 2)
    end
    windower.send_command:schedule(4, 'input /lockstyleset 182')

    send_command('bind @c gs c cycleCOOP')
    send_command('bind @q gs c cycleEle')	
end

function extendedUserUnload()
    send_command('unbind @c')
    send_command('unbind @q')
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobMidcast(spell, action, spellMap, eventArgs)
    if magicMaps.Interrupt:contains(spell.english) then
        equip(sets.interrupt)
    end

    if spell.element == 'Dark' then
        equip {
            head = "Pixie Hairpin +1"
        }
    end

    if dayWeatherIntensity(spell.element) > 0 then
        equip({
            waist = "Hachirin-no-Obi"
        })
    else
        equip({
            waist = "Salire Belt"
        })
    end
end

function extendedJobSelfCommand(cmdParams, eventArgs)	
    if cmdParams[1] == 'cycleEle' then
        eleMode.index = eleMode.index + 1
        if eleMode.index > #eleMode then
            eleMode.index = 0
        end
        windower.add_to_chat(122,'['..eleMode[eleMode.index].msg..']')
    elseif cmdParams[1] == 'cycleCOOP' then
        auto.coop.index = auto.coop.index + 1
        if auto.coop.index > #auto.coop then
            auto.coop.index = 0
        end
        windower.add_to_chat(013,'[Co-op: '..auto.coop[auto.coop.index]..']')
    end

    --[[ Use SCH-specific ele-based spells ]]--
    -- Add macro with /console gs c useXYZ
    if cmdParams[1] == 'useEleT1' then
        windower.send_command(eleMode[eleMode.index].st..'1')
    elseif cmdParams[1] == 'useEleT2' then
        windower.send_command(eleMode[eleMode.index].st..'2')
    elseif cmdParams[1] == 'useEleT3' then
        windower.send_command(eleMode[eleMode.index].st..'3')
    elseif cmdParams[1] == 'useEleT4' then
        windower.send_command(eleMode[eleMode.index].st..'4')
    elseif cmdParams[1] == 'useEleT5' then
        windower.send_command(eleMode[eleMode.index].st..'5')
    elseif cmdParams[1] == 'useEleAga' then
        windower.send_command(eleMode[eleMode.index].aga)
    end

    modeHud('update')
end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, gain)
    if buff == "Doom" then
        if gain then
            send_command('input /echo "Doomed, pls halp!')
            equip({
                waist = "Gishdubar Sash",
                left_ring = "Purity Ring"
            })
            disable('ring1', 'waist')
        else
            send_command('input /echo "I am saved! ...or Doom killed me?')
            enable('ring1', 'waist')
            evalState_equipGear()
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job specific generic function extensions
-------------------------------------------------------------------------------------------------------------------
function extendedModeHud(hudText)
    -- job specific location override?
    modeHud_xPos = 550
    modeHud_yPos = 0

    skyblue = '\\cs(135,206,250)'
    red = '\\cs(255,0,0)'
	green = '\\cs(0,255,0)'
    textColorCOOP = red
    if auto.coop[auto.coop.index] == 'On' then
        textColorCOOP = green
    end

    hudText:append(skyblue..'Co-op: '..textColorCOOP..auto.coop[auto.coop.index]..white)
    hudText:append(white..'Ele Mode [Q]: '..eleMode[eleMode.index].color..eleMode[eleMode.index].ele..white)   

    return hudText
end
-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
blazeUp = false
justBolstered = false

mbReady = false
mbTimer = 0
mbSpell1 = "Blizzard V"
mbSpell1cmd = "/blizzard5"
mbSpell1Status = true
mbSpell2 = "Blizzard IV"
mbSpell2Status = false
mbSpell2cmd = "/blizzard4"
dispelNeeded = false

function autoActions()
    local abil_recasts = windower.ffxi.get_ability_recasts()

    local bolsterRecast = abil_recasts[0]
    local entrustRecast = abil_recasts[93]
    local blazeRecast = abil_recasts[247]
    local lifeCycleRecast = abil_recasts[246]
    local eclipticAttritionRecast = abil_recasts[244]
    local mendingHalationRecast = abil_recasts[251]
    local sublimationRecast = abil_recasts[234]
    local convertRecast = abil_recasts[49]

    local me = windower.ffxi.get_player()        

    local autoGeo = "Geo-Malaise"
    local autoIndi = "Indi-Acumen"
    local autoEntrust = "Indi-Focus"
    local autoEntrustTarget = "Walshie"

    if auto.coop[auto.coop.index] == 'On' then
        
        if not buffactive['Addendum: Black'] and player.sub_job == 'SCH' then
            if buffactive['Dark Arts'] then
                send_command('/addendumblack')
                return
            else
                send_command('/darkarts')
                return
            end
        end
        --[[
        if needsDispel == true and not actionInProgress and not onCooldown("Dispel") then
            send_command('/dispel')
            needsDispel = false
            return
        end
        ]]--
        if player.mp < 1200 and windower.ffxi.get_mob_by_target('t') and windower.ffxi.get_mob_by_target('t').name:contains('Crab') and (not onCooldown('Aspir III') or not onCooldown('Aspir II') or not onCooldown('Aspir')) then
            send_command('/aspir3')
            return
        end
    end

    -- Adjust enaged/idle sets based on pet status
    if pet.isvalid and gearMode[gearMode.index].pet and sets.idle ~= gearMode[gearMode.index].pet.idle then
        sets.idle = gearMode[gearMode.index].pet.idle
        sets.engaged = gearMode[gearMode.index].pet.engaged
        evalState_equipGear()
    end
    if not pet.isvalid and gearMode[gearMode.index].pet and sets.idle ~= gearMode[gearMode.index].idle then
        sets.idle = gearMode[gearMode.index].idle
        sets.engaged = gearMode[gearMode.index].engaged
        evalState_equipGear()
    end

    -- If we need to be pulling, do it and avoid all this code
    if auto.fite[auto.fite.index] == 'On' and not me.status == 1 then
        return
    end

    if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then

        local enemy = windower.ffxi.get_mob_by_target('t')
        if player.sub_job == 'RDM' and convertRecast == 0 and player.mpp < 25 and enemy.hpp < 98 then
            if not buffactive['Stoneskin'] then
                send_command('input /stoneskin')
            else
                send_command('input /convert')
            end
            return
        end

        if not buffactive['Colure Active'] then
            send_command('input /ma "'..autoIndi..'" <me>')
            return
        end

        if entrustRecast == 0 and not buffactive['Entrust'] then
            send_command('input /ja "Entrust" <me>')
            return
        end
        if buffactive['Entrust'] then
            send_command('input /ma "'..autoEntrust..'" '..autoEntrustTarget)
            return
        end

        if bolsterRecast == 0 and not buffactive['Bolster'] then
            send_command('input /ja Bolster <me>')
            justBolstered = true
            return
        end
        if buffactive['Bolster'] and pet.isvalid and justBolstered == true then
            if mendingHalationRecast == 0 then
                send_command('input /ja "Mending Halation" <me>')
            else
                send_command('input /ja "Full Circle" <me>')
            end
            justBolstered = false
            return
        end
        if buffactive['Bolster'] and not pet.isvalid then
            send_command('input /ma "'..autoGeo..'" <bt>')
            return
        end

        if pet.isvalid and not buffactive['Bolster'] and blazeRecast == 0 and eclipticAttritionRecast == 0 then
            if mendingHalationRecast == 0 then
                send_command('input /ja "Mending Halation" <me>')
            else
                send_command('input /ja "Full Circle" <me>')
            end
            return
        end
        if not pet.isvalid and not buffactive['Bolster'] and blazeRecast == 0 and eclipticAttritionRecast == 0 then
           send_command('input /ja "Blaze of Glory" <me>')
           return
        end
        if buffactive['Blaze of Glory'] then
            send_command('input /ma "'..autoGeo..'" <bt>')
            blazeUp = true
            return
        end
        if blazeUp == true then
            send_command('input /ja "Ecliptic Attrition" <me>')
            blazeUp = false
            return
        end

        if not pet.isvalid and bolsterRecast ~= 0 then
            send_command('input /ma "'..autoGeo..'" <bt>')
            return
        end

        if pet.isvalid and (lifeCycleRecast == 0 or buffactive['Bolster']) and pet.hpp < 40 then
            send_command('input /ja "Life Cycle" <me>')
            return
        end
--[[
        if player.sub_job == 'SCH' then
            if not buffactive['Addendum: White'] then
                if buffactive['Light Arts'] then
                    send_command('/addendumwhite')
                    add_to_chat(122, '[Addendum: White]')
                    return
                else
                    send_command('/lightarts')
                    add_to_chat(122, '[Light Arts]')
                    return
                end
            end
        end
]]--
        if player.sub_job == 'SCH' then
            -- if sublimation not active and not on cooldown - use it.
            if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and
                sublimationRecast == 0 then
                send_command('input /ja "Sublimation" <me>')
                return
            end
            -- if sublimation done charging and MP below 20% pop it for freeeeeee mp
            if buffactive['sublimation: complete'] and player.mpp < 20 and sublimationRecast == 0 then
                add_to_chat(122, '-- MP below 20% - Popping Sublimation! --')
                send_command('input /ja "Sublimation" <me>')
                return
            end
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

        local target = windower.ffxi.get_mob_by_target('t') or nil
        --if category == 7 and param == 24931 and target and target.Id and target.Id == actor.Id then -- 24931: initiation
        if category == 7 and param == 24931 and target and target.id == act.actor_id then
            local spellName = res.monster_abilities[act.targets[1].actions[1].param].en
            add_to_chat(013, '~ Mob Ability Used ('..spellName..') ~')
            if spellName == "Bubble Curtain" or spellName == "Scissor Guard" then
                needsDispel = true
            end
        end
    end
end)