
local modname =minetest.get_current_modname()
local S = minetest.get_translator(modname)

local base_node = {
	--drawtype = "allfaces",
	--drawtype = "glasslike_framed",
	--drawtype = "glasslike_framed_optional",
	--drawtype = "glasslike_framed_optional", --feature?: creates lines in texture when rendering ()
	--drawtype = "nodebox",
	--groups = {diggable = 1, oddly_breakable_by_hand = 1},
	--use_texture_alpha = "clip",
	
	drawtype = "normal",
	--groups = { diggable = 1},
	is_ground_content = false,
	node_dig_prediction = "air",
	node_placement_prediction = "",
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = "blend", -- only needed for stairs API
}
--stale data from generator.lua
local waypointPos1=vector.new(-3, 2, -24)
local waypointPos2=vector.new(waypointPos1.x*-1, waypointPos1.y, waypointPos1.z*-1)
local on_click = function(pos, node, clicker)
	--greglib.echo("on_click:"..tostring(pos))
	--greglib.echo("node_def:"..tostring(dump(node)))
	if node.name and node.name == (modname..":red") then 
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z}, {name=modname ..":gray"})
		minetest.set_node({x=waypointPos2.x, y=waypointPos2.y, z=waypointPos2.z}, {name=modname ..":blue"})
	elseif node.name and node.name == (modname..":blue") then 
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z}, {name=modname ..":gray"})
	end
	wis.continueGameNextLoop(pos, node, clicker)
	
end

local nodebox_data = {
		{ -8/16, -8/16, -8/16,   8/16, 4/16, -6/16 },
		{ -8/16, -8/16,  6/16,   8/16, 4/16,  8/16 },
		{ -8/16, -8/16, -8/16,  -6/16, 4/16,  8/16 },
		{  6/16, -8/16, -8/16,   8/16, 4/16,  8/16 },
		{ -6/16, -2/16, -6/16,  6/16, 8/16, 6/16 },
}

local function show_backfaces(tiles)
    local ret = {}
    for i, tile in ipairs(tiles) do
        ret[i] = { name = tile, backface_culling = false }
    end
    return ret
end

assert(minetest.get_current_modname()==greglib.get_stacked_modname(1))
local ncids = {"red", "green", "blue", "sky", "pink", "yellow", "black", "gray", "white",}
for _, ncid in ipairs(ncids) do
	minetest.register_node(minetest.get_current_modname()..":"..ncid, greglib.mergeTables ({
		description = S(ncid..' node for mapgen and schematics'),
		-- up, down, right, left, back, front
		tiles      = (ncid == "gray" and 
		show_backfaces({
		backface_culling = false,
		greglib.get_stacked_modname(1).."_"..ncid..".png",--"top.png^[transform2",
		greglib.get_stacked_modname(1).."_"..ncid..".png",--"bottom.png",
		greglib.get_stacked_modname(1).."_"..ncid.."_side"..".png",--"side.png",
		greglib.get_stacked_modname(1).."_"..ncid.."_side"..".png",--"side.png",
		greglib.get_stacked_modname(1).."_"..ncid.."_side"..".png",--"rear.png",
		greglib.get_stacked_modname(1).."_"..ncid.."_side"..".png",--"front.png"
		}) or {greglib.get_stacked_modname(1).."_"..ncid..".png"}),
		backface_culling = false,
		--[[
		tiles = ,--]]
		on_walk_over = (ncid == "black" and function(pos, node, player)
			--	minetest.chat_send_player(player, "on_walk_over:" .. ncid)
			wis.endGame()
		end or nil),
		on_punch      = ((ncid == "gray" or ncid == "red" or ncid == "green" or ncid == "blue")  and on_click or nil),
		on_rightclick = ((ncid == "gray" or ncid == "red" or ncid == "green" or ncid == "blue") and on_click or nil), 
		drawtype = (ncid == "gray" and "glasslike" or "normal"), 
		node_box = (ncid == "gray" and {
			type = "fixed",
			fixed = nodebox_data,
		} or nil), 
	},base_node))
	minetest.register_alias("x"..":"..ncid, minetest.get_current_modname()..":"..ncid)

end

--local black_def = minetest.registered_nodes[minetest.get_current_modname()..":black"]

