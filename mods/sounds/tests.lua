
--- Sounds Tests
--
--  Enabled with [sounds.enable_tests](settings.html#sounds.enable_tests).
--
--  @topic tests


local S = core.get_translator(sounds.modname)

local player_cache = {}
local groups_list = {}
local s_handle

local fs_w = 16
local fs_h = 12

local get_tests_fs = function(pname)
	local p_cache = player_cache[pname] or {}

	local fs = "formspec_version[2]"
		.. "size[" .. fs_w .. "," .. fs_h .. "]"
		.. "label[0.25,0.5;" .. S("Sounds Tests") .. "]"
		.. "button_exit[" .. fs_w-0.75 .. ",0.25;0.5,0.5;btn_close;X]"
		.. "label[0.25,1.75;Last played:]"
		.. "textlist[3.25,1.5;" .. fs_w-5.5 .. ",1.5;played_status;"
			.. S("Name: @1", (p_cache.name or ""))
			.. "," .. S("Cached: @1", (p_cache.cached or ""))
			.. "," .. S("Played: @1", (p_cache.played or ""))
		.. "]"
		.. "label[0.25,3.5;" .. S("Manual play:") .. "]"
		.. "field[3.25,3.25;" .. fs_w-5.5 .. ",0.5;input_name;;" .. (p_cache.manual_play or "") .. "]"
			.. "field_close_on_enter[input_name;false]"
		.. "button[" .. fs_w-1.75 .. ",3.25;1.5,0.5;btn_play_man;" .. S("Play") .. "]"
		.. "label[0.25,4.25;" .. S("Group play:") .. "]"
		.. "textlist[3.25,4;" .. fs_w-(5.5*2) .. "," .. fs_h-4.25 .. ";groups;"

	if #groups_list == 0 then -- cache groups
		for k in pairs(sounds) do
			if type(sounds[k]) == "SoundGroup" then
				table.insert(groups_list, k)
			end
		end

		for nk in pairs(sounds.node) do
			if type(sounds.node[nk]) == "SoundGroup" then
				table.insert(groups_list, "node." .. nk)
			end
			for nnk in pairs(sounds.node[nk]) do
				if type(sounds.node[nk][nnk]) == "SoundGroup" then
					table.insert(groups_list, "node." .. nk .. "." .. nnk)
				end
			end
		end

		table.sort(groups_list)
	end

	local g = ""
	local g_added = 0
	for _, k in ipairs(groups_list) do
		if g_added > 0 then
			g = g .. ","
		end
		g = g .. k
		g_added = g_added + 1
	end

	fs = fs .. g .. "]"
		.. "textlist[8.75,4;" .. fs_w-(5.5*2) .. "," .. fs_h-4.25 .. ";gsounds;"

	if p_cache.selected_group then
		local group_name = groups_list[p_cache.selected_group]
		local s_group
		if group_name then
			if string.find(group_name, ".") then
				s_group = sounds
				for _, subgroup in ipairs(group_name:split(".")) do
					s_group = s_group[subgroup]
				end
			else
				s_group = sounds[group_name]
			end
		end

		s_group = s_group or {}

		local s = ""
		local s_added = 0
		for _, s_name in ipairs(s_group) do
			local r_count = sounds.cache[s_name] or sounds.cache["sounds_" .. s_name]
			if s_added > 0 then
				s = s .. ","
			end
			s = s .. s_name
			if type(r_count) == "number" then
				s = s .. " (" .. r_count .. " sounds)"
			end

			s_added = s_added + 1
		end

		fs = fs .. s
	end

	fs = fs .. "]"
		.. "button[" .. fs_w-1.75 .. ",4;1.5,0.5;btn_play_grp;" .. S("Play") .. "]"
		.. "button[" .. fs_w-1.75 .. ",4.75;1.5,0.5;btn_rand;" .. S("Random") .. "]"
		.. "button[" .. fs_w-1.75 .. ",5.5;1.5,0.5;btn_stop;" .. S("Stop") .. "]"
		.. "checkbox[" .. fs_w-1.75 .. ",6.5;chk_loop;" .. S("Loop") .. ";"
			.. tostring(p_cache.loop or "false") .. "]"

	return fs
end

--- Displays sounds tests formspec.
--
--  @local
--  @tparam string pname Player name to whom formspec is shown.
local show_tests = function(pname)
	core.show_formspec(pname, "sounds_tests", get_tests_fs(pname))
end

--- Displays sounds tests formspec.
--
--  @chatcmd sounds_tests
core.register_chatcommand("sounds_tests", {
	description = S("Displays sounds tests formspec."),
	func = function(pname, param)
		show_tests(pname)
		return true
	end,
})


core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "sounds_tests" then
		local pname = player:get_player_name()
		player_cache[pname] = player_cache[pname] or {}
		local p_cache = player_cache[pname]

		if fields.chk_loop ~= nil then
			p_cache.loop = fields.chk_loop == "true"
		end

		if fields.quit then
			if s_handle then
				sounds:stop(s_handle)
				s_handle = nil
			end

			player_cache[pname] = nil
		elseif fields.btn_stop then
			if s_handle then
				sounds:stop(s_handle)
				s_handle = nil
			end
		elseif fields.btn_play_man then
			if s_handle then
				sounds:stop(s_handle)
				s_handle = nil
			end

			local s_name = tostring(fields.input_name):trim()
			if s_name ~= "" then
				p_cache.name = s_name
				p_cache.cached = S("no")
				if sounds.cache[s_name] then
					p_cache.cached = S("yes")
				end

				s_handle = sounds:play(s_name, {to_player=pname, loop=p_cache.loop})

				p_cache.played = S("no")
				if s_handle then
					p_cache.played = S("yes")
				end

				p_cache.manual_play = s_name
				show_tests(pname)
			end
		elseif fields.groups then
			local selected_group = tostring(fields.groups):gsub("^CHG:", "")
			p_cache.selected_group = tonumber(selected_group)
			show_tests(pname)
		elseif fields.gsounds then
			local selected_sound = tostring(fields.gsounds):gsub("^CHG:", "")
			p_cache.selected_sound = tonumber(selected_sound)
		elseif fields.btn_play_grp then
			if s_handle then
				sounds:stop(s_handle)
				s_handle = nil
			end

			if p_cache then
				local selected_group = p_cache.selected_group
				if selected_group then
					local group_name = groups_list[selected_group]
					local sound_group
					if group_name then
						if string.find(group_name, ".") then
							sound_group = sounds
							for _, subgroup in ipairs(group_name:split(".")) do
								sound_group = sound_group[subgroup]
							end
						else
							sound_group = sounds[sound_group]
						end
					end

					if type(sound_group) == "SoundGroup" then
						local s_idx = p_cache.selected_sound or 1
						local s_count = sound_group:count()
						if s_idx > s_count then
							s_idx = s_count
						end
						p_cache.selected_sound = s_idx

						local s_name
						s_handle, s_name = sound_group(s_idx, {to_player=pname, loop=p_cache.loop})
						p_cache.name = s_name

						p_cache.cached = S("no")
						if sounds.cache[s_name] then
							p_cache.cached = S("yes")
						end
						p_cache.played = S("no")
						if s_handle then
							p_cache.played = S("yes")
						end

						show_tests(pname)
					end
				end
			end
		elseif fields.btn_rand then
			if s_handle then
				sounds:stop(s_handle)
				s_handle = nil
			end

			if p_cache then
				local selected_group = p_cache.selected_group
				if selected_group then
					local group_name = groups_list[selected_group]
					local sound_group
					if group_name then
						if string.find(group_name, ".") then
							sound_group = sounds
							for _, subgroup in ipairs(group_name:split(".")) do
								sound_group = sound_group[subgroup]
							end
						else
							sound_group = sounds[sound_group]
						end
					end

					if type(sound_group) == "SoundGroup" then
						local s_name
						s_handle, s_name = sound_group({to_player=pname, loop=p_cache.loop})
						p_cache.name = s_name

						p_cache.cached = S("no")
						if sounds.cache[s_name] then
							p_cache.cached = S("yes")
						end
						p_cache.played = S("no")
						if s_handle then
							p_cache.played = S("yes")
						end

						show_tests(pname)
					end
				end
			end
		end

		return true
	end
end)
