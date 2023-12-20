local register_node = minetest.register_node
local register_alias = minetest.register_alias
local oneblock = 

register_node('port_void_game:stone', {
	description = 'Essential node for mapgen alias “mapgen_stone”',
	--tiles = { 'void_essential_stone.png' },
	tiles = { 'default_dirt.png' },
	groups = { oddly_breakable_by_hand = 111 or 3 },
	is_ground_content = true
})

--[[
register_node('port_void_game:river_water_source', {
    description = 'Essential node for mapgen alias “mapgen_river_water_source”',
    --tiles = { 'void_essential_river_water_source.png' },
    tiles = { 'default_river_water.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})

register_node('port_void_game:water_source', {
    description = 'Essential node for mapgen alias “mapgen_water_source”',
    --tiles = { 'void_essential_water_source.png' },
    tiles = { 'default_water.png' },
	groups = { oddly_breakable_by_hand = 3 , water = 3, liquid = 3, not_in_creative_inventory = 1, cools_lava = 1},
	buildable_to = true,
	is_ground_content = true,
	diggable = true,

	--drawtype = "flowingliquid",
	--drop = "",
	--drowning = 1,
	--liquid_range = 1,
	--liquid_renewable = false,
	--liquid_viscosity = 0.0,
	--liquidtype = "flowing",
	--paramtype = "light",
	--paramtype2 = "flowingliquid",
	pointable = true,
	--post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	--use_texture_alpha = "blend",
	--walkable = false,

})

--]]

register_alias('mapgen_stone', 'port_void_game:stone')
register_alias('mapgen_water_source', 'port_void_game:stone')
register_alias('mapgen_river_water_source', 'port_void_game:stone')
