_addon.name = 'autoGarden'
_addon.author = 'Risca'
_addon.version = '1.0.0'
_addon.commands = {'autoGarden','ag'}

require('logger')
require('coroutine')

function pressKey(theKey, pauseDuration)
	windower.send_command('setkey '..theKey..' down')
    coroutine.sleep(0.5)
    windower.send_command('setkey '..theKey..' up')
    coroutine.sleep(pauseDuration)
end

function loop()
	if loopMode == true then
		windower.add_to_chat(200, 'Starting the planting loop.')
		plantcycle()
		minutesRemaining = 60
		repeat
			windower.add_to_chat(200, 'Time remaining until next harvest cycle: '..minutesRemaining..' minutes.')
			coroutine.sleep (605)
			minutesRemaining = minutesRemaining - 10
		until ( minutesRemaining == 0)
		harvestcycle()
		loop()
	else
		windower.add_to_chat(200, 'Something broke.  Reload the addon and try again.')
	end
end

function findTarget(targetName)
	pressKey('TAB', 0.5)
	player = windower.ffxi.get_player()
	if windower.ffxi.get_mob_by_target( 't' ) == nil then
		windower.add_to_chat(200, 'No target, cycling.' )
		findTarget(targetName)
	elseif windower.ffxi.get_mob_by_target('t').name == targetName then
		windower.add_to_chat(200, 'Found '..targetName..'!')
	else
		findTarget(targetName)
	end
	coroutine.sleep(.5)
end	

function plant()
		windower.add_to_chat(200, 'Planting a revival root.')
		windower.chat.input("/item \"Revival Root\" <t>")
		coroutine.sleep(5)
		pressKey('enter', 1)
		pressKey('enter', 1)
		pressKey('enter', 4)
		pressKey('escape', 2)
end			

function harvest()
		windower.add_to_chat(200, 'Harvesting this furrow.')
		pressKey('enter', 4)
		pressKey('enter', 1)
		pressKey('enter', 1)
		pressKey('enter', 1)
		pressKey('enter', 4)
		pressKey('escape', 2)
end

function harvestcycle()
	windower.add_to_chat(200, 'Starting harvest cycle.')
	windower.add_to_chat(200, 'Searching for the first furrow.')
	findTarget("Garden Furrow")
	harvest()

	windower.add_to_chat(200, 'Searching for the second furrow.')
	findTarget("Garden Furrow #2")
	harvest()

	windower.add_to_chat(200, 'Searching for the third furrow.')
	findTarget("Garden Furrow #3")
	harvest()

	windower.add_to_chat(200, 'Harvesting Complete!')
end

function plantcycle()
	windower.add_to_chat(200, 'Searching for the first furrow.')
	findTarget("Garden Furrow")
	plant()
	
	windower.add_to_chat(200, 'Searching for the second furrow.')
	findTarget("Garden Furrow #2")
	plant()
	
	windower.add_to_chat(200, 'Searching for the third furrow.')
	findTarget("Garden Furrow #3")
	plant()
	
	windower.add_to_chat(200, 'Planting Complete!')
end

windower.register_event('addon command',function(cmd)
	if cmd == 'start' then
		loopMode = true
		loop()
	end
	
	if cmd == 'stop' then
		loopMode = false
	end
end)