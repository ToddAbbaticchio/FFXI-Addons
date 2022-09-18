_addon.name = 'cpHelper'
_addon.author = 'Risca'
_addon.version = '0.0.1'
_addon.commands = {'cphelper','ch'}

packets = require('packets')

debug = true
chatColor = 220
refPacket = {}
buyingCpItems = false
CpNpcZones = T{"Windurst Woods"}
CpNpcZones = {
	[241] = {npc="Harara, W.W.", menu=32759, option=32800, unknown1=0}, -- Windurst Woods
}

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

	if arg[1]:lower() == 'buy' then
		if arg[2] ~= nil then
			for i = arg[2],1,-1 do
				while(buyingCpItems) do
					writeLog(debug, chatColor, 'multi-purchase still in progress. sleeping for .1 seconds!')
					coroutine.sleep(0.1)
				end
				checkState()
			end
		else
			checkState()
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