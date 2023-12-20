
--- Pre-defined Vehicle Sound Groups
--
--  @topic vehicle_groups



--- Airplane
--
--  @section airplane


--- @sndgroup sounds.airplane
--  @snd airplane_prop (loopable)
sounds.airplane = iSoundGroup({
	"airplane_prop",
})

--- @sndgroup sounds.jet
--  @snd jet_ambience (loopable)
--  @snd jet_flyby
--  @snd jet_land
sounds.jet = iSoundGroup({
	"jet_ambience",
	"jet_flyby",
	"jet_land",
})



--- Bicycle
--
--  @section bicycle


--- @sndgroup sounds.bicycle_bell
--  @snd bicycle_bell
sounds.bicycle_bell = iSoundGroup({
	"bicycle_bell",
})

--- @sndgroup sounds.bicycle_horn
--  @snd bicycle_horn
sounds.bicycle_horn = iSoundGroup({
	"bicycle_horn",
})

--- @sndgroup sounds.bicycle_spokes
--  @snd bicycle_spokes
sounds.bicycle_spokes = iSoundGroup({
	"bicycle_spokes",
})



--- Helicopter
--
--  @section helicopter


--- @sndgroup sounds.helicopter
--  @snd helicopter (loopable)
sounds.helicopter = iSoundGroup({
	"helicopter",
})



--- Motorbike
--
--  @section motorbike


--- @sndgroup sounds.motorbike
--  @snd motorbike_idle (loopable)
sounds.motorbike = iSoundGroup({
	"motorbike_idle",
})



--- Train
--
--  @section train


--- @sndgroup sounds.train_whistle
--  @snd train_whistle
sounds.train_whistle = iSoundGroup({
	"train_whistle",
})



--- Vehicle
--
--  @section vehicle


--- @sndgroup sounds.vehicle_horn
--  @snd vehicle_horn_01
--  @snd vehicle_horn_02
sounds.vehicle_horn = iSoundGroup({
	"vehicle_horn_01",
	"vehicle_horn_02",
})

--- @sndgroup sounds.vehicle_motor
--  @snd car_motor (loopable)
--  @snd vehicle_motor_idle (loopable)
sounds.vehicle_motor = iSoundGroup({
	"car_motor",
	"vehicle_motor_idle",
})
