include('RST\\sharedFunctions.lua')

-------------------------------------------------------------------------------------------------------------------
-- dumb name.  is required.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	init_modetables()
end

-------------------------------------------------------------------------------------------------------------------
-- Define sets and gear vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
		--GEAR DEFINE:
		gear.TPcape = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}} --change dex10 to acc10
		gear.MSRScape = {} --dex30/acc+att20/wsd10/meva15
		gear.EVcape = {} --dex30/acc+att20/crit10/meva15
		gear.EXcape = {} --agi30/acc+att20/da10/meva15
		gear.AEcape = {} --int30/macc+matt20/wsd10/meva15
		gear.WALTZcape = {} --int20/eva+meva20/waltz10/meva10/meva15
	
	
		--JA/FC:
		----JA for TH proc
		sets.TreasureHunter = {hands="Plunderer's Armlets +3",feet="Skulker's Poulaines +1"}
		sets.precast.Step = sets.TreasureHunter
		sets.precast.Flourish1 = sets.TreasureHunter
		sets.precast.JA.Provoke = sets.TreasureHunter
		sets.precast.JA.Bully = sets.TreasureHunter
		----OTHER JA
		sets.precast.JA['Feint'] = {legs="Plunderer's Culottes +3"}
		sets.precast.JA['Conspirator'] = {body="Skulker's Vest +1"}
		sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet +1"}
		sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet +1"}
		sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
		sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
		sets.precast.JA['Steal'] = {feet="Pillager's Poulaines +1"}
		sets.precast.JA['Mug'] = {head="Plunderer's Bonnet +3"}
		sets.precast.JA['Despoil'] = {legs="Skulker's Culottes +1",feet="Skulker's Poulaines +1"}
		sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +3"}
		sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
		sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']
		sets.buff['Sneak Attack'] = {ammo="Yetshila"}
		sets.buff['Trick Attack'] = {}
		----SUB JA
		sets.precast.Waltz = {
			ammo="Yamarang", --need
			head="Mummu Bonnet +2",
			body="Passion Jacket",
			hands="Slither Gloves +1", --need
			ring1="Asklepian Ring",
			ring2="Valseur's Ring",
			legs="Dashing Subligar",
			feet="Rawhide Boots"}
		----FC
		sets.SpellInterrupt = {}
		sets.precast.FC = {}
		sets.precast.FC['Utsusemi'] = set_combine(sets.precast.FC, sets.SpellInterrupt, {})
		sets.midcast.FastRecast = {}
		sets.midcast.Utsusemi = {}
	
	
		--TP/IDLE/MOVE/TH:
		----NORMAL TP
		sets.baseMelee = {
			ammo="Ginsen",
			head="Adhemar Bonnet +1",
			neck="Assassin's Gorget +2",
			ear1="Telos Earring",
			ear2="Sherida Earring",
			body="Adhemar Jacket +1",                     --pillager +3
			hands="Adhemar Wristbands +1",
			ring1="Epona's Ring",
			ring2="Rajas Ring",                           --hetairoi ring
			back=gear.TPcape,                             --need new tp cape dex20/acc20+att20/stp10/acc10/pdt-10
			waist="Windbuffet Belt +1",                   --reiki yotai
			legs="Samnuha Tights",
			feet="Plunderer's Poulaines +3"}
		----DOMAIN TP
		-- sets.baseMelee = {
			-- ammo="Ginsen",
			-- head="Heidrek Mask",
			-- neck="Assassin's Gorget +2",
			-- ear1="Telos Earring",
			-- ear2="Brutal Earring",
			-- body="Heidrek Harness",
			-- hands="Heidrek Gloves",
			-- ring1="Epona's Ring",
			-- ring2="Rajas Ring",
			-- back=gear.TPcape,
			-- waist="Windbuffet Belt +1",
			-- legs="Heidrek Brais",
			-- feet="Heidrek Boots"}
		sets.DamageTaken = {
			ammo="Ginsen",
			head="Malignance Chapeau",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Etiolation Earring",
			body="Malignance Tabard",
			hands="Meghanada Gloves +2",
			ring1="Karieyh Ring",
			ring2="Defending Ring",
			back=gear.TPcape,
			waist="Flume Belt +1",
			legs="Malignance Tights",
			feet="Malignance Boots"}
		sets.moveSpeed = {feet="Jute Boots +1"}
	
	
		--WS:
		sets.precast.WS['Mandalic Stab'] = {
			ammo="Ginsen",                               --seething bomblet +1   --SA yetshila
			head="Plunderer's Bonnet +3",                                        --SA pillager +3
			neck="Assassin's Gorget +2",
			ear1="Mache Earring",                        --sherida earring
			ear2="Moonshade Earring",
			body="Plunderer's Vest +3",
			hands="Meghanada Gloves +2",
			ring1="Ramuh Ring",                          --ilabrat ring
			ring2="Ramuh Ring",                          --regal ring
			back=gear.TPcape,                            --MSRScape
			waist="Grunfeld Belt",
			legs="Plunderer's Culottes +3",
			feet="Plunderer's Poulaines +3"}                                     --SA lustratio +1
		sets.precast.WS["Rudra's Storm"] = {
			ammo="Ginsen",                               --seething bomblet +1   --SA yetshila
			head="Plunderer's Bonnet +3",                                        --SA pillager +3
			neck="Assassin's Gorget +2",
			ear1="Mache Earring",                        --sherida earring
			ear2="Moonshade Earring",
			body="Plunderer's Vest +3",
			hands="Meghanada Gloves +2",
			ring1="Ramuh Ring",                          --ilabrat
			ring2="Ramuh Ring",                          --regal
			back=gear.TPcape,                            --MSRScape
			waist="Grunfeld Belt",
			legs="Plunderer's Culottes +3",
			feet="Plunderer's Poulaines +3"}                                     --SA lustratio +1
		-- sets.precast.WS["Rudra's Storm"] = {
			-- ammo="Ginsen",
			-- head="Heidrek Mask",
			-- neck="Assassin's Gorget +2",
			-- ear1="Mache Earring",
			-- ear2="Moonshade Earring",
			-- body="Heidrek Harness",
			-- hands="Heidrek Gloves",
			-- ring1="Ramuh Ring",
			-- ring2="Ramuh Ring",
			-- back=gear.TPcape,
			-- waist="Grunfeld Belt",
			-- legs="Heidrek Brais",
			-- feet="Heidrek Boots"}
		sets.precast.WS['Evisceration'] = {
			ammo="Yetshila",
			head="Adhemar Bonnet +1",
			neck="Shadow Gorget",                         --fotia
			ear1="Mache Earring",                         --sherida earring
			ear2="Moonshade Earring",
			body="Plunderer's Vest +3",
			hands="Adhemar Wristbands +1",                                       --SA meg +2
			ring1="Ramuh Ring",                           --begrudging ring      --SA ilabrat ring
			ring2="Mummu Ring",                           --regal ring
			back=gear.TPcape,                             --EVcape               --MSRScape
			waist="Fotia Belt",
			legs="Pillager's Culottes +1",                --pillager +3
			feet="Adhemar Gameshes +1"}
		sets.precast.WS['Exenterator'] = {
			ammo="Ginsen",                                 --seething bomblet+1        --SA yetshila
			head="Plunderer's Bonnet +3",
			neck="Shadow Gorget",                          --fotia
			ear1="Telos Earring",                          --sherida
			ear2="Brutal Earring",
			body="Plunderer's Vest +3",
			hands="Adhemar Wristbands +1",                 --herc (agi/ta4/acc+att)    --SA meg glove +2
			ring1="Ramuh Ring",                            --ilabrat ring
			ring2="Mummu Ring",                            --regal ring
			back=gear.TPcape,                              --EXcape
			waist="Fotia Belt",
			legs="Meghanada Chausses +2",                                              --SA plunderer +3
			feet="Plunderer's Poulaines +3"}
		sets.precast.WS['Aeolian Edge'] = {
			ammo="Ginsen",                               --seething bomblet +1
			head="Plunderer's Bonnet +3",                --herc (int or dex/wsd/mab)
			neck="Sanctity Necklace",                    --baetyl pendant
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body="Mummu Jacket +2",                      --herc (int or dex/wsd/mab)
			hands="Herculean Gloves",
			ring1="Dingir Ring",
			ring2="Karieyh Ring",
			back=gear.TPcape,                            --AEcape
			waist="Eschan Stone",
			legs="Herculean Trousers",
			feet="Adhemar Gameshes +1"}                  --herc (int or dex/wsd/mab)
		sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
	--Setup gearMode
	gearMode = {
		["index"] = 0,
		[0] = {name="DPS", idle=sets.DamageTaken, engaged=sets.baseMelee},
		[1] = {name="Hybrid", idle=sets.DamageTaken, engaged=sets.DamageTaken},
		[2] = {name="MaxTH", idle=sets.DamageTaken, engaged=set_combine(sets.baseMelee, sets.TreasureHunter)},
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="Main", set={main="Aeneas", sub="Gletti's Knife"}},
	}

	--Setup magicMode
	--[[ magicMode = {
		["index"] = 0,
		[0] = {name="Burst", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[1] = {name="FreeNuke", nukeSet=(set_combine(sets.interrupt, sets.MagicBurst))},
		[2] = {name="MaxAcc", nukeSet=(set_combine(sets.interrupt, sets.emSkill))},
	} ]]

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
    state.Buff['Sneak Attack'] = buffactive['Sneak Attack'] or false
    state.Buff['Trick Attack'] = buffactive['Trick Attack'] or false
    state.Buff['Feint'] = buffactive['Feint'] or false
    
	include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish.
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish.
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Job specific keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	--Set default macro book / page
    set_macro_page(1, 1)

	--Set style lock
	windower.send_command('wait 2; input /lockstyleset 42')

	--Load addons
	windower.send_command('wait 2; input //lua l smeagol')
	windower.send_command('wait 2; input //lua l equipviewer')
	windower.send_command('wait 2; input //lua l anchor')
	windower.send_command('wait 3; input //equipviewer pos 900 750')
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
    --add_to_chat(001, '-- Spell: '..spell.english..' Type: '..spell.type..' --')
end

function extendedJobMidcast(spell, action, spellMap, eventArgs)
    -- placeholder
end

function extendedJobPostMidcast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Special buff/debuff handling
-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, active)
    --[[ if active then
		if showSpellInfo == 1 then add_to_chat(122,'-- Buff: '..buff..' BuffState: true --') end
		state.Buff[buff] = true
	else
		if showSpellInfo == 1 then add_to_chat(122,'-- Buff: '..buff..' BuffState: false --') end
		state.Buff[buff] = nil
	end ]]

    if buff == "Doom" then
		if active then
			send_command('input /p "Doomed, pls halp!')
			equip({waist="Gishdubar Sash",ring1="Purity Ring"})
			disable('ring1','waist')
		else
			send_command('input /p "Im saved!!! ...or Doom killed me?')
			enable('ring1','waist')
			evalState_equipGear()
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	-- These commands happen no matter what -----------------------------------------------------------------------
	-- auto equip selected weapon set
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- These commands only happen when auto.buff mode is 'On'  ----------------------------------------------------
	-- Use case: things like spell buffs or short lived JA cooldowns with decent uptime. Things you don't
	-- want to manually click every minute or two while you're actually playing
	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		if player.sub_job == "DNC" and player.tp > 1350 then
			send_command('/hastesamba')
		end
	end

	-- These commands only happen when auto.fite mode is 'On'  ----------------------------------------------------
	-- Use case: things like auto 2 hour on cooldown, or other important JAs. Not stuff you'd want to let
	-- the script control if you were actually at the keyboard and playing.
	if auto.fite[auto.fite.index] == 'On' and not actionInProgress and not moving then
		if not onCooldown('Trick Attack') and player.tp > 1000 then
			send_command('/trickattack')
		end

		if not onCooldown("") then

		end

	end

	-- EXAMPLES --------------------------------------------------------------------------------------------------- 
	--[[ 
	
	-- when the spell name is the same as the name of the buff it gives you
	if buffCheck('Aquaveil') then
		send_command('input /ma "Aquaveil" <me>')
		return
	end

	-- when the spellname/buffname doesn't match
	if buffCheck('Enmity Boost', 'Crusade') then
		send_command('input /ma "Crusade" <me>')
		return
	end

	-- when spellname/buff name match, but you want to maintain multiple copies (run runes or pup maneuovers)
	if buffCheck('Tenebrae', 3) then
		send_command('input /ja "Tenebrae" <me>')
		return
	end

	]]


end