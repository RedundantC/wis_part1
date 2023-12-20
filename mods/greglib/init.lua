--Naming convention:
--minetest uses snake_case internally, functions or variable names derived from minetest internals follow this convention.
--lua internals such as dofile use nocase and so extentions to them such as dofileifexists also use nocase.
--all other names use camelCase.
--* ``

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local storage = minetest.get_mod_storage()
local c674e47 = c674e47 or {} --CRC32B
-- internal dependences
c674e47.echo=function (msg) if type(msg) == "table" then msg = minetest.serialize(msg) end if #(minetest.get_connected_players()) == 0 then  minetest.log("error", msg) else minetest.chat_send_all(tostring(msg)) end end

c674e47.mergeTables = function(firstTable, secondTable)
	if firstTable == nil then firstTable = {} end
	if secondTable == nil then return firstTable end
	for k,v in pairs(secondTable) do firstTable[k] = v end
	return firstTable
end
c674e47.subtractTables  = function(firstTable, secondTable)
	--if firstTable == nil then end -- can't decide how i wanna handle these edge cases
	--if secondTable == nil then end
	local thirdTable ={}
	for k,v in pairs(secondTable) do 
		if firstTable[k] ~= nil then 
			thirdTable[k]=firstTable[k]
		else
			thirdTable[k]=secondTable[k]
		end
	end
	return thirdTable
end
c674e47.dofileifexists = function (path) local file=io.open(path,"r") if file~=nil then io.close(file); return dofile(path); else return {} end end
-- pure functions
c674e47.expToLvl    = function(intExp, floatScale) return (math.sqrt((intExp / floatScale)+0)) end
c674e47.lvlToExp    = function(intLvl, floatScale) return  (((intLvl^2)-0) * (floatScale)) end
c674e47.getMaxInt   = function ()  return 2^52 end --see also: https://stackoverflow.com/a/945935
c674e47.isCsm       = function ()  return INIT~="game" end
c674e47.isModLoaded = function (modnamespace) if rawget(_G, modnamespace) then return true end return false end

-- impure functions

c674e47.setPlayerPos = function(pos, player) pos = c674e47.mergeTables(player:get_pos(),pos) pos.y = (pos.y + 1); player:set_pos(pos) end
local spawnPoint = {x=0,y=0,z=0,}
c674e47.setServerSpawnPoint = function(pos) 
	if type (pos) ~= "table" then pos ={} end  c674e47.mergeTables({x=0,y=0,z=0,}, pos)
	spawnPoint = pos
	local function onSpawn(player)
		player:set_pos(spawnPoint)
		return true
	end

	minetest.register_on_newplayer(function(player)
		onSpawn(player)
	end)
	minetest.register_on_respawnplayer(function(player)
		return on_spawn(player)
	end)

end

--[[

local function on_spawn(player)
	if not searched then
	--if true then
		success = search()
		searched = true
	end
	if success then
		player:set_pos(spawn_pos)
	end
	return success
end

minetest.register_on_newplayer(function(player)
	on_spawn(player)
end)

local enable_bed_respawn = minetest.settings:get_bool("enable_bed_respawn")
if enable_bed_respawn == nil then
	enable_bed_respawn = true
end

minetest.register_on_respawnplayer(function(player)
	-- Avoid respawn conflict with beds mod
	if beds and enable_bed_respawn and
			beds.spawn[player:get_player_name()] then
		return
	end

	return on_spawn(player)
end)

--]]


-- [-2] = not initialized, [-1] = not enabled
--		player:override_day_night_ratio(frozenTime)
local frozenTime=-2
c674e47.getFrozenTime = function() return frozenTime end
c674e47.unfreezeTime = function() frozenTime = -1 end
c674e47.freezeTime = function(time)
	time = math.max(0, math.min(time, 1))
	if frozenTime <= -2 then
		frozenTime=time
		minetest.register_globalstep(function (dtime) 
			if frozenTime > 0 then 
				minetest.set_timeofday(c674e47.getFrozenTime()) --* `par1` is between `0` and `1`; `0` for midnight, `0.5` for midday
			end 
		end)
	end
end

-- [ == -2 or < 0  ] =  or not initialized
local hotbarSize = -2
c674e47.setPlayerHotbarSize = function (hotbar_size, player)
	if hotbar_size == nil then error("hotbar_size: can not be nil") end
	if player == nil then 
		if hotbarSize == -2 then 
			minetest.register_on_joinplayer(function (PlayerObjectRef, last_login)
				c674e47.setPlayerHotbarSize(hotbar_size, PlayerObjectRef)
			end)
			hotbarSize=hotbar_size
		end
		for _, player in pairs(minetest.get_connected_players()) do
			c674e47.setPlayerHotbarSize(hotbar_size, player)
		end
	else
		hotbar_size = math.max(1, math.min(math.floor(hotbar_size), 32))
		player:get_meta():set_int("hotbar_size", hotbar_size) 
		player:hud_set_hotbar_itemcount(hotbar_size) 
	
	end
end


c674e47.clearEnginePresets = function (player) 
	player:set_sun({sunrise="blank.png",sunrise_visible=false,texture="blank.png",tonemap="blank.png",})
	player:set_moon({texture="blank.png",tonemap="blank.png",})
	player:set_sky({base_color="#000000",clouds=false,type="plain",})
end

c674e47.getPlayerLookRaycast = function (player, reach) 
	--[[ get player position --]] 
	local playerEyePosition = player:get_pos()
	playerEyePosition.y = playerEyePosition.y + player:get_properties().eye_height
	playerEyePosition = vector.add(playerEyePosition, player:get_eye_offset())
	--[[ return raycast --]] 
	local ray = minetest.raycast(playerEyePosition, vector.add( vector.multiply( player:get_look_dir(), reach), playerEyePosition), false,		(minetest.registered_nodes[minetest.get_node(playerEyePosition).name].drawtype ~= "liquid") )
	return ray
end
c674e47.getPlayerReach = function (player) local hands = nil local handReach = nil return player:get_wielded_item():get_definition().range or handReach or 5 end
--c674e47.hideGlobalUi = function (bool, extra) end
--dependant functions
getSubordinatePlayers = function () if c674e47.isCsm() then return { minetest.localplayer() } else return minetest.get_connected_players() end end
--persistent functions: functions which may permanently change state even after reboot, requiring extra calls to reset.
c674e47 = c674e47.mergeTables (c674e47, {
whitelistServer = function (allowedUsers)
		if allowedUsers == nil then minetest.settings:set("c674e47_whitelist", "") return end
		if type(allowedUsers) == "string" then allowedUsers={allowedUsers} end 
		if type(allowedUsers) ~= "table" then error("called ".. debug.getinfo(1, "n").name .. " with non string, non table argument of type \"" .. type (allowedUsers) .. "\"") end
		--if is in unregistered state ("c674e47_whitelist"==nil) register function with engine
		local old_whitelist = minetest.settings:get("c674e47_whitelist")
		if old_whitelist == nil then
			minetest.settings:set("c674e47_whitelist", minetest.serialize(allowedUsers))
			minetest.register_on_prejoinplayer(function(name, ip)
				for index, value in ipairs(minetest.deserialize(minetest.settings:get("c674e47_whitelist"), true)) do
					if value == name then
						return
					end
				end 
				return "This server is whitelisted."
			end)
		end
	end,
})
--reset storage:greglib_whitelist and run greglib_whitelist as arguments to account for expected behaviour
if storage:get("greglib_whitelist") ~= nil then
	--local allowedUsers = minetest.deserialize(storage:get("greglib_whitelist"), true)
	storage:remove("greglib_whitelist")
	--c674e47.whitelistServer(allowedUsers)
end
local mpdd = modpath..DIR_DELIM
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."compress.lua")  or {})--To compress or decompress data      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."crypto.lua")    or {})--Cryptographic functions, kinda slow though      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."file.lua")      or {})--Provides macros for handling files      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."hash.lua")      or {})--Hashing algorithms (notably adler32)      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."lattice.lua")   or {})--Cry-Kyber,Cry-Dilithium,Falcon,&Sphincs+      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."log.lua")       or {})--Provides general purpose logging functions      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."math.lua")      or {})--Provides various math functions      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."mtversion.lua") or {})--To identifying engine version information      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."net.lua")       or {})--To create tcp/udp servers and clients      
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."os.lua")        or {})--Provides os bridge for insecure env       
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."path.lua")      or {})--so you don't need regex for basic tasks       
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."polyfill.lua")  or {})--Provides engine version compat         
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."strings.lua")   or {})--Provides string manipulation functions       
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."test.lua")      or {})--To yell at devs if I break something
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."timers.lua")    or {})--Provides tools for measuring execution time
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."tls.lua")       or {})--Provides TLS and SSL protocols
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."tty.lua")       or {})--Provides os agnostic terminal for insecure env
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."url.lua")       or {})--To parse URL strings, validate URI, and more?
c674e47=c674e47.mergeTables(c674e47,c674e47.dofileifexists(mpdd.."vm.lua")        or {})--To isolate code to a "virtual lua environment"

--[[
calc line len 3dvect 3dvect
 str arr for wilecard, takes str arr and returns result of "if arr contains '*' char " 
--//mtschemcreate <file>
--minetest.settings:set('time_speed', 0)
minetest.set_timeofday(0.5) --* `par1` is between `0` and `1`; `0` for midnight, `0.5` for midday
	-- move to greglib
	--player:override_day_night_ratio(frozenTime)
--]]

greglib = c674e47
return greglib