local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local storage = minetest.get_mod_storage()

local dofileifexists = greglib.dofileifexists
local whitelistServer = greglib.whitelistServer
local freezeTime = greglib.freezeTime
local unfreezeTime = greglib.unfreezeTime
local setPlayerHotbarSize = greglib.setPlayerHotbarSize
local setServerSpawnPoint = greglib.setServerSpawnPoint
local echo = greglib.echo

math.fmod = math.fmod or math.mod
wis = wis or {}
wis.spawnPoint={x=0,y=1,z=-30}
setServerSpawnPoint(wis.spawnPoint)
setPlayerHotbarSize(1)
--TODO:--whitelistServer("singleplayer", "this mod is untested for multiplayer")
freezeTime(0.5)
dofileifexists(modpath..DIR_DELIM.."api.lua")
dofileifexists(modpath..DIR_DELIM.."worldfile.lua")
dofileifexists(modpath..DIR_DELIM.."storymode.lua")
dofileifexists(modpath..DIR_DELIM.."items.lua")
dofileifexists(modpath..DIR_DELIM.."nodes.lua")
dofileifexists(modpath..DIR_DELIM.."generator.lua")
dofileifexists(modpath..DIR_DELIM.."player.lua")
local credits= dofileifexists(modpath..DIR_DELIM.."credits.lua")
--The risk I took was calculated, but man, am I bad at math.
greglib.debug = true
