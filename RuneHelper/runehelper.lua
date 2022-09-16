_addon.name = 'RuneHelper'
_addon.author = 'Risca'
_addon.version = '1.0.0'
_addon.commands = {'runehelper','rh'}


texts = require('texts')
runeHud = texts.new("")
local xpos = 1500
local ypos = 75

--Elemode table
eleMode = {
	["index"] = 0,
	[0] = {rune="Tenebrae", barSpell="", msg="Dark damage\nLight resist\nStatuses: Lullaby/Finale/Charm"},
	[1] = {rune="Lux", barSpell="", msg="Light damage\nDark resist\nStatuses: Blind/Sleep/Dispel/Frazzle"},
	[2] = {rune="Tellus", barSpell="Barthunder", msg="Earth damage\nLightning resist\nStatuses: Stun"},
	[3] = {rune="Unda", barSpell="Barfire", msg="Water damage\nFire resist\nStatuses: Addle/Amnesia"},
	[4] = {rune="Flabra", barSpell="Barstone", msg="Wind damage\nEarth resist\nStatuses: Slow/Petrify/Bind/Terror"},
	[5] = {rune="Ignis", barSpell="Barblizzard", msg="Fire damage\nIce resist\nStatuses: Paralyze/Distract"},
	[6] = {rune="Gelus", barSpell="Baraero", msg="Ice damage\nWind resist\nStatuses: Silence/Gravity"},
	[7] = {rune="Sulpor", barSpell="Barwater", msg="Lightning damage\nWater resist\nStatuses: Poison"},
}

windower.register_event('load', function() 
	windower.prim.create('rune')	
	windower.prim.set_color('rune', 255, 255, 255, 255)	
	windower.prim.set_fit_to_texture('rune', false)
	windower.prim.set_texture('rune', windower.addon_path .. 'icons/'..eleMode[eleMode.index].rune..'.png')
    windower.prim.set_visibility('rune',true)
	windower.prim.set_position('rune', xpos, ypos)
	windower.prim.set_size('rune', 75, 75)
	texts.text(runeHud, eleMode[eleMode.index].msg)
	texts.visible(runeHud, true)
	texts.pos(runeHud, xpos - 15, ypos + 80)
	texts.bg_alpha(runeHud, 0)
end);

windower.register_event('addon command',function(...)
	local cmdParams = {...}

	-- Cycle Runes Up or Down
	if cmdParams[1]:lower() == 'runesup' then
		eleMode.index = eleMode.index + 1
		if eleMode.index > #eleMode then
			eleMode.index = 0
		end
		windower.prim.set_texture('rune', windower.addon_path..'icons/'..eleMode[eleMode.index].rune..'.png')
		texts.visible(runeHud, true)
		texts.text(runeHud, eleMode[eleMode.index].msg)
		updateTime = os.time()
		windower.send_command('input //gs c setrune '..eleMode[eleMode.index].rune)
		--windower.add_to_chat(122,'-- '..eleMode[eleMode.index].rune..': '..eleMode[eleMode.index].msg..' --')
	end
	if cmdParams[1]:lower() == 'runesdown' then
		eleMode.index = eleMode.index - 1
		if eleMode.index < 0 then
			eleMode.index = #eleMode
		end
		windower.prim.set_texture('rune', windower.addon_path..'icons/'..eleMode[eleMode.index].rune..'.png')
		texts.visible(runeHud, true)
		texts.text(runeHud, eleMode[eleMode.index].msg)
		updateTime = os.time()
		windower.send_command(string.format('gs c setrune %s', eleMode[eleMode.index].rune))
		--windower.add_to_chat(122,'-- '..eleMode[eleMode.index].rune..': '..eleMode[eleMode.index].msg..' --')
	end

	-- Use rune based on current eleMode selection
	if cmdParams[1]:lower() == 'userune' then
		windower.send_command(eleMode[eleMode.index].rune)
	end
	-- Use barspell based on current eleMode selection
	if cmdParams[1]:lower() == 'usebarspell' then
		windower.send_command(eleMode[eleMode.index].barSpell)
	end
end)

windower.register_event('postrender', function()
	if lastTick == nil then
		lastTick = os.time()
	end

	local now = os.time()
	if now > lastTick then
        if updateTime and (now - updateTime) >= 3 then
			texts.visible(runeHud, false)
			updateTime = nil
		end
		
        lastTick = os.time()
	end
end)

windower.register_event('unload', function()
	windower.prim.delete('rune')
end)