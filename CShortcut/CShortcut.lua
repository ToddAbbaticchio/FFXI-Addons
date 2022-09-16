_addon.name = 'CShortcut'
_addon.author = 'Risca'
_addon.version = '1.0.0'
_addon.commands = {'CShortcut','cs'}

require('logger')
require('coroutine')

function useEquip(itemName, itemSlot, readyTime)
	windower.send_command('input //gs disable '..itemSlot)
	windower.send_command('input /equip '..itemSlot..' "'..itemName..'"')
	
	repeat
		coroutine.sleep(1)
		readyTime = readyTime - 1
		if readyTime <= 3 and readyTime > 0 then
			windower.add_to_chat(200, 'Using '..itemName..' in '..readyTime..'...')
		end
	until ( readyTime == 0)
	windower.send_command('input /item "'..itemName..'" <me>')
	windower.send_command('input //gs enable '..itemSlot)
end

function useItem(itemName, pauseTime)
	windower.send_command('input /item "'..itemName..'" <me>')
	coroutine.sleep(pauseTime)
end

function summonTrusts(trustTeam)
	for _,trust in ipairs(trustTeam) do
		windower.send_command('input /ma "'..trust..'" <me>')
		coroutine.sleep(6)
	end
end

windower.register_event('addon command',function(cmd)
	if cmd == 'reload' then
		windower.send_command('input //lua reload cshortcut')
	end

	if cmd == 'lotall' then
		windower.send_command('input //treasury lotall')
	end

	if cmd == 'passall' then
		windower.send_command('input //treasury passall')
	end

-------------------------------------------------------------------------------------------------------------------
-- Trust Stuff
-------------------------------------------------------------------------------------------------------------------
	if cmd == 'xpparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Arciela","Shantotto II",})
	end
	
	if cmd == 'dparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Lilisette II","Excenmille [S]",})
	end
	
	if cmd == 'runparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Excenmille [S]","Arciela",})
	end
	
	if cmd == 'bluparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","August","Ulmia",})
	end
	
	if cmd == 'pupparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","August","Ulmia",})
	end

	if cmd == 'stronkparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Excenmille [S]","Monberaux",})
	end
	
	if cmd == 'goaway' then
		windower.send_command('input /echo Dismissing all trusts...')
		windower.send_command('input /returntrust all')
	end

-------------------------------------------------------------------------------------------------------------------
-- Mounts
-------------------------------------------------------------------------------------------------------------------
	if cmd == 'mount' then
		windower.send_command('input /echo Chocobo time!')
		windower.send_command('input /mount "Chocobo" <me>')
		windower.send_command('wait 2; input //timers c Chocobo 60 down spells/chocobo.png')
	end
		
-------------------------------------------------------------------------------------------------------------------
-- Temp Items?
-------------------------------------------------------------------------------------------------------------------
	if cmd == 'tempbuff' or cmd == 'tempitems' then
		windower.add_to_chat(200, 'Drinking all the draaaaaaaaaaanks...')
		useItem("Monarch's Drink", 3)
		useItem("Soldier's Drink", 3)
		useItem("Barbarian's Drink", 3)
		useItem("Fighter's Drink", 3)
	end
	
-------------------------------------------------------------------------------------------------------------------
-- Dream Boots / Dream Gloves for sneak / invis
-------------------------------------------------------------------------------------------------------------------
	if cmd == 'sneak' then
		useEquip("Dream Boots +1", "feet", 30)
	end
	
	if cmd == 'invis' or cmd == 'invisible' then
		useEquip("Dream Gloves +1", "hands", 30)
	end
	
	if cmd == 'sneakinvis' or cmd == 'stealth' then
		useEquip("Decennial Tights +1", "legs", 30)
	end
	
-------------------------------------------------------------------------------------------------------------------
-- Warp / Teleport Rings
-------------------------------------------------------------------------------------------------------------------
	if cmd == 'warp' then
		useEquip("Warp Ring", "ring1", 10)
		windower.send_command('wait 10; input //timers c WarpRing 600 down spells/00014.png')
	end 
	
	if cmd == 'dem' then
		useEquip("Dim. Ring (Dem)", "ring1", 10)
		windower.send_command('wait 10; input //timers c TeleDemRing 600 down spells/00014.png')
	end
	
	if cmd == 'mea' then
		useEquip("Dim. Ring (Mea)", "ring1", 10)
		windower.send_command('wait 10; input //timers c TeleMeaRing 600 down spells/00014.png')
	end
	
	if cmd == 'holla' then
		useEquip("Dim. Ring (Holla)", "ring1", 10)
		windower.send_command('wait 10; input /item "Dim. Ring (Holla)" <me>')
		windower.send_command('wait 10; input //timers c TeleHollaRing 600 down spells/00014.png')
	end
end)