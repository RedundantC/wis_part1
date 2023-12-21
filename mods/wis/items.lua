local image08='blank.png^[noalpha^[resize:8x8^[colorize:#000000:255'
local image16='blank.png^[noalpha^[resize:16x16^[colorize:#ffffff:255'
local modname = minetest.get_current_modname()
--why is : the hand, is it legacy support thing or what?
minetest.register_item(minetest.get_current_modname()..':hand', {
	type = 'none',
	--wield_image = 'void_hand_hand.png^[colorize:#00FF00:40',
	--wield_image = '[combine:16x16:0,0=:8,8=',
	wield_image ='blank.png^[noalpha^[resize:16x32^[fill:16x16:0,0:#7C7CFFff^[fill:16x16:0,16:#FFFFFFff', 
	--[colorize:#000000:255:0,16=wis_black.png',
	wield_scale = {x = 0.5, y = 1, z = 4},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			diggable = {
				times = {[1] = .350, [2] = .200, [3] = .070},
				uses = 0,
			},
		},
		damage_groups = {fleshy = 1},
	}
})

minetest.register_on_joinplayer(function(player, last_login)
	if not player then return end
	local inv = player:get_inventory()
	inv:set_size("hand",1)
	inv:add_item("hand", ItemStack(modname..":hand"))
	--minetest.log(dump(inv:get_lists()))
end)
