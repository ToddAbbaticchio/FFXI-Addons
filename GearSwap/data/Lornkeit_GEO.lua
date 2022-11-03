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
        feet = "Bagua Sandals +1",
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
        hands = "Bagua Mitaines +1",
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
        feet = "Nyame Sollerets", -- -7DT
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
        hands = "Geomancy Mitaines +1",
        legs = "Psycloth Lappas",
        feet = "Bagua Sandals +1",
        neck = "Bagua Charm +2",
        left_ear = "Loquacious Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = gear.PetRegenCape,
        waist = "Embla Sash"
    }

    -- afk parties
    sets.afkSet = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        range = "Dunna",
        head = "Azimuth Hood +2",
        body = "Telchine Chasuble",
        hands = "Bagua Mitaines +1",
        legs = "Lengo Pants",
        feet = "Bagua Sandals +1",
        neck = "Bagua Charm +2",
        left_ear = "Loquacious Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = gear.PetRegenCape,
        waist = "Embla Sash"
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
        hands = "Geomancy Mitaines +1",
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
        legs = "Geo. Pants +1",
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
        legs = "Bagua Pants +1",
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
        feet = "Geo. Sandals +3",
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
        hands = "Bagua Mitaines +1",
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

    -- GEO Job Ability enhancements
    sets.midcast['Bolster'] = {
        body = "Bagua Tunic +1"
    }
    sets.midcast['Radial Arcane'] = {
        feet = "Bagua Sandals +1"
    }
    sets.midcast['Life Cycle'] = {
        body = "Geomancy Tunic +1"
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
    magicMaps.Interrupt = S {'Aquaveil'}
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

    return hudText
end
-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
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

    if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
        if not buffactive['Attack Boost'] then
            send_command('input //hb off')
            send_command:schedule(0.5, 'input /ma "Indi-Fury" <me>')
            send_command:schedule(3.0, 'input //hb on')
            return
        end

        if entrustRecast == 0 then
            send_command('input //hb off')
            send_command:schedule(0.5, 'input /ja "Entrust" <me>')
            send_command:schedule(2.0, 'input /ma "Indi-Precision" Walshie')
            send_command:schedule(5.0, 'input //hb on')
            return
        end

        if bolsterRecast == 0 and not buffactive['Bolster'] then
            send_command('input //hb off')
            send_command:schedule(0.5, 'input /ja Bolster <me>')
            if mendingHalationRecast == 0 then
                send_command:schedule(1.5, 'input /ja "Mending Halation" <me>')
            else
                send_command:schedule(1.5, 'input /ja "Full Circle" <me>')
            end
            send_command:schedule(2.5, 'input /ma "Geo-Frailty" <bt>')
            send_command:schedule(5, 'input //hb on')
            return
        end

        if pet.isvalid and not buffactive['Bolster'] then
            if blazeRecast == 0 and eclipticAttritionRecast == 0 then
                send_command('input //hb off')
                if mendingHalationRecast == 0 then
                    send_command:schedule(0.5, 'input /ja "Mending Halation" <me>')
                else
                    send_command:schedule(0.5, 'input /ja "Full Circle" <me>')
                end
                send_command:schedule(2.5, 'input /ja "Blaze of Glory" <me>')
                send_command:schedule(3.5, 'input /ma "Geo-Frailty" <bt>')
                send_command:schedule(5, 'input /ja "Ecliptic Attrition" <me>')
                send_command:schedule(7.0, 'input //hb on')
                return
            end
        end

        if not pet.isvalid and bolsterRecast ~= 0 then
            if not buffactive['Bolster'] and blazeRecast == 0 and eclipticAttritionRecast == 0 then
                send_command('input //hb off')
                send_command:schedule(2.5, 'input /ja "Blaze of Glory" <me>')
                send_command:schedule(3.5, 'input /ma "Geo-Frailty" <bt>')
                send_command:schedule(5, 'input /ja "Ecliptic Attrition" <me>')
                send_command:schedule(7.0, 'input //hb on')
            else
                send_command('input //hb off')
                send_command:schedule(1.5, 'input /ma "Geo-Frailty" <bt>')
                send_command:schedule(2.5, 'input //hb on')
            end
        end

        if pet.isvalid and (lifeCycleRecast < 1 or buffactive['Bolster']) and pet.hpp < 40 then
            send_command('input /ja "Life Cycle" <me>')
            return
        end

        if player.sub_job == 'RDM' and convertRecast == 0 and player.mpp < 10 then
            send_command:schedule(0.5, 'input /ma "Stoneskin" <me>')
            send_command:schedule(4.5, 'input /ja "Convert" <me>')
            return
        end

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
            --[[
            if not buffactive['Regen'] then
                if get_current_strategem_count() > 1 then
                    send_command('/accession')
                    send_command:schedule(1, '/regen2')
                    add_to_chat(122, '[Regen-ga]')
                    return
                end
            end]] --
        end

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
