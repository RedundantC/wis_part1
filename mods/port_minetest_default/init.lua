local modpath = minetest.get_modpath(minetest.get_current_modname())
local dofileifexists = greglib.dofileifexists
default = default or {}
default.LIGHT_MAX = 14
default.get_translator = function (...)
	return ...
end


greglib.dofileifexists(modpath.."/functions.lua")
greglib.dofileifexists(modpath.."/trees.lua")
greglib.dofileifexists(modpath.."/nodes.lua")
greglib.dofileifexists(modpath.."/chests.lua")
greglib.dofileifexists(modpath.."/furnace.lua")
greglib.dofileifexists(modpath.."/torch.lua")
greglib.dofileifexists(modpath.."/tools.lua")
greglib.dofileifexists(modpath.."/item_entity.lua")
greglib.dofileifexists(modpath.."/craftitems.lua")
greglib.dofileifexists(modpath.."/crafting.lua")
greglib.dofileifexists(modpath.."/mapgen.lua")
greglib.dofileifexists(modpath.."/aliases.lua")
greglib.dofileifexists(modpath.."/legacy.lua")


