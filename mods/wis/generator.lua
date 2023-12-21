local goal = minetest.get_content_id(greglib.get_stacked_modname(1)..":black") or minetest.CONTENT_UNKNOWN
local wall = minetest.get_content_id(greglib.get_stacked_modname(1)..":white") or minetest.CONTENT_UNKNOWN
local roof = minetest.get_content_id(greglib.get_stacked_modname(1)..":sky") or minetest.CONTENT_UNKNOWN
local ground = minetest.get_content_id(greglib.get_stacked_modname(1)..":pink") or minetest.CONTENT_UNKNOWN
local shelf = minetest.get_content_id(greglib.get_stacked_modname(1)..":gray") or minetest.CONTENT_UNKNOWN
local waypointPos1=vector.new(-3, 2, -24)
local waypointPos2=vector.new(waypointPos1.x*-1, waypointPos1.y, waypointPos1.z*-1)
local waypointPos3=vector.new(0, waypointPos1.y, 32)

local air = minetest.CONTENT_AIR
local echo = greglib.echo
local getShelfByCord = function(x, y, z)
	wis.registerNewShelf(x, y, z)
	return shelf 
end
local getBlockByCord = function(x, y, z)
	local ah =  function (pos, testPos)
		
		return (pos == testPos and true or false)
	end
	local thisPos=vector.new(x, y, z)

	if ah(waypointPos1,thisPos) then return minetest.get_content_id(greglib.get_stacked_modname(1)..":red") end
	--if ah(waypointPos2,thisPos) then return minetest.get_content_id(greglib.get_stacked_modname(1)..":blue") end
	
	if (y == 0 and z <= 32 and z > 30) then return goal end
	
	--create walls; must return first (define skip_box by return)
	local sSize=32--2^5
	if (y < 16 and (math.abs(x) > sSize or math.abs(z) > sSize)) then return wall end

	--create shelves (y stack size, x aisle line, z runnable)
	
	if (y >= 1 and y <= 3 and math.abs(x) > 2 and math.abs(x) < 30 and math.fmod(z, 4) == 0 and math.abs(z) < 30 ) then return getShelfByCord(x, y, z) end
	--create finish line
	if (y == 0 and z <= 32 and z > 30) then return goal end
	--create floor and roof; must return last (default)
	if (y <= 0) then return ground end
	if (y == 16) then return roof end
	--create shelves
	--if (y > 0 and y <= 3 and z math.fmod() ) then return shelf end
	--math.fmod(3,2)--r1

	return air
	
end

minetest.register_on_generated(function (minp, maxp, seed)
	local vm = VoxelManip(minp, maxp)
	local va = VoxelArea:new {MinEdge = minp, MaxEdge = maxp}
	
	local data = {}
	
	for x = minp.x, maxp.x do
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				local index = va:index(x, y, z)
				data[index] = getBlockByCord(x, y, z)
			end
		end
	end
	
	vm:set_data(data)
	vm:write_to_map()
end)

--because they made me do it!
local stone_alias = greglib.get_stacked_modname(1)..":pink"
minetest.register_alias('mapgen_stone', stone_alias)
minetest.register_alias('mapgen_water_source', stone_alias)
minetest.register_alias('mapgen_river_water_source', stone_alias)
