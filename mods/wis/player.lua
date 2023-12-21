
local blank_formspec = table.concat({
	"formspec_version[4]",
	"size[0,0]",
}, "") 
local clippy_formspec = table.concat({
	"formspec_version[6]",
	"size[16,16]",
	"image[0,0;8,16;clippy_yellow.png]",
	"textarea[0,0;16,4;;;It looks like you're trying to access the inventory, I would help you with that but there is no inventory! Unfortunately there's also no way the key can be disabled due to a missing feature: https://github.com/minetest/minetest/issues/11776? Feel free to moan about it on the official minetest discord: https://discord.gg/minetest and let the core dev team you would like the feature implemented soon™, and thank you for your understanding!]",

}, "")
--	"image[0,0;8,16;blank.png^[opacity:255^[resize:16x16^[colorize:#ffffff:255]",
minetest.register_on_player_receive_fields(function(player, formname, fields)
	
end)



controls.register_on_press(function(player, control_name)
	--minetest.chat_send_player(player:get_player_name(), minetest.serialize(player:get_player_control()))
	--minetest.close_formspec("player_name", blank_formspec)
end)

wield_events.register_on_select(function(itemstack, player)
	--minetest.chat_send_player(player:get_player_name(),tostring(player:get_wield_index()))
end)
--wield_events.register_on_step(function(itemstack, player)     end)	-- called on every globalstep while the item is selected    
--wield_events.register_on_deselect(function(itemstack, player) end)	-- called when the player switches away from the item     
minetest.register_on_joinplayer(function (PlayerObjectRef, last_login)

	
	greglib.clearEnginePresets(PlayerObjectRef)
	PlayerObjectRef:set_inventory_formspec(clippy_formspec)
	
	PlayerObjectRef:hud_set_flags({
		basic_debug= false,
		breathbar= false,
		chat= not false,
		crosshair= not false,
		healthbar= false,
		hotbar= false,
		minimap= true,
		minimap_radar= false,
		wielditem= not not not not false
	})
	PlayerObjectRef:set_armor_groups({immortal=1, fall_damage_add_percent=-100})
	--greglib.echo(PlayerObjectRef:get_properties())
	PlayerObjectRef:set_properties({
    hp_max = minetest.PLAYER_MAX_HP_DEFAULT, 
    breath_max = minetest.PLAYER_MAX_BREATH_DEFAULT,
    zoom_fov = 15.0,
    collisionbox = { -0.3, 0, -0.3, 0.3, 1.7, 0.3 },  -- default
    --selectionbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5, rotate = false },
    -- { xmin, ymin, zmin, xmax, ymax, zmax } in nodes from object position.
    -- Collision boxes cannot rotate, setting `rotate = true` on it has no effect.
    -- If not set, the selection box copies the collision box, and will also not rotate.
    -- If `rotate = false`, the selection box will not rotate with the object itself, remaining fixed to the axes.
    -- If `rotate = true`, it will match the object's rotation and any attachment rotations.
    -- Raycasts use the selection box and object's rotation, but do *not* obey attachment rotations.
	pointable = true,			-- Whether the object can be pointed at
    visual = "upright_sprite",     -- "upright_sprite" is a vertical flat texture.
    visual_size = {x = 1, y = 1, z = 1},
    -- Multipliers for the visual size. If `z` is not specified, `x` will be used
    -- to scale the entity along both horizontal axes.
    textures = {
	"blank.png","palette.png"
	},	-- "upright_sprite" uses 2 textures: {front, back}.	-- "sprite" uses 1 texture.
	--colors = {},-- Number of required colors depends on visual

    use_texture_alpha = false,
    -- Use texture's alpha channel.
    -- Excludes "upright_sprite" and "wielditem".
    -- Note: currently causes visual issues when viewed through other
    -- semi-transparent materials such as water.
    is_visible = true,	-- If false, object is invisible and can't be pointed.

    automatic_rotate = 0,
    -- Set constant rotation in radians per second, positive or negative.
    -- Object rotates along the local Y-axis, and works with set_rotation.
    -- Set to 0 to disable constant rotation.

    stepheight = nil,-- 0.0, --breaks 1x1 hole drops
    -- If positive number, object will climb upwards when it moves
    -- horizontally against a `walkable` node, if the height difference
    -- is within `stepheight`.

    automatic_face_movement_dir = 0.0,
    -- Automatically set yaw to movement direction, offset in degrees.
    -- 'false' to disable.
 
    automatic_face_movement_max_rotation_per_sec = -1,
    -- Limit automatic rotation to this value in degrees per second.
    -- No limit if value <= 0.

    show_on_minimap = true,
    -- Defaults to true for players, false for other entities.
    -- If set to true the entity will show as a marker on the minimap.
})

end)
