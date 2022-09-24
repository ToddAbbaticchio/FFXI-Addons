_addon.name = 'CShortcut'
_addon.author = 'Risca'
_addon.version = '1.0.0'
_addon.commands = {'CShortcut','cs'}

require('logger')
require('coroutine')
addToChat = windower.add_to_chat
sendCommand = windower.send_command

function useEnchantedItem(command)
	local extdata = require('extdata')
	local bags = require('resources').bags
	local itemUseWarning = true
	local itemTable = {
		['holla'] = {id=26176, name='"Dim. Ring (Holla)"', slot=13, disable='ring1'},
		['dem'] = {id=26177, name='"Dim. Ring (Dem)"', slot=13, disable='ring1'},
		['mea'] = {id=26178, name='"Dim. Ring (Mea)"', slot=13, disable='ring1'},
		['warp'] = {id=28540, name="Warp Ring", slot=13, disable='ring1'},
		['reraise'] = {id=25679, name="Wh. Rarab Cap +1", slot=4, disable='head'},
		['sneakinvis'] = {id=26273, name="Tengu Shawl", slot=15, disable='back'},
	}
	local findItem = itemTable[command]
	local itemArr = {}
	
	for bagId in pairs(bags:equippable(true)) do
        local bag = windower.ffxi.get_items(bagId)
        for _,item in ipairs(bag) do
            if item.id > 0  then
                itemArr[item.id] = item
                itemArr[item.id].bag = bagId
                itemArr[item.id].bag_enabled = bag.enabled
            end
        end
    end
	local item = itemArr[findItem.id]
	
	if item and item.bag_enabled then
		local ext = extdata.decode(item)
		local enchant = ext.type == 'Enchanted Equipment'
		local recast = enchant and ext.charges_remaining > 0 and math.max(ext.next_use_time + 18000 - os.time(),0)
		local usable = recast and recast == 0
		if usable or ext.type == 'General' then
			if enchant and item.status ~= 5 then
				windower.ffxi.set_equip(item.slot,findItem.slot,item.bag)
				sendCommand('input //gs disable '..findItem.disable)
				repeat --waiting cast delay
					coroutine.sleep(1)
					local ext = extdata.decode(windower.ffxi.get_items(item.bag,item.slot))
					local delay = ext.activation_time + 18000 - os.time()
					if delay > 4 then
						if delay % 5 == 0 then
							addToChat(204, 'item: '..findItem.name..' delay: '..delay)
						end
					elseif delay > 0 then
						addToChat(204, 'item: '..findItem.name..' delay: '..delay)
					elseif itemUseWarning then
						itemUseWarning = false
						addToChat(204, 'Using '..findItem.name..' within 3 seconds...')
					end
				until ext.usable or delay > 30
			end
			sendCommand('input /item "'..findItem.name..'" <me>')
			sendCommand('input //gs enable '..findItem.disable)
		end
	elseif item and not item.bag_enabled then
		addToChat(122, 'Can not access '..findItem.name..' from ' .. bags[item.bag].name ..' at this time!')
	else
		addToChat(122, 'Unable to find '..findItem.name..' in any usable bags!')
	end
end

function useItem(itemName, pauseTime)
	sendCommand('input /item "'..itemName..'" <me>')
	coroutine.sleep(pauseTime)
end

function summonTrusts(trustTeam)
	for _,trust in ipairs(trustTeam) do
		sendCommand('input /ma "'..trust..'" <me>')
		coroutine.sleep(6)
	end
end

windower.register_event('addon command',function(csCmd)
	if csCmd == 'reload' then
		sendCommand('input //lua reload cshortcut')
	end

	if csCmd == 'lotall' then
		for slot_index, item_table in pairs(windower.ffxi.get_items().treasure) do
            windower.ffxi.lot_item(slot_index)
        end
	end

	if csCmd == 'passall' then
		for slot_index, item_table in pairs(windower.ffxi.get_items().treasure) do
            windower.ffxi.pass_item(slot_index)
        end
	end

-------------------------------------------------------------------------------------------------------------------
-- Trust Stuff
-------------------------------------------------------------------------------------------------------------------
	if csCmd == 'xpparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Arciela","Shantotto II",})
	end
	
	if csCmd == 'dparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Lilisette II","Excenmille [S]",})
	end
	
	if csCmd == 'runparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Excenmille [S]","Arciela",})
	end
	
	if csCmd == 'bluparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","August","Ulmia",})
	end
	
	if csCmd == 'stronkparty' then
		summonTrusts({"Qultada","Sylvie (UC)","Ygnas","Excenmille [S]","Monberaux",})
	end
	
	if csCmd == 'goaway' then
		sendCommand('input /echo Dismissing all trusts...')
		sendCommand('input /returntrust all')
	end

-------------------------------------------------------------------------------------------------------------------
-- Mounts
-------------------------------------------------------------------------------------------------------------------
	if csCmd == 'mount' then
		sendCommand('input /echo Chocobo time!')
		sendCommand('input /mount "Chocobo" <me>')
		sendCommand:schedule(2, 'input //timers c Chocobo 60 down spells/chocobo.png')
	end
		
-------------------------------------------------------------------------------------------------------------------
-- Temp Items?
-------------------------------------------------------------------------------------------------------------------
	if csCmd == 'tempbuff' or csCmd == 'tempitems' then
		addToChat(122, 'Drinking all the draaaaaaaaaaanks...')
		useItem("Monarch's Drink", 3)
		useItem("Soldier's Drink", 3)
		useItem("Barbarian's Drink", 3)
		useItem("Fighter's Drink", 3)
	end
	
-------------------------------------------------------------------------------------------------------------------
-- Use items
-------------------------------------------------------------------------------------------------------------------
	
	local itemCmds = "warp,mea,holla,dem,reraise,sneakinvis"
	if itemCmds:contains(csCmd:lower()) then
		useEnchantedItem(csCmd)
	end 

-------------------------------------------------------------------------------------------------------------------
-- Addon load/unload (for autofite not crashing?)
-------------------------------------------------------------------------------------------------------------------
	if csCmd == 'unload' then
		sendCommand('input //lua u Omen')
		sendCommand('input //lua u BattleMod')
		sendCommand('input //lua u Debuffed')
		sendCommand('input //lua u instaLS')
		sendCommand('input //lua u MountMuzzle')
		sendCommand('input //lua u PointWatch')
		sendCommand('input //lua u Scoreboard')
		sendCommand('input //lua u TParty')
		sendCommand('input //lua u TreasurePool')
		sendCommand('input //lua u anchor')
		sendCommand('input //lua u React')
	end
	if csCmd == 'load' then
		sendCommand('input //lua l Omen')
		sendCommand('input //lua l BattleMod')
		sendCommand('input //lua l Debuffed')
		sendCommand('input //lua l instaLS')
		sendCommand('input //lua l MountMuzzle')
		sendCommand('input //lua l PointWatch')
		sendCommand('input //lua l Scoreboard')
		sendCommand('input //lua l TParty')
		sendCommand('input //lua l TreasurePool')
		sendCommand('input //lua l anchor')
		sendCommand('input //lua l React')
	end
end)