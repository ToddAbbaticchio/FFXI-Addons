-- Original: Motenten / Modified: Arislan

-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------

--  Modes:      [ F9 ]              Cycle Offense Mode
--              [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ CTRL+F11 ]        Cycle Casting Modes
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ WIN+R ]           Toggle Regen Mode
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Abilities:  [ CTRL+` ]          Afflatus Solace
--              [ ALT+` ]           Afflatus Misery
--              [ CTRL+[ ]          Divine Seal
--              [ CTRL+] ]          Divine Caress
--              [ CTRL+` ]          Composure
--              [ CTRL+- ]          Light Arts/Addendum: White
--              [ CTRL+= ]          Dark Arts/Addendum: Black
--              [ CTRL+; ]          Celerity/Alacrity
--              [ ALT+[ ]           Accesion/Manifestation
--              [ ALT+; ]           Penury/Parsimony
--
--  Spells:     [ ALT+O ]           Regen IV
--
--  Weapons:    [ CTRL+W ]          Toggles Weapon Lock
--
--  WS:         [ CTRL+Numpad7 ]    Black Halo
--              [ CTRL+Numpad8 ]    Hexa Strike
--              [ CTRL+Numpad9 ]    Realmrazer
--              [ CTRL+Numpad1 ]    Flash Nova
--              [ CTRL+Numpad0 ]    Mystic Boon
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--              Addendum Commands:
--              Shorthand versions for each strategem type that uses the version appropriate for
--              the current Arts.
--                                          Light Arts                    Dark Arts
--                                          ----------                  ---------
--              gs c scholar light          Light Arts/Addendum
--              gs c scholar dark                                       Dark Arts/Addendum
--              gs c scholar cost           Penury                      Parsimony
--              gs c scholar speed          Celerity                    Alacrity
--              gs c scholar aoe            Accession                   Manifestation
--              gs c scholar addendum       Addendum: White             Addendum: Black


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false

    state.RegenMode = M{['description']='Regen Mode', 'Duration', 'Potency'}

    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}

    lockstyleset = 5
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'MEva')

    state.BarElement = M{['description']='BarElement', 'Barfira', 'Barblizzara', 'Baraera', 'Barstonra', 'Barthundra', 'Barwatera'}
    state.BarStatus = M{['description']='BarStatus', 'Baramnesra', 'Barvira', 'Barparalyzra', 'Barsilencera', 'Barpetra', 'Barpoisonra', 'Barblindra', 'Barsleepra'}
    state.BoostSpell = M{['description']='BoostSpell', 'Boost-STR', 'Boost-INT', 'Boost-AGI', 'Boost-VIT', 'Boost-DEX', 'Boost-MND', 'Boost-CHR'}

    state.WeaponLock = M(false, 'Weapon Lock')

    -- Additional local binds
    send_command('bind ^` input /ja "Afflatus Solace" <me>')
    send_command('bind !` input /ja "Afflatus Misery" <me>')
    send_command('bind ^- gs c scholar light')
    send_command('bind ^= gs c scholar dark')
    send_command('bind !- gs c scholar addendum')
    send_command('bind != gs c scholar addendum')
    send_command('bind ^; gs c scholar speed')
    send_command('bind ![ gs c scholar aoe')
    send_command('bind !; gs c scholar cost')
    send_command('bind ^insert gs c cycleback BoostSpell')
    send_command('bind ^delete gs c cycle BoostSpell')
    send_command('bind ^home gs c cycleback BarElement')
    send_command('bind ^end gs c cycle BarElement')
    send_command('bind ^pageup gs c cycleback BarStatus')
    send_command('bind ^pagedown gs c cycle BarStatus')
    send_command('bind ^[ input /ja "Divine Seal" <me>')
    send_command('bind ^] input /ja "Divine Caress" <me>')
    send_command('bind !o input /ma "Regen IV" <stpc>')
    send_command('bind @r gs c cycle RegenMode')
    send_command('bind @w gs c toggle WeaponLock')

    send_command('bind ^numpad7 input /ws "Black Halo" <t>')
    send_command('bind ^numpad8 input /ws "Hexa Strike" <t>')
    send_command('bind ^numpad5 input /ws "Realmrazer" <t>')
    send_command('bind ^numpad1 input /ws "Flash Nova" <t>')
    send_command('bind ^numpad0 input /ws "Mystic Boon" <t>')

    select_default_macro_book()
    set_lockstyle()

    state.Auto_Kite = M(false, 'Auto_Kite')
    DW = false
    moving = false
    update_combat_form()
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^-')
    send_command('unbind ^=')
    send_command('unbind !-')
    send_command('unbind !=')
    send_command('unbind ^;')
    send_command('unbind ![')
    send_command('unbind !;')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind ^home')
    send_command('unbind ^end')
    send_command('unbind ^pageup')
    send_command('unbind ^pagedown')
    send_command('unbind ^[')
    send_command('unbind ^]')
    send_command('unbind !o')
    send_command('unbind @r')
    send_command('unbind @w')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad8')
    send_command('unbind ^numpad5')
    send_command('unbind ^numpad1')
    send_command('unbind ^numpad0')

    send_command('unbind #`')
    send_command('unbind #1')
    send_command('unbind #2')
    send_command('unbind #3')
    send_command('unbind #4')
    send_command('unbind #5')
    send_command('unbind #6')
    send_command('unbind #7')
    send_command('unbind #8')
    send_command('unbind #9')
    send_command('unbind #0')

    send_command('unbind 1')
    send_command('unbind 2')
    send_command('unbind 3')
    send_command('unbind 4')
    send_command('unbind 5')
    send_command('unbind 6')
end

time_start = 0
windower.raw_register_event('postrender',function()
        if os.time() > time_start then
            time_start = os.time()        
            autoActions()
        end
    end
)

function autoActions()
    -- Sublimation Handling if we're /sch
    if player.sub_job == 'SCH' and buffactive['reraise'] then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        local subRecast = abil_recasts[234]

        -- if sublimation not active and not on cooldown - use it.
        if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and subRecast == 0 then
            send_command('input /ja "Sublimation" <me>')
        end

        -- if sublimation done charging and MP below 40% pop it for freeeeeee mp
        if buffactive['sublimation: complete'] and player.mpp < 40 and subRecast == 0 then
            add_to_chat(122,'-- MP below 40% - Popping Sublimation! --')
        send_command('input /ja "Sublimation" <me>')
        end
    end
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast/Fastcast Sets
    --------------------------------------
    sets.precast.FC = {		
        ammo = "Impatiens",
        neck = "Orison Locket",
        body = "Inyanga Jubbah +2",
		ring2 = "Kishar Ring",
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash",
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        head="Ebers Cap", 
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak"})
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})

    --------------------------------------
    -- Midcast Sets
    --------------------------------------
    sets.midcast.FC = sets.precast.FC

    sets.midcast.ConserveMP = {}

    sets.midcast.Trust = sets.precast.FC

    --------------------------------------
    -- Cure Sets
    --------------------------------------
    sets.midcast.CureSolace = {
        main="Ababinili +1",
        sub="Enki Strap",
        ammo="Clarus Stone", --w/e
        head="Theophany Cap +1",
        neck="Orison Locket", --w/e
        ear1="Communion Earring",
        ear2="Glorious Earring",
        body="Ebers Bliaut",
        hands="Theophany Mitts +1",
        ring1="Solemn Ring",
        ring2="Sirona's Ring",
        back="Orison Cape",
        waist="Cleric's Belt",
        legs="Theophany Pantaloons +1",
        feet="Wayfarer Clogs", --w/e
    }

    sets.midcast.CureSolaceWeather = set_combine(sets.midcast.CureSolace, {
        waist="Hachirin-no-Obi",
        })

    sets.midcast.CureNormal = set_combine(sets.midcast.CureSolace, {})

    sets.midcast.CureWeather = set_combine(sets.midcast.CureNormal, {
        waist="Hachirin-no-Obi",
        })

    sets.midcast.CuragaNormal = set_combine(sets.midcast.CureNormal, {})

    sets.midcast.CuragaWeather = {
        waist="Hachirin-no-Obi",
        }

    sets.midcast.CureMelee = sets.midcast.CureSolace

    --------------------------------------
    -- Status Removal & Job Specific Sets
    --------------------------------------

    sets.midcast.StatusRemoval = {}

    sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {})

    sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {})

    sets.buff['Divine Caress'] = {hands="Ebers Mitts"}
    sets.buff['Devotion'] = {head="Cleric's Cap"}
    sets.buff.Sublimation = {}

    sets.buff.Doom = {}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.CP = {} --back="Mecisto. Mantle"}

    --------------------------------------
    -- Enhancing Sets
    --------------------------------------
    sets.midcast['Enhancing Magic'] = {        
        legs="Cleric's Pantaloons",
        waist="Olympus Sash",
        feet="Theophany Duckbills +1",        
    }

    sets.midcast.EnhancingDuration = {
        feet="Theophany Duckbills +1",
    }

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        body="Cleric's Bliaut",
        hands="Ebers Mitts",
        legs="Theophany Pantaloons +1",
        feet="Theophany Duckbills +1",
    })

    sets.midcast.RegenDuration = set_combine(sets.midcast.EnhancingDuration, {
        body="Cleric's Bliaut",
        hands="Ebers Mitts",
        legs="Theophany Pantaloons +1",
        feet="Theophany Duckbills +1",
    })

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        legs="Doyen Pants",
        waist="Siegel Sash",
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
    })

    sets.midcast.Auspice = set_combine(sets.midcast.EnhancingDuration, {
    })

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
    })

    sets.midcast.BoostStat = set_combine(sets.midcast['Enhancing Magic'], {
    })

    sets.midcast.Protect = set_combine(sets.midcast.ConserveMP, sets.midcast.EnhancingDuration, {
        ring1="Sheltered Ring",
    })

    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect

    --------------------------------------
    -- Resting & Idle Sets
    --------------------------------------
    sets.resting = {
        main="Chatoyant Staff",
        ammo="Clarus Stone",
        head="Theophany Cap +1", --w/e
        ear1="Antivenom Earring",
        body="Theophany Bliaut +2",
        waist="Austerity Belt",
        feet="Goliard Clogs",
    }

    sets.idle = {
        --main="", --w/e
        --sub="", --w/e
        ammo="Homiliary",
        head="Inyanga Tiara +2",
        body="Theo. Bliaut +2",
        hands="Inyanga Dastanas +2",
        legs="Inyanga Shalwar +2",
        feet="Herald's Gaiters",
        neck="Twilight Torque", --meh
        ear1="Eabani Earring",
        ear2="Novia Earring",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Shadow Mantle", --w/e
        waist="Fucho-no-Obi",
    }

    sets.idle.DT = set_combine(sets.idle, {})

    sets.idle.MEva = set_combine(sets.idle.DT, {})

    sets.idle.Town = set_combine(sets.idle, {})

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}

    --------------------------------------
    -- Offensive Spell Sets
    --------------------------------------
    sets.midcast['Divine Magic'] = {
        main="Ababinili +1",
        sub="Enki Strap",
        ammo="Clarus Stone",
        head="Wayfarer circlet",
        neck="Stoicheion Medal",
        ear1="Hecate's Earring",
        ear2="Novio Earring",
        body="Wayfarer Robe",
        hands="Wayfarer Cuffs",
        ring1="Strendu Ring",
        ring2="Balrahn's Ring",
        back="Searing Cape",
        waist="Hachirin-no-obi",
        legs="Theophany Pantaloons +1",
        feet="Wayfarer Clogs",
    }

    sets.midcast.Banish = set_combine(sets.midcast['Divine Magic'], {
    })

    sets.midcast.Holy = sets.midcast.Banish

    sets.midcast['Dark Magic'] = {
    }

    sets.midcast.MndEnfeebles = {
        main="Ababinili +1",
        sub="Enki Strap",
        ammo="Clarus Stone",
        head="Wayfarer circlet",
        neck="Enfeebling Torque",
        ear1="Eabani Earring", --w/e
        ear2="Novia Earring", --w/e
        body="Theophany Bliaut +2",
        hands="Wayfarer Cuffs",
        ring1="Kishar Ring",
        ring2="Balrahn's Ring",
        back="Aslan Cape", --w/e
        waist="Cleric's Belt",
        legs="Wayfarer Slops",
        feet="Theophany Duckbills +1",
    }

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        back="Gleeman's Cape",
        waist="Cognition Belt",
    })

    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {})

    sets.midcast.Impact = {}

    --------------------------------------
    -- Melee Sets
    --------------------------------------
    sets.engaged = {
        main="Daybreak",
        sub="Septoptic",
        ammo="Homiliary",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Clotharius Torque",
        waist="Grunfeld Rope",
        left_ear="Brutal Earring",
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Apate Ring",
        -- back=???  acc/DA cape
    }

    sets.engaged.Acc = set_combine(sets.engaged, {
    })

    sets.engaged.DW = {
        left_ear="Eabani Earring",
        right_ear="Suppanomimi",
    }

    sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {
    })

    sets.engaged.Aftermath = {
    }
    --------------------------------------
    -- Weaponskill Sets
    --------------------------------------
    sets.precast.WS = {
        ammo="Homiliary", -- ???
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Ilabrat Ring",
        -- back=???  acc/DA cape
    }

    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {
        right_ear="Ishvara Earring",
        waist="Cleric's Belt",
        -- back=???  MND WsDmg Acc/Atk
    })

    sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
    if spellMap == 'Banish' or spellMap == "Holy" then
        if (world.weather_element == 'Light' or world.day_element == 'Light') then
            equip(sets.Obi)
        end
    end
    if spell.skill == 'Enhancing Magic' then
        if classes.NoSkillSpells:contains(spell.english) then
            equip(sets.midcast.EnhancingDuration)
            if spellMap == 'Refresh' then
                equip(sets.midcast.Refresh)
            end
        end
        if spellMap == "Regen" and state.RegenMode.value == 'Duration' then
            equip(sets.midcast.RegenDuration)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == "Sleep II" then
            send_command('@timers c "Sleep II ['..spell.target.name..']" 90 down spells/00259.png')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('@timers c "Sleep ['..spell.target.name..']" 60 down spells/00253.png')
        elseif spell.english == "Repose" then
            send_command('@timers c "Repose ['..spell.target.name..']" 90 down spells/00098.png')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff,gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end

    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            --send_command('@input /p Doomed.')
             disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end

end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    update_combat_form()
    check_moving()
end

function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
    update_sublimation()
end

function update_combat_form()
    if DW == true then
        state.CombatForm:set('DW')
    elseif DW == false then
        state.CombatForm:reset()
    end
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
--      if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
--          return "CureMelee"
        if default_spell_map == 'Cure' then
            if buffactive['Afflatus Solace'] then
                if (world.weather_element == 'Light' or world.day_element == 'Light') then
                    return "CureSolaceWeather"
                else
                    return "CureSolace"
              end
            else
                if (world.weather_element == 'Light' or world.day_element == 'Light') then
                    return "CureWeather"
                else
                    return "CureNormal"
              end
            end
        elseif default_spell_map == 'Curaga' then
            if (world.weather_element == 'Light' or world.day_element == 'Light') then
                return "CuragaWeather"
            else
                return "CuragaNormal"
            end
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if buffactive['Aftermath: Lv.3'] and player.equipment.main == "Yagrush" then
        meleeSet = set_combine(meleeSet, sets.engaged.Aftermath)
    end

    return meleeSet
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        idleSet = set_combine(idleSet, sets.buff.Sublimation)
    end
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    -- if state.CP.current == 'on' then
    --     equip(sets.CP)
    --     disable('back')
    -- else
    --     enable('back')
    -- end
    if state.Auto_Kite.value == true then
       idleSet = set_combine(idleSet, sets.Kiting)
    end

    return idleSet
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local c_msg = state.CastingMode.value

    local r_msg = state.RegenMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(060, '| Magic: ' ..string.char(31,001)..c_msg.. string.char(31,002)..  ' |'
        ..string.char(31,060).. ' Regen: ' ..string.char(31,001)..r_msg.. string.char(31,002)..  ' |'
        ..string.char(31,004).. ' Defense: ' ..string.char(31,001)..d_msg.. string.char(31,002)..  ' |'
        ..string.char(31,008).. ' Idle: ' ..string.char(31,001)..i_msg.. string.char(31,002)..  ' |'
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'nuke' then
        handle_nuking(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'barelement' then
        send_command('@input /ma '..state.BarElement.value..' <me>')
    elseif cmdParams[1]:lower() == 'barstatus' then
        send_command('@input /ma '..state.BarStatus.value..' <me>')
    elseif cmdParams[1]:lower() == 'boostspell' then
        send_command('@input /ma '..state.BoostSpell.value..' <me>')
    end

    gearinfo(cmdParams, eventArgs)
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(tonumber(cmdParams[2])) == 'number' then
            if tonumber(cmdParams[2]) ~= DW_needed then
            DW_needed = tonumber(cmdParams[2])
            DW = true
            end
        elseif type(cmdParams[2]) == 'string' then
            if cmdParams[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(cmdParams[3])) == 'number' then
            if tonumber(cmdParams[3]) ~= Haste then
                Haste = tonumber(cmdParams[3])
            end
        end
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end

function check_moving()
    if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

function check_gear()
    if no_swap_gear:contains(player.equipment.left_ring) then
        disable("ring1")
    else
        enable("ring1")
    end
    if no_swap_gear:contains(player.equipment.right_ring) then
        disable("ring2")
    else
        enable("ring2")
    end
end

windower.register_event('zone change',
    function()
        if no_swap_gear:contains(player.equipment.left_ring) then
            enable("ring1")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.right_ring) then
            enable("ring2")
            equip(sets.idle)
        end
    end
)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 4)
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end