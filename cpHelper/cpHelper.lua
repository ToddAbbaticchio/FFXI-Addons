_addon.name = 'cpHelper'
_addon.author = 'Risca'
_addon.version = '0.0.1'
_addon.commands = {'cphelper','ch'}

--
require('lists')
require('logger')
packets = require('packets')
--


-- Currency needed variables 
local player_name = windower.ffxi.get_info().logged_in and windower.ffxi.get_player().name
local check = {}
packets2= require('packets')

local requests = {
    [0x113] = packets2.new('outgoing', 0x10F),
    [0x118] = packets2.new('outgoing', 0x115),
}


nearNPC = false
repeatamount = 0

debug = false
chatColor = 050
refPacket = {}
buyingCpItems = false
CpNpcZones = T{"Windurst Waters", "Port Windurst","Windurst Woods"}
CpNpcZones = {
	[238] = {npc="Puroiko-Maiko, W.W.", menu=32759, option=32800, unknown1=0}, --Windurst Waters
	[240] = {npc="Milma-Hapilma, W.W.", menu=32759, option=32800, unknown1=0}, --Port Windurst
	[241] = {npc="Harara, W.W.", menu=32759, option=32800, unknown1=0}, -- Windurst Woods
}


WindyCurrencyType = T{"Conquest Points (Windurst)"}
currentCurrencyValue = 0

function startTransaction(target,targetIndex)
	writeLog(debug, chatColor, 'starting startTransaction()')
	if target and targetIndex then
		local npcPacket = packets.new('outgoing', 0x01A,
		{
			["Target"]=target,
			["Target Index"]=targetIndex,
			["Category"]=0,
			["Param"]=0,
			["_unknown1"]=0
		})
		packets.inject(npcPacket)
	end
end

function buyItemPackets(refPacket)
	writeLog(debug, chatColor, 'starting buyItemsPackets(1)')
	writeLog(debug, chatColor, 'refPacket:')
	writeLog(debug, chatColor, refPacket['Target'])
	writeLog(debug, chatColor, refPacket['_unknown1'])
	writeLog(debug, chatColor, refPacket['Option Index'])
	writeLog(debug, chatColor, refPacket['Target Index'])
	writeLog(debug, chatColor, refPacket['Zone'])
	writeLog(debug, chatColor, refPacket['Menu ID'])
	
	local out1 = packets.new('outgoing', 0x05B)
	out1['Target'] = refPacket['Target']
	out1['Option Index'] = refPacket['Option Index']
	out1['_unknown1'] = 0 --refPacket['_unknown1']
	out1['Target Index'] = refPacket['Target Index']
	out1['Automated Message'] = true
	out1['_unknown2'] = 0 --refPacket['Zone']
	out1['Zone'] = refPacket['Zone']
	out1['Menu ID'] = refPacket['Menu ID']
	writeLog(debug, chatColor, 'out1:')
	writeLog(debug, chatColor, 'Target: '..out1['Target'])
	writeLog(debug, chatColor, 'OptionIndex: '..out1['Option Index'])
	writeLog(debug, chatColor, '_unknown1: '..out1['_unknown1'])
	writeLog(debug, chatColor, 'TargetIndex: '..out1['Target Index'])
	writeLog(debug, chatColor, 'AutomatedMessage: '..tostring(out1['Automated Message']))
	writeLog(debug, chatColor, '_unkown2: '..out1['_unknown2'])
	writeLog(debug, chatColor, 'zone: '..out1['Zone'])
	writeLog(debug, chatColor, 'MenuID: '..out1['Menu ID'])
	packets.inject(out1)

	writeLog(debug, chatColor, 'starting buyItemsPackets(2)')
	local out2 = packets.new('outgoing', 0x05B)
	out2['Target'] = refPacket['Target']
	out2['Option Index'] = refPacket['Option Index']
	out2['_unknown1'] = 0 --refPacket['_unknown1']
	out2['Target Index'] = refPacket['Target Index']
	out2['Automated Message'] = false
	out2['_unknown2'] = 0 --refPacket['_unknown2']
	out2['Zone'] = refPacket['Zone']
	out2['Menu ID'] = refPacket['Menu ID']
	writeLog(debug, chatColor, 'out2:')
	writeLog(debug, chatColor, 'Target: '..out2['Target'])
	writeLog(debug, chatColor, 'OptionIndex: '..out2['Option Index'])
	writeLog(debug, chatColor, '_unknown1: '..out2['_unknown1'])
	writeLog(debug, chatColor, 'TargetIndex: '..out2['Target Index'])
	writeLog(debug, chatColor, 'AutomatedMessage: '..tostring(out2['Automated Message']))
	writeLog(debug, chatColor, '_unkown2: '..out2['_unknown2'])
	writeLog(debug, chatColor, 'zone: '..out2['Zone'])
	writeLog(debug, chatColor, 'MenuID: '..out2['Menu ID'])
	packets.inject(out2)
end

function actionsCompletePacket(refPacket)
	writeLog(debug, chatColor, 'starting actionsCompletePacket()')
	local out3 = packets.new('outgoing', 0x016)
	out3['Target Index'] = refPacket['me']
	writeLog(debug, chatColor, tostring(out3['me']))
	packets.inject(out3)
end

function checkState()
	if not buyingCpItems then
		local currentZone = windower.ffxi.get_info()['zone']
		if CpNpcZones[currentZone] then
			for key,value in pairs(windower.ffxi.get_mob_array()) do
				if value['name'] == windower.ffxi.get_player().name then
					refPacket['me'] = key
				end
				if value['name'] == CpNpcZones[currentZone].npc then
					targetIndex = key
					targetId = value['id']
					npcName = value['name']
					refPacket['Menu ID'] = CpNpcZones[currentZone].menu
					distance = windower.ffxi.get_mob_by_id(targetId).distance
				end
			end

			if distance > 36 then
				writeLog(true, chatColor, 'Too far from the target: '..npcName..'!!!')
				nearNPC = false
				return
			end

			refPacket['Target'] = targetId
			refPacket['Option Index'] = CpNpcZones[currentZone].option
			refPacket['_unknown1'] = CpNpcZones[currentZone].unknown1
			refPacket['Target Index'] = targetIndex
			refPacket['Zone'] = currentZone

			buyingCpItems = true
			startTransaction(refPacket['Target'], refPacket['Target Index'])
		else
			writeLog(true, chatColor, 'Not in the right zone! '..currentZone)
		end
	else
		writeLog(debug, chatColor, 'Hold your horses!  Still buying last item(s)!')
	end
end

function writeLog(debug, color, message)
	if debug ~= true then
		return
	end

	windower.add_to_chat(color, message)
end

windower.register_event('addon command', function(...)
    local arg = {...}
	local action = arg[1]
	local quantity = 1
	if arg[2] ~= nil then
		quantity = arg[2]
		repeatamount = arg[2]
	end
	if arg[3] ~= nil then
		nearNPC = true
	else 
		nearNPC = false
	end

	if action:lower() == 'buy' then
		for i = quantity,1,-1 do
			while(buyingCpItems) do
				writeLog(debug, chatColor, 'multi-purchase still in progress. sleeping for .1 seconds!')
				coroutine.sleep(0.25)
			end
			writeLog(true, chatColor, 'cpHelper queue: '..i..'..')
			checkState()
		end
		writeLog(true, chatColor, '-- CPHELPER VICTORIOUS!!! --')
		coroutine.sleep(1)
		windower.send_command('input //sellnpc mrc.cpt. scythe')
		
		--this works near Baehu-Faehu as long as windy owns Sarutabaruta  *highly likely*
		if nearNPC == true then
			windower.send_command('input /targetnpc')
		
			coroutine.sleep(3)
			pressKey('enter',0.1)
			coroutine.sleep(3)
			for i = 4, 1, -1 do
				pressKey('escape', 0.1)
			end
			coroutine.sleep(3)
		
			--lets go again....   until we can't
			findcurrency(WindyCurrencyType)
		end
		
	end


	if arg[1]:lower() == 'debug' then
		if debug == false then
			debug = true
		else
			debug = false
		end
	end
	if arg[1]:lower() == 'reload' then
		windower.send_command('input //lua reload cphelper')
	end
	if arg[1]:lower() == 'unload' then
		windower.send_command('input //lua unload cphelper')
	end
end)


function pressKey(theKey, pauseDuration)
    windower.send_command('setkey ' .. theKey .. ' down')
    coroutine.sleep(pauseDuration)
    windower.send_command('setkey ' .. theKey .. ' up')
    coroutine.sleep(pauseDuration)
end

windower.register_event('incoming chunk',function(id,data,modified,injected,blocked)
	if (id == 0x034 or id == 0x032) and buyingCpItems and refPacket then
		writeLog(debug, chatColor, 'refPacket: '..tostring(refPacket))
		buyItemPackets(refPacket)
		actionsCompletePacket(refPacket)
		
		buyingCpItems = false
		lastPacket = refPacket
		refPacket = {}
		return true
	end
end)


--finding curency info -   
function findcurrency(currency)
    term = currency:concat(' ')

    if not search_fields(term) then
        error('No currencies matching: %s':format(term))
        return
    end
end


function comma_value(n) -- credit http://richard.warburton.it
    local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
    return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

windower.register_event('incoming chunk', function(id, data, amount, flag)
    if check[id] then
        local packet = packets.parse('incoming', data)

        for field in check[id]:it() do
            local msg = '%s: %s (%s)':format(player_name, field, comma_value(packet[field]))
			currentCurrencyValue = packet[field]

            writeLog(true, chatColor, msg)
			writeLog(true, chatColor, currentCurrencyValue)
			
			--hard coded for merc captain scythe amount.    will change later if needed 
			if currentCurrencyValue > (repeatamount * 4000) then 
				windower.send_command('input //ch buy ' ..repeatamount.. ' true')
			else 
				nearNPC = false
				writeLog(true, chatColor, '--You are done sir, good day.--')
				writeLog(true, chatColor, '--I SAID GOOD DAY SIR!-- ')
			end
			
        end

        check[id] = nil
    end
end)

function search_fields(terms)

	--if ever need to expand this to a pipe delimited list for the other nations this is here... useless now. 
    terms = terms:split('|'):map(string.gsub-{'[%s%p]', '.*'} .. string.lower)

    if windower.ffxi.get_info().logged_in then
        check = {}
        local results

        for id, packet in pairs(requests) do
            local fields = packets2.fields('incoming', id)

            for field in fields:it() do
                if field.type ~= 'data' then
                    local str = field.label:gsub('[%s%p]', ''):lower()

                    for term in terms:it() do
                        if str:find(term) then
                            check[id] = check[id] or L{}
                            check[id]:append(field.label)
                        end
                    end
                end
            end

            if check[id] then
                packets2.inject(packet)
                results = true
            end
        end
        return results
    end
end


function findcurrency(currency)
    local term = currency:concat(' ')

    if not search_fields(term) then
        error('No currencies matching: %s':format(term))
        return
    end
end

windower.register_event('login', function(name)
    player_name = name
end)


-- don't need this garbage anymore.
--[[ windower.register_event('outgoing chunk', function(id, data, modified, injected, blocked)
    -- talk to npc
	if id == 0x01A then
        windower.add_to_chat(chatColor58, 'NPC packet detected? Parsed outgoing chunk table:')
        local parseChunk = packet.parse('outgoing', data)
        for k,v in pairs(parseChunk) do
            windower.add_to_chat(chatColor58, 'key: '..k..' value: '..v)
        end
    end

	-- other
	if id == 0x05B then
		windower.add_to_chat(chatColor60, 'NPC packet detected? Parsed outgoing chunk table:')
        local parseChunk = packet.parse('outgoing', data)
        for k,v in pairs(parseChunk) do
            windower.add_to_chat(chatColor60, 'key: '..k..' value: '..v)
        end
	end
end) ]]
