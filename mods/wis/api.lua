wis = wis or {}
local shelves = {};
local waypoint ={}
waypoint.byUsername={}
waypoint.pos=vector.new(3, 2, 24)
local player_waypoints = {} --Distance suffix. Can be blank.
wis.echo= function (msg, large)
	minetest.chat_send_all(tostring(msg))
end

wis.moveWaypoint = function (Vector3Pos, PlayerObjectRef, WaypointName)
	if Vector3Pos == nil then return error("Vector3Pos was nil?",2) end
	local moveWaypointByPlayer = function (par1Pos, par2PlayerObjectRef)
		--minetest.get_player_by_name(par1PlayerObjectRef:get_player_name())
		waypoint.byUsername[par2PlayerObjectRef:get_player_name()] = par2PlayerObjectRef:hud_add ({
			hud_elem_type = "waypoint",
			name = (WaypointName ~= nil and WaypointName or "x"),
			number = 0xFFFFFF,
			text = "m",
			--hud_elem_type = "image_waypoint",
			--offset = {x = 0, y = 0},
			--scale = {x = 1, y = 1},
			--text = "blank.png^[noalpha^[resize:16x16^[fill:16x16:0,0:#007F00ff",
			world_pos = par1Pos,
		})
		waypoint.pos = par1Pos
	end
	if PlayerObjectRef == nil then 
		--for i=1, # do	end
		for _, player in pairs(minetest.get_connected_players()) do
			moveWaypointByPlayer(Vector3Pos,player)
		end
	else
		moveWaypointByPlayer(Vector3Pos, PlayerObjectRef)
	end
end

wis.removeWaypoint = function (PlayerObjectRef)
	local removeWaypointByPlayer = function (par2PlayerObjectRef)
		if waypoint.byUsername[par2PlayerObjectRef:get_player_name()] ~= nil then
				par2PlayerObjectRef:hud_remove(waypoint.byUsername[par2PlayerObjectRef:get_player_name()])
				waypoint.byUsername[par2PlayerObjectRef:get_player_name()] = nil
		end
	end
	if PlayerObjectRef == nil then 
		for _, player in pairs(minetest.get_connected_players()) do
			removeWaypointByPlayer(player)
		end
	else
		removeWaypointByPlayer(PlayerObjectRef)
	end
	
end

minetest.register_on_joinplayer(function(PlayerObjectRef, timed_out)
	--wis.moveWaypoint(waypoint.pos, PlayerObjectRef)
end)
minetest.register_on_leaveplayer(function(PlayerObjectRef, timed_out)
	wis.removeWaypoint(PlayerObjectRef)
end)

wis.getRandomShelf = function ()
	if #shelves <= 0 then error("#shelves is == 0, what did you do to my state!", 2) end
	--return vector.new(x, y, z)
end

wis.isRandomShelf = function ()
	return not ( #shelves == 0)
end

wis.registerNewShelf = function (x,y,z)
	table.insert(shelves, vector.new(x, y, z))
end

wis.unregisterShelves = function ()
	error("these are populated from the generator, please don't clear them EVER!",1)
	shelves={}
end

