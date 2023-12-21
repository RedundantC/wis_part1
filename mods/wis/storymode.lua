local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local storage = minetest.get_mod_storage()

local playerCount=0
local isPlaying = false;
local isEnding = false;

local activeShelves = {};
local waypointPos1=vector.new(-3, 2, -24)
local waypointPos2=vector.new(waypointPos1.x*-1, waypointPos1.y, waypointPos1.z*-1)
local waypointPos3=vector.new(0, waypointPos1.y, 32)
local credits = greglib.dofileifexists(modpath..DIR_DELIM.."credits.lua")
--table.concat({}, "")  is faster, but this version easier to read so that makes it better!
--pilfered from %minetest%\builtin\fstk\ui.lua:L88



wis.endGame = function ()
	local debug_mode= not true
	if (isPlaying == true and (isEnding == true )) then
		isPlaying = false
		greglib.echo("winner!")
		wis.removeWaypoint()
		for _, player in pairs(minetest.get_connected_players()) do
			credits.showError(player:get_player_name())
		end

	end
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.quit ~= nil then 
		--wis.on_form_quit(player, formname, fields)
	elseif fields.btn_confirm ~= nil then 
		minetest.close_formspec(player:get_player_name(), formname)
		wis.on_form_quit(player, formname, fields)
	else
		--greglib.echo("player:"..player:get_player_name())
		--greglib.echo("formname:"..formname)
		--greglib.echo("fields:"..dump(fields))

	end

	
end)

wis.resetGame = function ()
	--wis.removeWaypoint()
	isPlaying = false
	for _, player in pairs(minetest.get_connected_players()) do
		player:set_pos(wis.spawnPoint)
		player:set_look_vertical(0)
		player:set_look_horizontal(0)
	end
	wis.startGame()
end


wis.continueGameNextLoop = function (pos, node, clicker, player)
		if pos == waypointPos1 then 
			wis.removeWaypoint()
			wis.moveWaypoint(waypointPos2, nil, "Find The Stuff")
			wis.echo("Find The Stuff")
		elseif pos == waypointPos2 then
			wis.removeWaypoint()
			wis.moveWaypoint(waypointPos3, nil, "Run")
			wis.echo("Run!")
			isEnding=true
		end
	--.startGame wait for player to load world 
	--.after if shelf is > 0 get random shelf
		--set waypoint
		--play audio line
		--end exec until player clicks next correct block
		--goto .after
	--if #minetest.get_connected_players() > 0 then end
end

wis.startGame = function ()
local thingString="The Thing"
	if 	wis.isRandomShelf() then 
		local mathSign=-1
		wis.echo("Get "..thingString)
		wis.moveWaypoint(waypointPos1, nil, thingString)
		isPlaying = true
	else
		minetest.after(0,function ()
			wis.startGame()
		end)
	end


end
-----------------------------------

minetest.register_on_joinplayer(function (PlayerObjectRef, last_login)
---player joins. 
--if not isPlaying() and player_count is == 0 then player_count++ and .startGame
playerCount = playerCount +1
if not (isPlaying == true) and playerCount ==1 then
	wis.startGame()
end
--continueGame(PlayerObjectRef)

	
end)