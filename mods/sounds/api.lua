
--- Sounds API
--
--  @topic api


local failed = {}


-- initialize random number generator
local rand = PcgRandom(os.time())


--- Functions
--
--  @section functions


--- Plays a sound.
--
--
--  @function sounds:play
--  @tparam string name Sound file without .ogg suffix.
--  @tparam[opt] SoundParams sp Sound parameters.
--  @treturn list (`int`) Sound handle or `nil` and (`string`) sound file name.
--  @usage
--  local handle = sounds:play("sound1", {gain=1.0})
--  if handle then
--    print("Sound handle: " .. handle)
--  end
sounds.play = function(self, name, sp)
	local s_type = type(name)
	if s_type ~= "string" then
		sounds.log("error", "cannot play non-string type: " .. s_type)
		return
	end

	if not sounds.cache[name] then
		if not failed[name] then
			failed[name] = true
			sounds.log("error", "\"" .. name .. "\" not available for playing")
		end

		return
	end

	local s_handle = core.sound_play(name, sp)

	-- TODO: register check to see if sound is still playing & remove from "playing" list
	--playing[s_handle] = name

	return s_handle, name
end

--- Plays a random sound from a list.
--
--  @function sounds:play_random
--  @tparam table snds List of sound names.
--  @tparam[opt] SoundParams sp Sound parameters.
sounds.play_random = function(self, snds, sp)
	if #snds == 0 then
		return
	end

	local play_group = table.copy(snds)
	if type(snds) == "SoundGroup" and snds.prepend == true then
		for idx, snd in ipairs(play_group) do
			play_group[idx] = "sounds_" .. snd
		end
	end

	return sounds:play(play_group[rand:next(1, #play_group)], sp)
end

--- Wrapper for core.sound_stop.
--
--  @function sounds:stop
--  @tparam int handle
sounds.stop = function(self, handle)
	core.sound_stop(handle)
end


--- Objects
--
--  @section objects

--- Sound Group.
--
--  @table SoundGroup
--  @tfield SoundGroup:count count Retrieves number of available sounds.
--  @tfield SoundGroup:play play Plays indexed or random sound.
--  @tfield bool prepend If set to `true`, prepends "sounds_" to sound filenames when played or accessed.
SoundGroup = {
	--- Constructor.
	--
	--  @function SoundGroup
	--  @tparam table def Sound definition.
	--  @treturn SoundGroup Sound group definition table.
	--  @usage
	--  -- create new sound groups
	--  local s_group1 = SoundGroup({"sound1", "sound2", prepend=true})
	--  local s_group2 = SoundGroup({"modname_sound1", "modname_sound2"})
	--
	--  -- play sound at index
	--  s_group1:play(2)
	--
	--  -- play random sound from group
	--  s_group1:play()
	--
	--  -- play sound at index with parameters
	--  s_group1:play(1, {gain=1.0, max_hear_distance=100})
	--
	--  -- play random sound with parameters
	--  s_group1:play({gain=1.0, max_hear_distance=100})
	--
	--  -- calling a SoundGroup instance directly is the same as executing the "play" method
	--  s_group(1, {gain=1.0, max_hear_distance=100})
	__init = {
		__call = function(self, def)
			def = def or {}
			if type(def) == "string" then
				def = {def}
			end

			for k, v in pairs(self) do
				if k ~= "new" and k ~= "__init" and def[k] == nil then
					def[k] = v
				end
			end

			def.__type = "SoundGroup"

			def.__init = {
				-- execute "play" method when called directly
				__call = self.play,

				-- allow arithmetic operation to join groups
				__add = function(self, g1)
					local new_group = {}
					for _, snd in ipairs(self) do
						table.insert(new_group, snd)
					end
					if type(g1) == "string" then
						table.insert(new_group, g1)
					else
						for _, snd in ipairs(g1) do
							table.insert(new_group, snd)
						end
					end

					new_group.prepend = self.prepend
					return SoundGroup(new_group)
				end,
			}
			setmetatable(def, def.__init)

			return def
		end,
	},

	--- Retrieves number of sounds in group.
	--
	--  @function SoundGroup:count
	--  @treturn int
	count = function(self)
		local s_count = 0
		for _, idx in ipairs(self) do
			s_count = s_count + 1
		end

		return s_count
	end,

	--- Plays a sound from the group.
	--
	--  If ***idx*** is not specified, an available sound will be selected
	--  randomly from the group.
	--
	--  @function SoundGroup:play
	--  @tparam[opt] int idx Sound index.
	--  @tparam[opt] SoundParams sp Sound parameters.
	--  @treturn int Sound handle or `nil`.
	--  @note idx & sp parameters positions can be switched.
	--  @usage
	--  local handle = SoundGroup:play(2, {gain=1.0})
	--  if handle then
	--    print("Sound handle: " .. handle)
	--  end
	play = function(self, idx, sp)
		local s_count = self:count()
		if s_count < 1 then
			sounds.log("error", "no sounds to play")
			return
		end

		-- allow second parameter to be sound parameters table
		if type(idx) == "table" then
			local sp_old = sp
			sp = table.copy(idx)
			idx = sp_old
			sp_old = nil
		end

		-- play random
		if not idx then
			if s_count == 1 then
				idx = 1
			else
				return sounds:play_random(self, sp)
			end
		end

		if type(idx) ~= "number" then
			print("idx must be a number")
			return
		end

		if idx > s_count then
			sounds.log("error", "sound index " .. idx .. " out of range: max " .. s_count)
			return
		end

		local selected = self[idx]
		if type(selected) == "string" and self.prepend == true then
			selected = "sounds_" .. selected
		end

		return sounds:play(selected, sp)
	end,

	--- Retrieves random name from group.
	--
	--  @function SoundGroup:get_random
	--  @treturn string
	get_random = function(self)
		local name
		local s_count = self:count()
		if s_count > 0 then
			if s_count == 1 then
				name = self[1]
			else
				name = self[rand:next(1, s_count)]
			end

			if self.prepend == true then
				name = "sounds_" .. name
			end
		end

		return name
	end,

	--- Retrieves sounds names in group.
	--
	--  If `idx` is supplied, a `string` or `nil` is returned. If
	--  there is only one sound in the group, the `string` name of
	--  that sound is returned. Otherwise, a table is returned with
	--  all sound file names.
	--
	--  @function SoundGroup:get
	--  @tparam[opt] int idx Sound index.
	--  @return `string` or `table` containing sound file names.
	get = function(self, idx)
		local count = self:count()
		if count == 0 then return end

		local retval
		if type(idx) == "number" then
			retval = self[idx]
		elseif count == 1 then
			retval = self[1]
		else
			retval = {}
			for _, snd in ipairs(self) do
				table.insert(retval, snd)
			end
		end

		if self.prepend == true then
			local rtype = type(retval)
			if rtype == "string" then
				retval = "sounds_" .. retval
			elseif rtype == "table" then
				for idx, snd in ipairs(retval) do
					retval[idx] = "sounds_" .. snd
				end
			end
		end

		return retval
	end,
}
setmetatable(SoundGroup, SoundGroup.__init)


--- Internal Sound Group.
--
--  Same as `SoundGroup` but with "prepend" set to "true" by default. Meant for
--  use with sound files prefixed with "sounds_" only.
--
--  @table iSoundGroup
iSoundGroup = table.copy(SoundGroup)
setmetatable(iSoundGroup, SoundGroup.__init)
iSoundGroup.prepend = true


--- Functions
--
--  @section functions

local biome_sounds = {}

--- Registers sounds to play randomly in biome.
--
--  @function sounds:register_biome_sounds
--  @tparam string biome Biome name.
--  @param snds Sounds registered with biome. Can be `string`, `table`, or `SoundGroup`.
--  @tparam[opt] table params Sound parameter table.
sounds.register_biome_sounds = function(self, biome, snds, params)
	if not sounds.enable_biome_sounds then
		sounds.log("warning", "sounds:register_biome_sounds: biome sounds disabled, sounds will not play")
	end

	biome_sounds[biome] = {group=SoundGroup(snds), params=params}
end

--- Retrieves sounds for biome.
--
--  @function sounds:get_biome_sounds
--  @tparam[opt] string biome Biome name.
--  @return `SoundGroup` or `nil`. If biome parameter is `nil`, then all registered biome
--  sound groups are returned.
sounds.get_biome_sounds = function(self, biome)
	if not biome then
		return biome_sounds
	end

	return biome_sounds[biome]
end
