Thar be changes! From here on out you shouldn't NEED to change anything other than adding your various jobTables to the jobVars.lua file
The default jobVars.lua has various examples for the different jobs I used regularly - I'll call out a few things that might be helpful though:

The format for the autobuff handler is: ["Ability or Spell Name"] = "Name of the buff it gives you"
 - so if I were to use the spell Refresh3 as an example, we'd want: ["Refresh III"] = "Refresh" because Refresh III gives a buff that is just called Refresh
 - And yes, i get that this is dumb but if you wanted to use enblizzard: ["Enblizzard"] = "Enblizzard"
If you have buffs that will overwrite eachother, like Warcry and Blood Rage for a warrior you can also do:
	["Warcry"] = "Warcry,Blood Rage",
	["Blood Rage"] = "Warcry,Blood Rage",
The autoBuffHandler will only attempt to use a spell/ability if 
	1) it is not on cooldown (recast timer not > 0)
	2) The buff(s) listed in the value slot of the key/value pair are not active, so by adding more than one like the above example you're saying
	use ["Warcry"] but only when Warcry & Blood Rage are off cooldown and not active.  (So warcry won't overwrite bloodrage)

For a more concrete example, lets look at the RUN table below:
vars.RUN = {
    autoBuffs = {
        -- maintain all these buffs full time, or as close to full time as possible
	["Aquaveil"] = "Aquaveil",
        ["Crusade"] = "Enmity Boost",
        ["Phalanx"] = "Phalanx",
        ["Temper"] = "Multi Strikes",
        ["Swordplay"] = "Swordplay",
        ["Last Resort"] = "Last Resort",
        ["Barwater"] = "Barwater",
        ["Battuta"] = "Battuta",
	
	-- don't overwrite valiance with One for All, or One for All with Valiance
        ["Valiance"] = "Valiance,One for All",
        ["One for All"] = "Valiance,One for All"
    },
    afReact = {},
    maintainAftermath = false,
    
    -- spam resolution as soon as we hit TP threshold
    ws = "Resolution",
    -- set tp threshold to 1000
    targetTp = 1000,
    -- pull valid targets with Flash
    pullCommand = '/ma "Flash" '
}

To get a feel for how you'd use the afReact table:
vars.SCH = {
    autoBuffs = {
        ['Dark Arts'] = "Dark Arts",
    },
    afReact = {
        -- If ANYONE creates Darkness or Distortion on our target, we respond with Blizzard V then Blizzard IV
	['Darkness'] = {actor='any', response='/ma "Blizzard V" <t>', response2='/ma "Blizzard IV" <t>'},
        ['Distortion'] = {actor='any', response='/ma "Blizzard V" <t>', response2='/ma "Blizzard IV" <t>'},

	-- If OUR TARGET uses Bubble Curtain or Scissor Guard on itself, we respond with Dispel.  (yep. was fighting lots of crabs)
	['Bubble Curtain'] = {actor='enemy', response='/ma "Dispel" <t>'},
        ['Scissor Guard'] = {actor='enemy', response='/ma "Dispel" <t>'},
    },
    ws = "Myrkr",
    targetTp = 2000,
    pullCommand = '/ma "Frazzle" '
}

You can also use it to close skillchains like this:
vars.BLU = {
    autoBuffs = {},
    afReact = {
        --If ANYONE uses impulse drive, we attempt to close the skillchain with Expiacion
	['Impulse Drive'] = {actor='any', response='/ws "Expiacion" <t>'},
        
	--If we are about to use Expiacion for any reason (reaction OR normal wsHandler call) but a burst window is open... pump the breaks. Preserve the burst window for that sweet sweet magic burst damage
	['Expiacion'] = {actor='self', response='preserveBurstWindow'}
    },
    ws = "Expiacion",
    maintainAftermath = true,
    targetTp = 1000,
    pullCommand = '/ma "Glutinous Dart" '
}
