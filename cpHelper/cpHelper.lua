_addon.name = 'cpHelper'
_addon.author = 'Risca'
_addon.version = '1.0.0'
_addon.commands = {'cphelper','ch'}

require('lists')
require('logger')
packets = require('packets')

cpVendorInfo = {
	[238] = {npc="Puroiko-Maiko, W.W.", menu=32759, option=32800, unknown1=0, itemName="mrc.cpt. scythe"},  --Windurst Waters
	[240] = {npc="Milma-Hapilma, W.W.", menu=32759, option=32800, unknown1=0, itemName="mrc.cpt. scythe"},  --Port Windurst
	[241] = {npc="Harara, W.W.", menu=32759, option=32800, unknown1=0, itemName = "mrc.cpt. scythe"},       -- Windurst Woods
}

salesVendorInfo = {
    [238] = {npc="Baehu-Faehu", menu=0, option=0, unknown1=0},                             --Windurst Waters
}

---------------------------------------------------------------------------------------------------------------------------------
-- Vendor interaction functions
---------------------------------------------------------------------------------------------------------------------------------
function gatherInfo()
    windower.send_command('input //lua l sellnpc')
    local playerNation = windower.ffxi.get_player().nation
    if playerNation == 2 then
        cpSearchString = 'Conquest Points (Windurst)'
    else
        writeLog('Why arent you Windurstian? Tell that your home city index is '..playerNation)
        windower.send_command('input //lua u cphelper')
    end

    if cpSearchString then
        getConquestPointBalance()
    end
    
    cycleDelay = 1
    lastComplete = os.time()
    loopTime = os.time() + cycleDelay
    slots = getFreeInventory()
    active = true
    midpurchase = false
    midsale = false

    info = {}
    info.zoneId = windower.ffxi.get_info().zone
    info.cpVendor = {}
    info.cpVendor.name = cpVendorInfo[info.zoneId].npc
    info.cpVendor.menuId = cpVendorInfo[info.zoneId].menu
    info.cpVendor.optionIndex = cpVendorInfo[info.zoneId].option
    info.cpVendor.unknown1 = cpVendorInfo[info.zoneId]._unknown1
    info.cpVendor.itemName = cpVendorInfo[info.zoneId].itemName
    info.salesVendor = {}
    info.salesVendor.name = salesVendorInfo[info.zoneId].npc

    -- check mob table for vendor/sales npcs and playerIndex
    for index,data in pairs(windower.ffxi.get_mob_array()) do
        if data.name == windower.ffxi.get_player().name then
            info.myIndex = index
        end
        if data.name == info.cpVendor.name then
            info.cpVendor.index = index
            info.cpVendor.id = data.id
        end
        if data.name == info.salesVendor.name then
            info.salesVendor.index = index
            info.salesVendor.id = data.id
        end
    end
end

function tryStartPurchase()
    midpurchase = true

    -- make sure within 6 yalms
    local cpVendorDistance = windower.ffxi.get_mob_by_id(info.cpVendor.id).distance or nil
    if not cpVendorDistance or cpVendorDistance > 36 then
        writeLog(true, 'Too far from the cpVendor: '..info.cpVendor.name..'!!!')
        midpurchase = false
        return
    end
    
    -- build/send npcinteract packet
    local npcInteract = packets.new('outgoing', 0x01A, {
        ["Target"]=info.cpVendor.id,
        ["Target Index"]=info.cpVendor.index,
        ["Category"]=0,
        ["Param"]=0,
        ["_unknown1"]=0
    })
    packets.inject(npcInteract)
end

function makePurchase()
    -- buy packet1
    local buy1 = packets.new('outgoing', 0x05B, {
        ['Target'] = info.cpVendor.id,
        ['Option Index'] = info.cpVendor.optionIndex,
        ['_unknown1'] = info.cpVendor.unknown1,
        ['Target Index'] = info.cpVendor.index,
        ['Automated Message'] = true,
        ['_unknown2'] = 0,
        ['Zone'] = info.zoneId,
        ['Menu ID'] = info.cpVendor.menuId,
    })
		
    -- buy packet2
    local buy2 = packets.new('outgoing', 0x05B, {
        ['Target'] = info.cpVendor.id,
        ['Option Index'] = info.cpVendor.optionIndex,
        ['_unknown1'] = info.cpVendor.unknown1,
        ['Target Index'] = info.cpVendor.index,
        ['Automated Message'] = false,
        ['_unknown2'] = 0,
        ['Zone'] = info.zoneId,
        ['Menu ID'] = info.cpVendor.menuId,
    })

    packets.inject(buy1)
    packets.inject(buy2)
end

function completePurchase()
    local complete = packets.new('outgoing', 0x016, {
        ['Target Index'] = info.myIndex
    })
    packets.inject(complete)
    lastComplete = os.time()
end

function tryStartSale()
    -- make sure within 6 yalms
    local salesVendorDistance = windower.ffxi.get_mob_by_id(info.salesVendor.id).distance or nil
    if not salesVendorDistance or salesVendorDistance > 36 then
        writeLog(true, 'Too far from the salesVendor: '..info.salesVendor.name..'!!!')
        return true
    end

    windower.send_command('input //sellnpc '..info.cpVendor.itemName)

    -- build/send npcinteract packet
    local npcInteract = packets.new('outgoing', 0x01A, {
        ["Target"]=info.salesVendor.id,
        ["Target Index"]=info.salesVendor.index,
        ["Category"]=0,
        ["Param"]=0,
        ["_unknown1"]=0
    })
    packets.inject(npcInteract)

    return true
end

---------------------------------------------------------------------------------------------------------------------------------
-- Utility functions
---------------------------------------------------------------------------------------------------------------------------------
function writeLog(debug, message)
	if debug ~= true then
		return
	end

	windower.add_to_chat(50, message)
end

function getFreeInventory()
    local inv = windower.ffxi.get_bag_info(0)
    return inv.max - inv.count
end

function getConquestPointBalance(currency)
    local currencyPacket1 = packets.new('outgoing', 0x10F)
    packets.inject(currencyPacket1)
    --[[ local currencyPacket2 = packets.new('outgoing', 0x115)
    packets.inject(currencyPacket2) ]]
end

---------------------------------------------------------------------------------------------------------------------------------
-- Event register functions
---------------------------------------------------------------------------------------------------------------------------------
windower.register_event('addon command', function(...)
    local arg = {...}
	local action = arg[1]

    if arg[1]:lower() == 'test' then
    end

    if arg[1]:lower() == 'buy' then
        gatherInfo()
        writeLog(true, 'gathered info, active set to '..tostring(active))
	end

    if arg[1]:lower() == 'reset' then
        active = false
        midpurchase = false
        midsale = false
        freeInventory = nil
        info = nil
    end
end)

windower.register_event('incoming chunk', function(id,data,modified,injected,blocked)
	-- watch for packets related to npc interaction during buy cycle
    if (id == 0x034 or id == 0x032) and midpurchase then
        makePurchase()
		completePurchase()
        midpurchase = false
        return true
	end

    -- watch for packets related to checking CP balance
    if (id == 0x113 or id == 0x118) then
        local responsePacket = packets.parse('incoming', data)
        local cpBalance = responsePacket[cpSearchString]
        writeLog(true, 'cpBalance: '..cpBalance)
       
        if cpBalance < 320000 then
            writeLog(true, 'Remaining CP: '..cpBalance..'! Stopping the loop!')
            active = false
            windower.send_command('input //lua u cphelper')
        end
    end
end)

windower.register_event('postrender', function()
    if active and os.time() > loopTime then
        loopTime = os.time() + cycleDelay

        -- if there was a colission and we're stuck for 5 seconds, autorecover
        if os.time() - lastComplete >= 5 then
            writeLog(true, 'AUTORECOVER!')
            midpurchase = false
        end

        -- last sale completed. we have more free space. buy another!
        if not midpurchase and getFreeInventory() > 0 then
            writeLog(true, 'Remaining inventory: '..getFreeInventory())
            tryStartPurchase()
            return
        end

        -- inventory is full.  sell things if we're close enough to a known sales vendor.
        if getFreeInventory() == 0 then
            getConquestPointBalance()
            tryStartSale()
        end
    end
end)