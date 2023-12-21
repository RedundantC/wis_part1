function editWorldFile(prefix, newLineData)
	local filePath = minetest.get_worldpath()..DIR_DELIM.."world.mt"
	local file = io.open(filePath, "r")
	local fileContent = {}
	for line in file:lines() do
		if line:trim():sub(1, #prefix)  == prefix then 
			table.insert (fileContent, newLineData)
		else 
			table.insert (fileContent, line)
		end
	end
	io.close(file)
	file = io.open(filePath, 'w')
	for index, value in ipairs(fileContent) do
		file:write(value..'\r\n')
	end
	io.close(file)
end

minetest.register_on_joinplayer(function (PlayerObjectRef, last_login) PlayerObjectRef:get_inventory():set_list("main", {}) end)
editWorldFile("player_backend","player_backend = dummy")






