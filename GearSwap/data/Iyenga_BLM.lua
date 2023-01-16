-------------------------------------------------------------------------------------------------------------------
-- Imports / Setup
-------------------------------------------------------------------------------------------------------------------
include('RST\\sharedFunctions.lua')
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and gear vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()

    --[[ Precast Sets ]]--
	sets.precast.FC = {
        --ammo="",
        head="Amalric Coif +1",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +2','INT+7','Mag. Acc.+4','"Mag.Atk.Bns."+11',}},
        hands="Agwu's Gages",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Agwu's Pigaches",
        neck="Baetyl Pendant",
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear="Loquacious Earring",
        left_ring="Kishar Ring",
        --right_ring="",
        back={ name="Taranus's Cape", augments={'"Fast Cast"+10','Damage taken-5%',}}}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.JA['Manafont'] = {body="Arch. coat +2"}
    
    sets.precast.JA['Mana Wall'] ={feet="Wicce Sabots +3", 
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}}


    --[[ Midcst Sets ]]--
    sets.freeNuke = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Arch. Petasos +3", augments={'Increases Ancient Magic damage and magic burst damage',}},
        body="Wicce coat +3",
        hands={ name="Arch. Gloves +3", augments={'Increases Elemental Magic accuracy',}},
        legs={ name="Arch. Tonban +3", augments={'Increases Elemental Magic debuff time and potency',}},
        feet={ name="Arch. Sabots +3", augments={'Increases Aspir absorption amount',}},
        neck="Sorcerer's stole +2",
        waist="Acuity belt +1",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.mbNuke = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Ea Hat +1",
        body="Ea Houppe. +1",
        hands="Amalric gages +1",
        legs="Ea Slops +1",
        feet="Archmage's sabots +3",
        neck="Sorcerer's stole +2",
        waist="Acuity belt +1",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Mujin Band",
        right_ring="Freke Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.midcast['Enfeebling Magic'] = {
        ammo="Ombre Tathlum +1",
        head="Befouled Crown",
        body="Spaekona's Coat +3",
        hands="Wicce Gloves +2",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Wicce Sabots +3",
        neck="Incanter's Torque",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Vor Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }

    sets.midcast['Dark Magic'] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie Hairpin +1",
        hands={ name="Arch. Gloves +3", augments={'Increases Elemental Magic accuracy',}},
        legs="Spae. Tonban +2",
        feet="Wicce Sabots +3",
        neck="Erra Pendant",
        waist="Fucho-no-Obi",
        left_ear="Malignance Earring",
        right_ear="Barkaro. Earring",
        left_ring="Archon ring",
        right_ring="Evanescence Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
    }
    
    sets.midcast['Enhancing Magic'] = {
        --main='',
        --sub="Ammurapi Shield",
        head="Befouled Crown",
        neck="Incanter's Torque",
        waist="Embla Sash",
        left_ear="Mimir Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
    }

    sets.midcast['Healing Magic'] = {
        head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        legs="Gyve Trousers",
        feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
        left_ear="Mendi. Earring",
    }

    --[[ Idle Sets ]]--
    sets.baseIdle = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Wicce Petasos +2",
        body="Wicce Coat +3",
        hands="Wicce Gloves +2",
        legs="Nyame Flanchard",
        feet="Wicce Sabots +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Fucho-no-Obi",
        left_ear="Halasz Earring",
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
    }

    --[[ Engaged Sets ]]--
    sets.baseTP = {
        --main="",
        --sub="",
        ammo="Crepuscular Pebble",
        head="Wicce Petasos +2",
        body="Wicce Coat +3",
        hands="Wicce Gloves +2",
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +3",
        neck="Sanctity Necklace",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
    }

    --[[ WS Sets ]]--
    sets.precast.WS['Myrkr'] = {
        --main="",
        --sub="",
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Pixie hairpin +1",
        body="Wicce Coat +3",
        hands="Nyame Gauntlets",
        legs="Wicce Chausses +3",
        feet="Nyame Sollerets",
        neck="Sanctity Necklace",
        waist="Fucho-no-Obi",
        left_ear="Halasz Earring",
        right_ear="Etiolation Earring",
        left_ring="Mephitas's Ring +1",
        right_ring="Mephitas's Ring",
        back="Tantalic Cape",
    }

    --[[ BLM-Specific Gear & Sets ]]--
    sets.jaSpells = {legs="Wicce Chausses +3"}

    --[[ Utility Sets ]]--
    sets.moveSpeed = {ring2="Shneddick Ring"}
    sets.obi = {waist="Hachirin-no-Obi"}
    sets.TH = {ammo="Perfect Lucky Egg", head="White Rarab Cap +1", waist="Chaac Belt"}
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	gearMode = {
		["index"] = 0,
		[0] = {name="Default", idle=sets.baseIdle, engaged=sets.baseTP},
	}
	
    --Setup eleMode for elemental wheel HUD
    eleMode = {
        ["index"] = 0,
        [0] = {element="Dark"},
        [1] = {element="Light"},
        [2] = {element="Earth"},
        [3] = {element="Water"},
        [4] = {element="Wind"},
        [5] = {element="Fire"},
        [6] = {element="Ice"},
        [7] = {element="Lightning"},
    }

	weaponMode = {
		["index"] = 0,
		[0] = {name="Default", set={}},		
	}

    --Setup magicMode
    magicMode = {
        ["index"] = 0,
        [0] = {
            ['name'] = "MagicBurst",
            ['color'] = "\\cs(238,130,238)", --violet
            ['set'] = {
                ['Elemental Magic'] = set_combine(sets.interrupt, sets.mbNuke)
            },
        },
        [1] = {
            ['name'] = "Free",
            ['color'] = "\\cs(218,165,32)", --goldenrod
            ['set'] = {
                ['Elemental Magic'] = set_combine(sets.interrupt, sets.freeNuke)
            },
        },
    }

    magicModeMod = {
        ["index"] = 0,
        [0] = {name="Normal", set=nil},
        [1] = {name="Coat", set={body="Spaekona's Coat +3"},}
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
			[1] = "On",
		}
	}

	sets.idle = gearMode[gearMode.index].idle
	sets.engaged = gearMode[gearMode.index].engaged
	sets.weapons = weaponMode[weaponMode.index].set
	modeHud('update')
    eleHud('create')
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup: ref tables specific to this job
-------------------------------------------------------------------------------------------------------------------
function job_setup()
    spellSteps = {
        --['Spell Family'] = { [0]='Highest Tier', [1]='Next Tier'... }
        --['Stone'] = {[0]='Stone VI', [1]='Stone V', [2]='Stone IV', [3]='Stone III', [4]='Stone II', [5]='Stone'},
        --['Water'] = {[0]='Water VI', [1]='Water V', [2]='Water IV', [3]='Water III', [4]='Water II', [5]='Water'},
        --['Aero'] = {[0]='Aero VI', [1]='Aero V', [2]='Aero IV', [3]='Aero III', [4]='Aero II', [5]='Aero'},
        --['Fire'] = {[0]='Fire VI', [1]='Fire V', [2]='Fire IV', [3]='Fire III', [4]='Fire II', [5]='Fire'},
        --['Blizzard'] = {[0]='Blizzard VI', [1]='Blizzard V', [2]='Blizzard IV', [3]='Blizzard III', [4]='Blizzard II', [5]='Blizzard'},
        --['Thunder'] = {[0]='Thunder VI', [1]='Thunder V', [2]='Thunder IV', [3]='Thunder III', [4]='Thunder II', [5]='Thunder'},
        ['Aspir'] = {[0]='Aspir III', [1]='Aspir II', [2]='Aspir'},
        ['Sleep'] = {[0]='Sleep II', [1]='Sleep'},
        ['Cure'] = {[0]='Cure IV', [1]='Cure III', [2]='Cure II', [3]='Cure'}
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Job specific keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
    -- Set Job-Specific Keybinds
    send_command('bind @w gs c toggleMagicMode')

    -- Set Default Macro Book / Page
    --set_macro_page(1, 1)
	
	-- Load Job-Specific Addons (if any)

	-- Set Style Lock
	--windower.send_command:schedule(4, 'input /lockstyleset 14')	
end

function extendedUserUnload()
    -- Unbind Job-Specific keys
    send_command('unbind @w')
    -- Unload Job-Specific Addons
end

function extendedJobSelfCommand(cmdParams, eventArgs)
    local currentelement = eleMode[eleMode.index].element
    if cmdParams[1] == 'JaSpell' then
        local action = ele.find.JaSpell_of[currentelement] or nil
        if action then
            send_command('/'..action)
        end
    end
    if cmdParams[1] == 'Tier6' then
        local action = ele.find.Tier6_of[currentelement] or nil
        if action then
            send_command('/'..action)
        end
    end    
    if cmdParams[1] == 'Tier5' then
        local action = ele.find.Tier5_of[currentelement] or nil
        if action then
            send_command('/'..action)
        end
    end
    if cmdParams[1] == 'Tier4' then
        local action = ele.find.Tier4_of[currentelement] or nil
        if action then
            send_command('/'..action)
        end
    end
    if cmdParams[1] == 'Tier3' then
        local action = ele.find.Tier3_of[currentelement] or nil
        if action then
            send_command('/'..action)
        end
    end
    if cmdParams[1] == 'Tier2' then
        local action = ele.find.Tier2_of[currentelement] or nil
        if action then
            send_command('/'..action)
        end
    end
    if cmdParams[1] == 'Tier1' then
        local action = ele.find.Tier1_of[currentelement] or nil
        if action then
            send_command('/'..action)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)

end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
    
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)
    if spell.english:endswith('ja') then
        equip(sets.jaSpells)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
    local autoFite = auto.fite[auto.fite.index] or nil
	local autoBuff = auto.buff[auto.buff.index] or nil

    -- Auto Buff (Sublimation)
    if autoBuff and not actionInProgress and player.sub_job == 'SCH' then
        if not buffactive['sublimation: complete'] and not buffactive['sublimation: activated'] and not onCooldown('Sublimation') then
            send_command('input /ja "Sublimation" <me>')
            return
        end

        if buffactive['sublimation: complete'] and player.mpp < 40 and subRecast == 0 then
            add_to_chat(122,'-- MP below 40% - Popping Sublimation! --')
            send_command('input /ja "Sublimation" <me>')
            return
        end
    end    

    if autoFite and not actionInProgress and not moving and player.status == 'Engaged' then
        local enemy = windower.ffxi.get_mob_by_target('t')
        if convertRecast == 0 and player.mpp < 15 and enemy.hpp < 98 and player.sub_job == 'RDM' then            
            if not buffactive['Stoneskin'] then
                send_command('input /stoneskin')
            else
                send_command('input /convert')
            end
            return
        end

        if player.mpp < 1000 and windower.ffxi.get_mob_by_target('t') and windower.ffxi.get_mob_by_target('t').name:contains('Crab') and (not onCooldown('Aspir III') or not onCooldown('Aspir II') or not onCooldown('Aspir')) then
            send_command('input /aspir3')
            return
        end
        
        -- Myrkr!
        if player.mpp < 50 and player.tp > 1000 then
            add_to_chat(122,'-- MP below 50% - Myrkr! --')
            send_command('input /ws "Myrkr" <me>')
            return
        end
    end
end