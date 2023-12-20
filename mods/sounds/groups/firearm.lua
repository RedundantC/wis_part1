
--- Pre-defined Firearm Sound Groups
--
--  @topic firearm_groups



--- Assualt Rifle
--
--  @section ar


--- @sndgroup sounds.ar_burst
--  @snd ar_burst_01
--  @snd ar_burst_02
--  @snd ar_burst_03
sounds.ar_burst = iSoundGroup({
	"ar_burst_01",
	"ar_burst_02",
	"ar_burst_03",
})

--- <br>
--
--  Includes:
--
--  - `sounds.ar_burst`
--
--  @sndgroup sounds.ar_fire
--  @snd ar_fire_01
--  @snd ar_fire_02
sounds.ar_fire = iSoundGroup({
	"ar_fire_01",
	"ar_fire_02",
}) + sounds.ar_burst



--- Pistol
--
--  @section pistol


--- @sndgroup sounds.pistol_cock
--  @snd pistol_cock_01
--  @snd pistol_cock_02
--  @snd pistol_cock_03
sounds.pistol_cock = iSoundGroup({
	"pistol_cock_01",
	"pistol_cock_02",
	"pistol_cock_03",
})

--- @sndgroup sounds.pistol_fire
--  @snd pistol_fire_01
--  @snd pistol_fire_02
--  @snd pistol_fire_03
sounds.pistol_fire = iSoundGroup({
	"pistol_fire_01",
	"pistol_fire_02",
	"pistol_fire_03",
})

--- @sndgroup sounds.pistol_fire_dry
--  @snd pistol_fire_dry
sounds.pistol_fire_dry = iSoundGroup({
	"pistol_fire_dry",
})

--- @sndgroup sounds.pistol_reload
--  @snd pistol_reload
sounds.pistol_reload = iSoundGroup({
	"pistol_reload",
})



--- Ricochet
--
--  @section ricochet


--- @sndgroup = sounds.ricochet
--  @snd ricochet
sounds.ricochet = iSoundGroup({
	"ricochet",
})



--- Rifle
--
--  @section rifle


--- @sndgroup sounds.rifle_cock
--  @snd rifle_cock_01
--  @snd rifle_cock_02
--  @snd rifle_cock_03
sounds.rifle_cock = iSoundGroup({
	"rifle_cock_01",
	"rifle_cock_02",
	"rifle_cock_03",
})

--- @sndgroup sounds.rifle_fire
--  @snd rifle_fire_01
--  @snd rifle_fire_02
--  @snd rifle_fire_03
--  @snd rifle_fire_04
--  @snd rifle_fire_cock
sounds.rifle_fire = iSoundGroup({
	"rifle_fire_01",
	"rifle_fire_02",
	"rifle_fire_03",
	"rifle_fire_04",
	"rifle_fire_cock",
})

--- @sndgroup sounds.rifle_fire_dry
--  @snd rifle_fire_dry
sounds.rifle_fire_dry = iSoundGroup({
	"rifle_fire_dry",
})

--- @sndgroup sounds.rifle_small_fire
--  @snd rifle_small_fire_01
--  @snd rifle_small_fire_02
sounds.rifle_small_fire = iSoundGroup({
	"rifle_small_fire_01",
	"rifle_small_fire_02",
})



--- Shotgun
--
--  @section shotgun


--- @sndgroup sounds.shotgun_fire
--  @snd shotgun_fire_pump
sounds.shotgun_fire = iSoundGroup({
	"shotgun_fire_pump",
})

--- @sndgroup sounds.shotgun_pump
--  @snd shotgun_pump
sounds.shotgun_pump = iSoundGroup({
	"shotgun_pump",
})
