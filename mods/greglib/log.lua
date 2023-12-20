local log ={}
log.modname = minetest.get_current_modname()
log.modpath = minetest.get_modpath(minetest.get_current_modname())
--0 = v function, 1 = caller, >1 callers caller(s)...
log.get_stacked_modname=function (meta) if (meta==nil) then meta = 1 end return debug.getinfo(math.abs(meta)+1, "S").source:match("mods[/\\][/\\]?[^/\\]*"):match("[/\\].*$"):sub(2) or "" end
log.erro=function (msg) minetest.log("error", "[".. log.get_stacked_modname(1) .."] " .. tostring(msg) ) end
--minetest.chat_send_player(PlayerObjectRef:get_player_name(),""..itemstack:get_name()..""..i_rep.." x"..itemstack:get_count())			

function log.newLogger(mod, level)
	if not mod then
		mod = log.get_stacked_modname(1)
	end
	if not mod then
		level = 'info'
	end
	return function(message)
		minetest.log(level, "[" .. mod .. "] " .. message)
	end
end
return log