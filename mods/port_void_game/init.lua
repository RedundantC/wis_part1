local modpath = minetest.get_modpath(minetest.get_current_modname())
local dofileifexists = greglib.dofileifexists
greglib.dofileifexists(modpath.."/void_essential.lua")
greglib.dofileifexists(modpath.."/void_hand.lua")

