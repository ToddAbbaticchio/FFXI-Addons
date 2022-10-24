include('sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    init_modetables()
end

function init_gear_sets()
    gear.WSSTRCape = {
        name = "Andartia's Mantle",
        augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
    }
    gear.WSDEXWSdamageCape = {
        name = "Andartia's Mantle",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%'}
    }
    gear.WSDEXDoubleAttackCape = {
        name = "Andartia's Mantle",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', '"Dbl.Atk."+10'}
    }
    gear.MeleeDEXCape = {
        name = "Andartia's Mantle",
        augments = {'"Store TP" +10'}
    }
    gear.meleeHercBoots = {
        name = "Herculean Boots",
        augments = {'Quadruple Attack +2'}
    }
    gear.treasureHunterHercBoots = {
        name = "Herculean Boots",
        augments = {'Treasure Hunter +1'}
    }
    gear.hercHybridVest = {
        name = "Herculean Vest",
        augments = {'Mag. Acc.+3', 'Weapon skill damage +5%', '"Mag.Atk.Bns."+11'}
    }

    sets.baseMelee = {
        ammo = "Date Shuriken",
        head = "Ryuo Somen +1",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = "Malignance Boots",
        neck = "Ninja Nodowa +2",
        waist = "Sailfi Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = gear.MeleeDEXCape
    }
    -- sets.baseMelee = {
    -- 	ammo="Date Shuriken",
    -- 	head="Hattori Zukin +2",
    -- 	body="Adhemar Jacket +1",
    -- 	hands="Adhemar Wristbands +1",
    -- 	legs="Samnuha Tights",
    -- 	feet="Malignance Boots",
    -- 	neck="Ninja Nodowa +2",
    -- 	waist="Patentia sash",
    -- 	left_ear="Eabani Earring",
    -- 	right_ear="Suppanomimi",
    -- 	left_ring="Gere Ring",
    -- 	right_ring="Epona's Ring",
    -- 	back=gear.MeleeDEXCape
    -- }
    sets.baseWS = {
        ammo = "Coiste Bodhar",
        head = "Mpaca's Cap",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Hiza. Hizayoroi +2",
        feet = "Hattori Kyahan +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Brutal Earring",
        right_ear = "Lugra Earring +1",
        left_ring = "Gere Ring",
        right_ring = "Apate Ring",
        back = gear.WSSTRCape
    }
    sets.baseIdle = {
        head = "Hattori Zukin +2",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Hattori Hakama +2",
        neck = "Bathy Choker +1",
        waist = "Engraved Belt",
        left_ear = "Lugra Earring +1",
        right_ear = "Hades Earring +1",
        left_ring = "Dark Ring",
        right_ring = "Defending Ring",
        back = gear.MeleeDEXCape
    }
    sets.baseMagic = {
        head = "Hachiya Hatsuburi +1",
        body = "Mochizuki Chainmail +1",
        hands = "Mochizuki Tekko +1",
        neck = "Incanter's Torque",
        waist = "Sailfi Belt +1",
        left_ear = "Etiolation Earring",
        right_ear = "Loquacious Earring",
        left_ring = "Lebeche Ring",
        right_ring = "Stikini Ring"
    }
    sets.baseTank = set_combine(sets.baseMelee, {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Loricate Torque",
        left_ear = "Eabani Earring",
        left_ring = "Defending Ring"
    })
    sets.treasureHunter = {
        head = 'Wh. Rarab Cap +1',
        waist = "Chaac Belt",
        ammo = "Perfect Lucky Egg",
        feet = gear.treasureHunterHercBoots
    }
    sets.meleeAccuracy = {
        ammo = "Date Shuriken",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Ninja Nodowa +2",
        waist = "Kentarch Belt",
        left_ear = "Dudgeon Earring",
        right_ear = "Heartseeker Earring",
        left_ring = "Sniper's Ring +1",
        right_ring = "Toreador's Ring",
        back = gear.MeleeDEXCape
    }

    sets.hybridWS = {
        ammo = "Seeth. Bomblet +1",
        head = "Mochizuki Hatsuburi +3",
        neck = "Fotia Gorget",
        left_ear = "Moonshade Earring",
        right_ear = "Lugra Earring +1",
        body = sets.hercHybridVest,
        hands = "Nyame Gauntlets", -- Herc hands
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = gear.WSSTRCape,
        waist = "Fotia Belt",
        legs = "Nyame Flanchard", -- Mochizuki Hakama +3
        feet = "Hattori Kyahan +2"
    }

    sets.moveSpeed = {}
    sets.DayMovement = {
        feet = "Danzo sune-ate"
    }
    sets.NightMovement = {
        feet = "Hachiya Kyahan +1"
    }

    sets.naked = {
        head = empty,
        body = empty,
        hands = empty,
        legs = empty,
        feet = empty,
        neck = empty,
        waist = empty,
        ear1 = empty,
        ear2 = empty,
        ring1 = empty,
        ring2 = empty,
        back = empty
    }
    sets.precast.JA['Provoke'] = sets.treasureHunter

    sets.precast.Waltz = {
        head = "Mummu Bonnet +2",
        body = "Mummu Jacket +2",
        hands = "Mummu Wrists +2",
        legs = "Mummu  Kecks +2",
        feet = "Mummu Gamashes +2",
        left_ring = "Mummu Ring",
        right_ring = "Omega Ring"
    }
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast
    sets.precast.FC['Ninjutsu'] = set_combine(sets.baseMagic, {})
    sets.precast.FC['Utsusemi'] = {
        head = "Mummu bonnet +2",
        hands = "Mochizuki Tekko +1",
        left_ring = "Lebeche ring",
        right_ring = "Stikini ring +1",
        neck = "Magoraga Beads",
        left_ear = "Loquac. Earring",
        right_ear = "Etiolation earring",
        body = "Mochizuki Chainmail +1",
        legs = "Mummu kecks +2",
        waist = "Sailfi belt +1",
        feet = "Hattori Kyahan +2",
        back = "Andartia Mantle"
    }
    -- Midcast Sets
    sets.midcast['Ninjutsu'] = {
        head = "Hachiya Hatsuburi +1",
        body = "Nyame Mail",
        hands = "Mochizuki Tekko +1",
        legs = "Nyame Flanchard",
        feet = "Mochizuki Kyahan",
        neck = "Incanter's Torque",
        left_ring = "Stikini Ring +1",
        right_ear = "Stikini Ring +1"
    }
    -- DT gear and utsusemi +2
    sets.midcast['Utsusemi'] = {
        head = "Nyame Helm",
        neck = "Loricate Torque",
        body = "Nyame Mail",
        hands = "Mochizuki Tekko +1",
        legs = "Nyame Flanchard",
        feet = "Hattori Kyahan +2",
        left_ring = "Defending ring",
        back = gear.MeleeDEXCape
    }

    -- Weaponskill sets
    sets.precast.WS = set_combine(sets.baseWS, {})
    sets.precast.WS['Blade: Ku'] = set_combine(sets.baseWS, {
        ear1 = "Lugra Earring +1",
        ear2 = "Ishvara Earring"

    })
    sets.precast.WS['Blade: Hi'] = set_combine(sets.baseWS, {
        head = "Malignance Chapeau",
        feet = "Malignance Boots",
        right_ear = "Suppanomimi"
    })
    sets.precast.WS['Blade: Shun'] = set_combine(sets.baseWS, {
        ammo = "Cath Palug Stone",
        body = "Adhemar Jacket +1",
        legs = "Samnuha Tights",
        left_ear = "Moonshade Earring",
        right_ring = "Epona's Ring",
        back = gear.WSDEXDoubleAttackCape
    })
    sets.precast.WS['Blade: Chi'] = sets.hybridWS
    sets.precast.WS['Blade: To'] = sets.hybridWS
    sets.precast['Blade: Teki'] = sets.hybridWS
    sets.precast['Tachi: Jinpu'] = sets.hybridWS
    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS, {})
    sets.precast.WS['Exenterator'] = set_combine(sets.baseWS, {})
    sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS, {
        ammo = "Seeth. Bomblet +1",
        body = "Adhemar Jacket +1",
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        back = gear.WSSTRCape
    })
end

function init_modetables()
    -- Setup gearMode
    gearMode = {
        ["index"] = 0,
        [0] = {
            name = "DPS",
            idle = sets.baseIdle,
            engaged = (sets.baseMelee)
        },
        [1] = {
            name = "Accuracy",
            idle = sets.baseIdle,
            engaged = (sets.meleeAccuracy)
        }
        -- [1] = {name="Treasure Hunter", idle=sets.baseIdle, engaged=(sets.treasureHunter)},
        -- [2] = {name="IWannaLive", idle=sets.baseIdle, engaged=(sets.baseTank)},
        -- [3] = {name="AfkExp", idle=sets.baseIdle, engaged=(sets.baseAFk)}
    }

    -- Setup weaponMode
    weaponMode = {
        ["index"] = 0,
        [0] = {
            name = "Shun",
            set = {
                main = "Heishi Shorinken",
                sub = "Kunimitsu"
            }
        },
        [1] = {
            name = "Ku",
            set = {
                main = "Gokotai",
                sub = "Kunimitsu"
            }
        },
        [2] = {
            name = "Savage",
            set = {
                main = "Naegling",
                sub = "Hitaki"
            }
        },
        [3] = {
            name = "Daggers",
            set = {
                main = "Tauret",
                sub = "Gleti's Knife"
            }
        },
        [4] = {
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

function extendedUserSetup()
    set_macro_page(1, 1)
    windower.send_command:schedule(4, 'input /lockstyleset 10')
end

function job_buff_change(buff, active)
    if buff == "Doom" then
        if active then
            -- send_command('input /p "Doomed, pls halp!')
            equip({
                waist = "Gishdubar Sash",
                ring1 = "Purity Ring"
            })
            disable('ring1', 'waist')
        else
            -- send_command('input /p "I am saved! ...or Doom killed me?')
            enable('ring1', 'waist')
            evalState_equipGear()
        end
    end
end

function extendedModeHud(hudText)
    modeHud_xPos = 550
    modeHud_yPos = 0
    return hudText
end

function autoActions()
    -- auto equip selected weapon set
    if weaponMode[weaponMode.index].name ~= "Free" and
        (player.equipment.main == "empty" or player.equipment.sub == "empty") then
        send_command('input //gs equip sets.weapons')
    end

    if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
        if not buffactive['Food'] then
            send_command('input /item "Grape Daifuku" <me>')
            return
        end
    end
end