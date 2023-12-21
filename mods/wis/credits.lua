--------------------------

--------------------------



local arrive= {}
local winner_formspec = string.gsub([[
formspec_version[6]
size[14,8]
real_coordinates[true]
set_focus[btn_confirm;true]
box[0.5,1.2;13,5;#111]
textarea[0.5,1.2;13,5;;An error occurred between the chair and keyboard:;Say sike right now! We worked so hard on it, why would you break it!?  Frickin end users, and their meat fingers! You make something nice, and tell them not to touch it, and what's the first thing they do! They touch it, and then it crashes, and now the graphics card is on fire, and we can't even fix it cause there's not enough time left! See this THIS, is why we can't have nice things!]
button[5,6.6;4,1;btn_confirm;Mhm]
]], "\n", "")
local winner_title={}

local winner_bg={}
local credits_formspec = string.gsub([[
formspec_version[6]
size[14,8]
box[0.5,1.2;13,5;#ffffff]
]], "", "")
arrive.hide_chat_queue = function(player)
	player:hud_set_flags({
		chat= false,
		crosshair= false,
	})
end

local using_creds = {}

local pollCredits = function() 
	
end
arrive.showCredits = function(username)
	if player~=nil then end
	minetest.show_formspec(username, "credits_formspec", winner_formspec)
	pollCredits()
end
local ed_handle = nil;
wis.on_form_quit = function(player, formname, fields)
	minetest.kick_player(player:get_player_name(), "thanks for playing!")
end

arrive.showError= function(username, titlepng, yoffset)
	--wis.hide_chat_queue(minetest.get_player_by_name(username))
	winner_bg[username]=minetest.get_player_by_name(username):hud_add({
		hud_elem_type = "image",
		position={x = .5, y = .5},--%(0->1)
		scale = {x = 1, y = 1},--",
		text = "blank.png^[resize:9001x5000^[noalpha^[colorize:#000000:255", --^[opacity:127",
		alignment = {x=0, y=0},--1_-1
		offset= {x = 0, y = 0},--=Npx
		z_index=-391,
	})
	winner_title[username]=minetest.get_player_by_name(username):hud_add({
		hud_elem_type = "image",
		-- Type of element, can be "image", "text", "statbar", "inventory",
		-- "waypoint", "image_waypoint", "compass" or "minimap"
		position={x = .5, y = .12},--%(0->1)
		-- Top left corner position of element
		--name = "",
		scale = {x = 1, y = 1},
		--scale = {x = -50, y = -50},
		text = "header.png",
		--text = "blank.png^[noalpha^[colorize:#ffffff:255^[opacity:127",
		--text = "[inventorycube{default_grass.png{default_dirt.png&default_grass_side.png{default_dirt.png&default_grass_side.png",
		--text2 = "<text>",
		--number = 0,
		--item = 0,
		--direction = 0,
		--Direction: 0: left-right, 1: right-left, 2: top-bottom, 3: bottom-top
		alignment = {x=0, y=0},--1_-1
		offset= {x = 0, y = 0},--=Npx
		--world_pos = {x=0, y=0, z=0},
		--size = {x=0, y=0},
		--z_index = 0,
		z_index=-390,
		-- Z index: lower z-index HUDs are displayed behind higher z-index HUDs
		--style = 0,
	})
	minetest.show_formspec(username, "winner_formspec", winner_formspec)
	ed_handle = sounds:play("The_Laughing_Song", {to_player=minetest.get_player_by_name(username):get_player_name(), loop=false})
end
















return arrive;