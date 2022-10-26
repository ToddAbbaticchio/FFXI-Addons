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
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
	-- Base Sets --
    
	-- Partial Sets (for specific things and stuff) --
	
	-- Specific WeaponSkill Handling --
    
    -- Job Ability Sets --
    
    -- Casting Sets --
    
end

-------------------------------------------------------------------------------------------------------------------
-- Setup tables that control our various 'modes'
-------------------------------------------------------------------------------------------------------------------
function init_modetables()
    gear.rostamA = {name="Rostam", augments={'Chance of double damage +50%'}}
    gear.rostamC = {name="Rostam", augments={'Phantom Roll +8'}}
	
    --Setup gearMode
	gearMode = {
		["main"] = {
            ["index"] = 0,
            [0] = {name="DPS", idle=set_combine(sets.baseMelee, sets.baseIdle), engaged=(sets.baseMelee)},
            [1] = {name="DamageTaken", idle=set_combine(sets.baseTank, sets.baseIdle), engaged=(sets.baseTank)},
            [2] = {name="TH", idle=set_combine(sets.baseMelee, sets.baseIdle), engaged=set_combine(sets.baseMelee, sets.TH)},
        },
        ["ranged"] = {
            ["index"] = 0,
            [0] = {name="DPS", idle=(set_combine(sets.baseMelee, sets.baseIdle)), engaged=(sets.baseMelee)},
            [1] = {name="DamageTaken", idle=(set_combine(sets.baseTank, sets.baseIdle)), engaged=(sets.baseTank)},
        },
	}
	
	--Setup weaponMode
	weaponMode = {
		["index"] = 0,
		[0] = {name="LeadenSalute", set={main=gear.rostamA, sub="Tauret", ranged="Death Penalty"}},
		[1] = {name="SavageBlade", set={main="Naegling", sub="", ranged=""}},
	}

    --QD Selectors
    quickDraw = {
        ["Primary"] = {
            ["index"] = 0,
            [0] = "Fire Shot",
            [1] = "Earth Shot",
            [2] = "Water Shot",
            [3] = "Wind Shot",
            [4] = "Ice Shot",
            [5] = "Thunder Shot",
        },
        ["Secondary"] = {
            ["index"] = 0,
            [0] = "Light Shot",
            [1] = "Dark Shot",
        },
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
    sets.weapons = waponMode[weaponMode.index].set
end

-------------------------------------------------------------------------------------------------------------------
-- Job Setup
-------------------------------------------------------------------------------------------------------------------
function job_setup()
	state.warned = M(false)

    rollInfo = {
        ["Corsair's Roll"] =    {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"] =        {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"] =     {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"] =        {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"] =      {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"] =     {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Drachen Roll"] =      {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"] =       {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"] =       {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"] =        {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"] =      {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"] =     {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"] =      {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"] =    {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"] =    {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Puppet Roll"] =       {lucky=3, unlucky=7, bonus="Pet Magic Attack/Accuracy"},
        ["Gallant's Roll"] =    {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"] =     {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"] =     {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"] =    {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Naturalist's Roll"] = {lucky=3, unlucky=7, bonus="Enh. Magic Duration"},
        ["Runeist's Roll"] =    {lucky=4, unlucky=8, bonus="Magic Evasion"},
        ["Bolter's Roll"] =     {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"] =     {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"] =    {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"] =    {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] =  {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies' Roll"] =      {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"] =      {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] =  {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"] =    {lucky=4, unlucky=8, bonus="Counter Rate"},
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup: Keybinds, set macro page, stylelock, etc
-------------------------------------------------------------------------------------------------------------------
function extendedUserSetup()
	--QD1:
	send_command('bind ^insert gs c PQDUp')
    send_command('bind ^delete gs c PQDDown')
    send_command('bind ^= gs c usePQD')
	--QD2:
    send_command('bind !insert gs c SQDUp')
    send_command('bind !delete gs c SQDDown')
	send_command('bind != gs c useSQD')
	--OTHER KEYBINDS:
	send_command('bind !` input /map')
	send_command('bind !- input /mount warmachine')
	
	--Set default macro book / page
    set_macro_page(1, 4)

	--Set style lock
	send_command:schedule(2, 'input /lockstyleset 42')
end

function extendedUserUnload()
	send_command('unbind ^insert')
	send_command('unbind ^delete')
	send_command('unbind ^=')
	send_command('unbind !insert')
	send_command('unbind !delete')
	send_command('unbind !=')
	send_command('unbind !`')
	send_command('unbind !-')
end

-------------------------------------------------------------------------------------------------------------------
-- Action/Cast phases
-------------------------------------------------------------------------------------------------------------------
function extendedJobPrecast(spell, action, spellMap, eventArgs)
	--BULLET CHECK
	if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
        do_bullet_checks(spell, spellMap, eventArgs)
    end

	--ROLL DURATION CHECK
    if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") then
        if not player.status == 'Engaged' then
            equip(sets.rollDuration)
        end
    end
end

function extendedJobAftercast(spell, action, spellMap, eventArgs)
    if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and not spell.interrupted then
        display_roll_info(spell)
    end
    if spell.english == "Light Shot" then
        send_command('@timers c "Light Shot ['..spell.target.name..']" 60 down abilities/00195.png')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Self Command Handling
-------------------------------------------------------------------------------------------------------------------
function extendedJobSelfCommand(cmdParams, eventArgs)
	-- toggle gearmode.main on self command

	-- toggle gearmode.ranged on self command
	if cmdParams[1]:lower() == 'togglerangedmode' then
        rangedMode_ind = rangedMode_ind + 1
        if rangedMode_ind > #sets.rangedMode.index then 
			rangedMode_ind = 1 
		end
		update_IdleEngagedSets(sets.combatMode.index[combatMode_ind],sets.rangedMode.index[rangedMode_ind],sets.modMode.index[modMode_ind])
		add_to_chat(122,'-- RangedMode:' .. sets.rangedMode.index[rangedMode_ind] .. ' --')
	end

	-- toggle quickDraw.Primary
	if cmdParams[1]:lower() == 'pqdup' then
		PQDEle_ind = PQDEle_ind + 1
		if PQDEle_ind > #sets.PQDEle.index then
			PQDEle_ind = 1
		end
		update_QDEle("Primary", sets.PQDEle.index[PQDEle_ind])
	end 
	if cmdParams[1]:lower() == 'pqddown' then
		PQDEle_ind = PQDEle_ind - 1
		if PQDEle_ind < 1 then
			PQDEle_ind = #sets.PQDEle.index
		end
		update_QDEle("Primary", sets.PQDEle.index[PQDEle_ind])
	end 

	-- toggle quickDraw.Secondary
	if cmdParams[1]:lower() == 'sqdup' then
		SQDEle_ind = SQDEle_ind + 1
		if SQDEle_ind > #sets.SQDEle.index then
			SQDEle_ind = 1
		end
		update_QDEle("Secondary", sets.SQDEle.index[SQDEle_ind])
	end 
	if cmdParams[1]:lower() == 'sqddown' then
		SQDEle_ind = SQDEle_ind - 1
		if SQDEle_ind < 1 then
			SQDEle_ind = #sets.SQDEle.index
		end
		update_QDEle("Secondary", sets.SQDEle.index[SQDEle_ind])
	end 
	
	-- Use currently selected QuickDraws
	if cmdParams[1]:lower() == 'usepqd' then
		send_command('input /ja "'..sets.PQDEle.index[PQDEle_ind]..'" <stnpc>')
	end
	if cmdParams[1]:lower() == 'usesqd' then
        send_command('input /ja "'..sets.SQDEle.index[SQDEle_ind]..'" <stnpc>')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility Functions
-------------------------------------------------------------------------------------------------------------------
function display_roll_info(spell)
    if rollInfo[spell.english] then
        add_to_chat(001, string.char(129,115)..'  '..string.char(31,210)..spell.english..string.char(31,001)..' : '..rollinfo.bonus.. ' ' ..string.char(129,116).. ' ' ..string.char(129,195)..' Lucky: ' ..string.char(31,204)..tostring(rollinfo.lucky)..string.char(31,001)..' /'..' Unlucky: '..string.char(31,167).. tostring(rollinfo.unlucky)..string.char(31,002))
    end
end

function do_bullet_checks(spell, spellMap, eventArgs)
    local bullet_name
    local bullet_min_count = 1

    if spell.type == 'WeaponSkill' then
        if spell.skill == "Marksmanship" then
            if spell.english == 'Wildfire' or spell.english == 'Leaden Salute' then
                -- magical weaponskills
                bullet_name = gear.MagicBullet
            else
                -- physical weaponskills
                bullet_name = gear.PhysBullet
            end
        else
            return
        end
    elseif spell.type == 'CorsairShot' then
        bullet_name = gear.QDbullet
    elseif spell.action_type == 'Ranged Attack' then
        bullet_name = gear.PhysBullet
        if buffactive['Triple Shot'] then
            bullet_min_count = 3
        end
    end

    local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]

    -- If no ammo is available, give appropriate warning and end.
    if not available_bullets then
        if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
            add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
            return
        elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.PhysBullet then
            add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
            return
        else
            add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
            eventArgs.cancel = true
            return
        end
    end

    -- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
    if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
        add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
        eventArgs.cancel = true
        return
    end

    -- Low ammo warning.
	options.ammo_warning_limit = 10
    if spell.type ~= 'CorsairShot' and state.warned.value == false and available_bullets.count < 5 and available_bullets.count <= options.ammo_warning_limit then
        local msg = '*****  LOW AMMO WARNING: '..bullet_name..' *****'
        --local border = string.repeat("*", #msg)
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end

        add_to_chat(104, border)
        add_to_chat(104, msg)
        add_to_chat(104, border)

        state.warned:set()
    elseif available_bullets.count > options.ammo_warning_limit and state.warned then
        state.warned:reset()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Autoaction Handler
-------------------------------------------------------------------------------------------------------------------
function autoActions()
	local abilRecast = windower.ffxi.get_ability_recasts()

	-- auto equip selected weapon set if enemies are dicks (we get disarmed)
	if player.equipment.main == "empty" then
		send_command('input //gs equip sets.weapons')
	end

	-- handle auto wake with vim torque +1
	if buffactive['Sleep'] and player.status == "Engaged" then 
		send_command('input //gs equip {neck="Vim Torque +1"}')
	elseif player.equipment.neck == "Vim Torque +1" and not buffactive['Sleep'] then
		if player.status == "Engaged" then
			send_command('input //gs equip sets.engaged')
		else
			send_command('input //gs equip sets.idle')
		end
	end

	-- auto buff stuff!
	if auto.buff[auto.buff.index] == 'On' and not actionInProgress and not moving then
		-- Summon bird if no bird
		local birdRecast = abilRecast[163]
		if not pet.isvalid and birdRecast == 0 then
			send_command('input /ja "Call Wyvern" <me>')
			return
		end
		
		--[[ I assume you want to control healing breath if you're playing... but if 
		auto.fite.index = 'On' autoHeal if anyone is below 50% hp? ]]
		if auto.fite[auto.fite.index] == 'On' then
			local birdHealRecast = abilRecast[239]
			local partyInfo = windower.ffxi.get_party()
			for _,info in pairs(partyInfo) do
				if type(info) == 'table' and info.mob then
					local partyMember = info.mob
					if partyMember.hpp < 50 and birdHealRecast == 0 then
						add_to_chat(122, '-- '..partyMember.name..' is hurt! Save them Solaire! --')
						send_command('input /pet "Restoring Breath" <me>')
						return
					end
				end
			end
		end
		
		-- if sub war
		if player.sub_job == 'WAR' then
			local berserkRecast = abilRecast[1]
			local warcryRecast = abilRecast[2]
			local aggressorRecast = abilRecast[4]
		
			-- if autobuff AND autofite is on
			if auto.fite[auto.fite.index] == 'On' then
				-- don't use berserk if we're in tank mode?  Because damage is scary?
				if not gearMode[gearMode.index].name:contains('Tank') then
					if not buffactive['Berserk'] and berserkRecast == 0 then
						send_command('input /ja "Berserk" <me>')
						return
					end
				end

				-- don't use warcry if we have warcry or blood rage active
				if not buffactive['Warcry'] and not buffactive['Blood Rage'] and warcryRecast == 0 then
					send_command('input /ja "Warcry" <me>')
					return
				end

				if not buffactive['Aggressor'] and aggressorRecast == 0 then
					send_command('input /ja "Aggressor" <me>')
					return
				end
			end
		end
		
		-- if sub sam
		if player.sub_job == 'SAM' then
			local hassoRecast = abilRecast[138]
			local sekkRecast = abilRecast[140]

			if not buffactive['Hasso'] and hassoRecast == 0 then
				send_command('input /ja "Hasso" <me>')
				return
			end

			-- if autobuff AND autofite is on
			if auto.fite[auto.fite.index] == 'On' then
				if not buffactive['Sekkanoki'] and sekkRecast == 0 then
					send_command('input /ja "Sekkanoki" <me>')
					return
				end
			end
		end

		--if sub drk
		if player.sub_job == 'DRK' then
			local lastresortRecast = abilRecast[87]
			
			-- if autobuff AND autofite is on
			if auto.fite[auto.fite.index] == 'On' then
				-- don't use last resort if we're in tank mode?  Because damage is scary?
				if not gearMode[gearMode.index].name:contains('Tank') then
					if not buffactive['Last Resort'] and lastresortRecast == 0 then
						send_command('input /ja "Last Resort" <me>')
						return
					end
				end
			end
		end
	end
end