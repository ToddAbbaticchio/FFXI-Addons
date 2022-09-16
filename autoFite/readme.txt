Thar be changes! From here on out you shouldn't NEED to change anything other than adding a jobTable to the first function (initializeSessionVars) of autoFite.lua

It's worth calling out, in the vars.JOB.selfBuffs table, the format is: ["Ability or Spell Name"] = "Name of the buff it gives you"
 - so if I were to use Refresh3 as an example, we'd want: ["Refresh III"] = "Refresh"
 - And yes, i get that this is dumb but if you wanted to use enblizzard: ["Enblizzard"] = "Enblizzard"
	
If you have buffs that will overwrite eachother, like Warcry and Blood Rage for a warrior you can also do:
	["Warcry"] = "Warcry,Blood Rage",
	["Blood Rage"] = "Warcry,Blood Rage",
 - basically, the autoBuffHandler will only attempt to use a spell/ability if 
    1) it is not on cooldown (recast timer not > 0)
	2) The buff(s) listed in the value slot of the key/value pair are not active
	

Job table format (most basic. these settings are required, the others will use default options if not set) :
-----------------------------------------------------------
vars.BLU = {
    selfBuffs = {
        ["Erratic Flutter"] = "Haste",
        ["Battery Charge"] = "Refresh",
        ["Nat. Meditation"] = "Attack Bonus",
    },
    ws = "Savage Blade",
    targetTp = 1750,
    pullCommand = '/ma "Glutinous Dart" ',
}
-----------------------------------------------------------


Job table format (all optional overrides included):
-----------------------------------------------------------
vars.BLU = {
    selfBuffs = {
        ["Erratic Flutter"] = "Haste",
        ["Battery Charge"] = "Refresh",
        ["Nat. Meditation"] = "Attack Bonus",
    },
    ws = "Savage Blade",
    targetTp = 1750,
    pullCommand = '/ma "Glutinous Dart" ',
	
    -- optional overrides --
	autoBuff = false,               ( default: true                                                                                       )
	maintainAftermath = true,       ( default: false                                                                                      )
	pullDistance = 1231231232132,   ( default: 460, which is casting range                                                                )
	meleeDistance = 12,             ( default: 26 - seems to work best                                                                    )
	target = {                      ( default: Anything with 'Apex' in the name for pull mode, Risca for assist mode                      )
		["pull"] = "Apex",          (   - You could make this more specific by setting it to 'Apex Toad' instead                          )
		["assist"] = "Risca",       (   - Either/or/or both can be provided in the jobTable and it will only override that default option )
	},
}
-----------------------------------------------------------