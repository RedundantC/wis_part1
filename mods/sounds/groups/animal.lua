
--- Pre-defined Animal Sound Groups
--
--  @topic animal_groups



--- Amphibian
--
--  @section amphibian


--- @sndgroup sounds.frog
--  @snd frog
sounds.frog = iSoundGroup({
	"frog",
})



--- Bat
--
--  @section bat


--- @sndgroup sounds.bat
--  @snd bat_01
--  @snd bat_02
--  @snd bat_03
sounds.bat = iSoundGroup({
	"bat_01",
	"bat_02",
	"bat_03",
})



--- Bear
--
--  @section bear


--- @sndgroup sounds.bear
--  @snd bear_01
--  @snd bear_02
sounds.bear = iSoundGroup({
	"bear_01",
	"bear_02",
})



--- Bovine
--
--  @section bovine


--- @sndgroup sounds.cow_moo
--  @snd cow_moo_01
--  @snd cow_moo_02
sounds.cow_moo = iSoundGroup({
	"cow_moo_01",
	"cow_moo_02",
})

--- @sndgroup sounds.yak
--  @snd yak (imitation)
sounds.yak = iSoundGroup({
	"yak",
})



--- Camelid
--
--  @section camelid


--- @sndgroup sounds.camel
--  @snd camel_01
--  @snd camel_02
sounds.camel = iSoundGroup({
	"camel_01",
	"camel_02",
})



--- Canine
--
--  @section canine


--- @sndgroup sounds.coyote_howl
--  @snd coyote_howl
sounds.coyote_howl = iSoundGroup({
	"coyote_howl",
})

--- @sndgroup sounds.dog_bark
--  @snd dog_bark
sounds.dog_bark = iSoundGroup({
	"dog_bark",
})

--- @sndgroup sounds.puppy_bark
--  @snd puppy_bark
sounds.puppy_bark = iSoundGroup({
	"puppy_bark",
})

--- <br>
--
-- Includes:
--
--  - `sounds.dog_bark`
--  - `sounds.puppy_bark`
--
--  @sndgroup sounds.dog
sounds.dog = sounds.dog_bark + sounds.puppy_bark

--- @sndgroup sounds.hyena
--  @snd hyena_01
--  @snd hyena_02
--  @snd hyena_03
sounds.hyena = iSoundGroup({
	"hyena_01",
	"hyena_02",
	"hyena_03",
})

--- @sndgroup sounds.wolf_howl
--  @snd wolf_howl
sounds.wolf_howl = iSoundGroup({
	"wolf_howl",
})

--- @sndgroup sounds.wolf_snarl
--  @snd wolf_snarl
sounds.wolf_snarl = iSoundGroup({
	"wolf_snarl",
})



--- Caprine
--
--  @section caprine


--- @sndgroup sounds.goat_bleat
--  @snd goat_bleat_01
--  @snd goat_bleat_02
--  @snd goat_bleat_03
sounds.goat_bleat = iSoundGroup({
	"goat_bleat_01",
	"goat_bleat_02",
	"goat_bleat_03",
})

--- @sndgroup sounds.lamb
--  @snd lamb
sounds.lamb = iSoundGroup({
	"lamb",
})

--- @sndgroup sounds.sheep_baa
--  @snd sheep_baa
sounds.sheep_baa = iSoundGroup({
	"sheep_baa",
})

--- <br>
--
--  Includes:
--
--  - `sounds.lamb`
--  - `sounds.sheep_baa`
--
--  @sndgroup sounds.sheep
sounds.sheep = sounds.lamb + sounds.sheep_baa



--- Cetacean
--
--  @section cetacean


--- @sndgroup sounds.dolphin_chirp
--  @snd dolphin_chirp
sounds.dolphin_chirp = iSoundGroup({
	"dolphin_chirp",
})

--- @sndgroup sounds.dolphin_click
--  @snd dolphin_click
sounds.dolphin_click = iSoundGroup({
	"dolphin_click",
})

--- <br>
--
--  Includes:
--
--  - `sounds.dolphin_chirp`
--  - `sounds.dolphin_click`
--
--  @sndgroup sounds.dolphin
sounds.dolphin = sounds.dolphin_chirp + sounds.dolphin_click

--- @sndgroup sounds.whale
--  @snd whale
sounds.whale = iSoundGroup({
	"whale",
})



--- Elephant
--
--  @section elephant


--- @sndgroup sounds.elephant_trumpet
--  @snd elephant_trumpet
sounds.elephant_trumpet = iSoundGroup({
	"elephant_trumpet",
})



--- Equine
--
--  @section equine


--- @sndgroup sounds.horse_neigh
--  @snd horse_neigh_01
--  @snd horse_neigh_02
sounds.horse_neigh = iSoundGroup({
	"horse_neigh_01",
	"horse_neigh_02",
})

--- @sndgroup sounds.horse_snort
--  @snd horse_snort_01
--  @snd horse_snort_02
sounds.horse_snort = iSoundGroup({
	"horse_snort_01",
	"horse_snort_02",
})

--- <br>
--
--  Includes:
--
--  - `sounds.horse_neigh`
--  - `sounds.horse_snort`
--
--  @sndgroup sounds.horse
sounds.horse = sounds.horse_neigh + sounds.horse_snort

--- @sndgroup sounds.zebra
--  @snd zebra
sounds.zebra = iSoundGroup({
	"zebra",
})



--- Feline
--
--  @section feline


--- @sndgroup sounds.cat_meow
--  @snd cat_meow
sounds.cat_meow = iSoundGroup({
	"cat_meow",
})

--- @sndgroup sounds.jaguar
--  @snd jaguar_saw
sounds.jaguar = iSoundGroup({
	"jaguar_saw",
})

--- @sndgroup sounds.leopard_growl
--  @snd leopard_growl_01
--  @snd leopard_growl_02
--  @snd leopard_growl_03
sounds.leopard_growl = iSoundGroup({
	"leopard_growl_01",
	"leopard_growl_02",
	"leopard_growl_03",
})

--- @sndgroup sounds.leopard_roar
--  @snd leopard_roar_01
--  @snd leopard_roar_02
--  @snd leopard_roar_03
--  @snd leopard_roar_04
--  @snd leopard_roar_05
sounds.leopard_roar = iSoundGroup({
	"leopard_roar_01",
	"leopard_roar_02",
	"leopard_roar_03",
	"leopard_roar_04",
	"leopard_roar_05",
})

--- @sndgroup sounds.leopard_saw
--  @snd leopard_saw_01
--  @snd leopard_saw_02
--  @snd leopard_saw_03
sounds.leopard_saw = iSoundGroup({
	"leopard_saw_01",
	"leopard_saw_02",
	"leopard_saw_03",
})

--- @sndgroup sounds.leopard_snarl
--  @snd leopard_snarl_01
--  @snd leopard_snarl_02
sounds.leopard_snarl = iSoundGroup({
	"leopard_snarl_01",
	"leopard_snarl_02",
})

--- @sndgroup sounds.leopard_snort
--  @snd leopard_snort
sounds.leopard_snort = iSoundGroup({
	"leopard_snort",
})

--- <br>
--
--  Includes:
--
--  - `sounds.leopard_growl`
--  - `sounds.leopard_roar`
--  - `sounds.leopard_saw`
--  - `sounds.leopard_snarl`
--  - `sounds.leopard_snort`
--
--  @sndgroup sounds.leopard
sounds.leopard = sounds.leopard_growl + sounds.leopard_roar + sounds.leopard_saw
	+ sounds.leopard_snarl + sounds.leopard_snort

--- @sndgroup sounds.lion
--  @snd lion_bellow
sounds.lion = iSoundGroup({
	"lion_bellow",
})

--- @sndgroup sounds.tiger_roar
--  @snd tiger_roar_01
sounds.tiger_roar = iSoundGroup({
	"tiger_roar_01",
})

--- @sndgroup sounds.tiger_snarl
--  @snd tiger_snarl_01
--  @snd tiger_snarl_02
--  @snd tiger_snarl_03
--  @snd tiger_snarl_04
sounds.tiger_snarl = iSoundGroup({
	"tiger_snarl_01",
	"tiger_snarl_02",
	"tiger_snarl_03",
	"tiger_snarl_04",
})

--- <br>
--
--  Includes:
--
--  - `sounds.tiger_roar`
--  - `sounds.tiger_snarl`
--
--  @sndgroup sounds.tiger
sounds.tiger = sounds.tiger_roar + sounds.tiger_snarl



--- Fowl
--
--  @section fowl


--- @sndgroup sounds.canary
--  @snd canary_01
--  @snd canary_02
--  @snd canary_03
sounds.canary = iSoundGroup({
	"canary_01",
	"canary_02",
	"canary_03",
})

--- <br>
--
--  Includes:
--
--  - `sounds.canary`
--
--  @sndgroup sounds.bird
--  @snd bird_01
--  @snd bird_02
--  @snd bird_03
sounds.bird = iSoundGroup({
	"bird_01",
	"bird_02",
	"bird_03",
}) + sounds.canary

--- @sndgroup sounds.chicken
--  @snd chicken_01
--  @snd chicken_02
sounds.chicken = iSoundGroup({
	"chicken_01",
	"chicken_02",
})

--- @sndgroup sounds.crow_caw
--  @snd crow_caw
sounds.crow_caw = iSoundGroup({
	"crow_caw",
})

--- @sndgroup sounds.duck_quack
--  @snd duck_quack_01
--  @snd duck_quack_02
--  @snd duck_quack_03
sounds.duck_quack = iSoundGroup({
	"duck_quack_01",
	"duck_quack_02",
	"duck_quack_03",
})

--- @sndgroup sounds.goose
--  @snd goose
sounds.goose = iSoundGroup({
	"goose",
})

--- @sndgroup sounds.loon
--  @snd loon_01
--  @snd loon_02
--  @snd loon_03
sounds.loon = iSoundGroup({
	"loon_01",
	"loon_02",
	"loon_03",
})

--- @sndgroup sounds.owl
--  @snd owl_hoot
sounds.owl = iSoundGroup({
	"owl_hoot",
})

--- @sndgroup sounds.parrot_chirp
--  @snd parrot_chirp
sounds.parrot_chirp = iSoundGroup({
	"parrot_chirp",
})

--- @sndgroup sounds.parrot_whistle
--  @snd parrot_whistle
sounds.parrot_whistle = iSoundGroup({
	"parrot_whistle",
})

--- <br>
--
--  Includes:
--
--  - `sounds.parrot_chirp`
--  - `sounds.parrot_whistle`
--
--  @sndgroup sounds.parrot
--  @snd parrot_01
--  @snd parrot_02
--  @snd parrot_03
sounds.parrot = iSoundGroup({
	"parrot_01",
	"parrot_02",
	"parrot_03",
}) + sounds.parrot_chirp + sounds.parrot_whistle

--- @sndgroup sounds.peacock
--  @snd peacock_01
--  @snd peacock_02
sounds.peacock = iSoundGroup({
	"peacock_01",
	"peacock_02",
})

--- @sndgroup sounds.penguin
--  @snd penguin_01
--  @snd penguin_02
sounds.penguin = iSoundGroup({
	"penguin_01",
	"penguin_02",
})

--- @sndgroup sounds.pigeon
--  @snd pigeon
sounds.pigeon = iSoundGroup({
	"pigeon",
})

--- @sndgroup sounds.quail
--  @snd quail
sounds.quail = iSoundGroup({
	"quail",
})

--- @sndgroup sounds.rooster
--  @snd rooster
sounds.rooster = iSoundGroup({
	"rooster",
})

--- @sndgroup sounds.seagull
--  @snd seagull_01
--  @snd seagull_02
--  @snd seagulls
sounds.seagull = iSoundGroup({
	"seagull_01",
	"seagull_02",
	"seagulls",
})

--- @sndgroup sounds.toucan
--  @snd toucan_01
--  @snd toucan_02
--  @snd toucan_03
sounds.toucan = iSoundGroup({
	"toucan_01",
	"toucan_02",
	"toucan_03",
})

--- @sndgroup sounds.trumpeter_swan
--  @snd trumpeter_swan
sounds.trumpeter_swan = iSoundGroup({
	"trumpeter_swan",
})

--- @sndgroup sounds.turkey_gobble
--  @snd turkey_gobble
sounds.turkey_gobble = iSoundGroup({
	"turkey_gobble",
})

--- @sndgroup sounds.vulture
--  @snd vulture (imitation)
sounds.vulture = iSoundGroup({
	"vulture",
})

--- @sndgroup sounds.woodpecker
--  @snd woodpecker_peck
sounds.woodpecker = iSoundGroup({
	"woodpecker_peck",
})



--- Giraffe
--
--  @section giraffe


--- @sndgroup sounds.giraffe_hum
--  @snd giraffe_hum
sounds.giraffe_hum = iSoundGroup({
	"giraffe_hum",
})



--- Insect
--
--  @section insect


--- @sndgroup sounds.bee
--  @snd bee (loopable)
--  @snd bumble_bee_01 (loopable)
--  @snd bumble_bee_02
--  @snd bees (loopable)
sounds.bee = iSoundGroup({
	"bee",
	"bumble_bee_01",
	"bumble_bee_02",
	"bees",
})

--- @sndgroup sounds.cicada
--  @snd cicada_01 (loopable)
--  @snd cicada_02 (loopable)
--  @snd cicada_03 (loopable)
--  @snd cicada_04 (loopable)
--  @snd cicada_05 (loopable)
--  @snd cicada_06 (loopable)
--  @snd cicada_07 (loopable)
--  @snd cicada_08 (loopable)
sounds.cicada = iSoundGroup({
	"cicada_01",
	"cicada_02",
	"cicada_03",
	"cicada_04",
	"cicada_05",
	"cicada_06",
	"cicada_07",
	"cicada_08",
})

--- @sndgroup sounds.cricket
--  @snd cricket (loopable)
sounds.cricket = iSoundGroup({
	"cricket",
})

--- @sndgroup sounds.grasshopper
--  @snd grasshopper
sounds.grasshopper = iSoundGroup({
	"grasshopper",
})



--- Pinniped
--
--  @section pinniped


--- @sndgroup sounds.sea_lion
--  @snd sea_lion_01
--  @snd sea_lion_02
--  @snd sea_lion_03
sounds.sea_lion = iSoundGroup({
	"sea_lion_01",
	"sea_lion_02",
	"sea_lion_03",
})



--- Primate
--
--  @section primate


--- @sndgroup sounds.gorilla_grunt
--  @snd gorilla_grunt
sounds.gorilla_grunt = iSoundGroup({
	"gorilla_grunt",
})

--- @sndgroup sounds.gorilla_roar
--  @snd gorilla_roar
sounds.gorilla_roar = iSoundGroup({
	"gorilla_roar",
})

--- @sndgroup sounds.gorilla_snarl
--  @snd gorilla_snarl_01
--  @snd gorilla_snarl_02
--  @snd gorilla_snarl_03
--  @snd gorilla_snarl_04
sounds.gorilla_snarl = iSoundGroup({
	"gorilla_snarl_01",
	"gorilla_snarl_02",
	"gorilla_snarl_03",
	"gorilla_snarl_04",
})

--- <br>
--
--  Includes:
--
--  - `sounds.gorilla_grunt`
--  - `sounds.gorilla_roar`
--  - `sounds.gorilla_snarl`
--
--  @sndgroup sounds.gorilla
sounds.gorilla = sounds.gorilla_grunt + sounds.gorilla_roar + sounds.gorilla_snarl

--- @sndgroup sounds.monkey
--  @snd monkey_01 (imitation)
--  @snd monkey_02 (imitation)
--  @snd monkey_03 (imitation)
sounds.monkey = iSoundGroup({
	"monkey_01",
	"monkey_02",
	"monkey_03",
})



--- Raccoon
--
--  @section raccoon


--- @sndgroup sounds.raccoon
--  @snd raccoon_chatter
--  @snd raccoon_chatter_baby_01
--  @snd raccoon_chatter_baby_02
sounds.raccoon = iSoundGroup({
	"raccoon_chatter",
	"raccoon_chatter_baby_01",
	"raccoon_chatter_baby_02",
})


--- Rodent
--
--  @section rodent


--- @sndgroup sounds.mouse
--  @snd mouse (imitation)
sounds.mouse = iSoundGroup({
	"mouse",
})

--- @sndgroup sounds.squirrel
--  @snd squirrel_01
--  @snd squirrel_02
--  @snd squirrel_03
sounds.squirrel = iSoundGroup({
	"squirrel_01",
	"squirrel_02",
	"squirrel_03",
})



--- Snake
--
--  @section snake


--- @sndgroup sounds.cobra
--  @snd cobra_01
--  @snd cobra_02
sounds.cobra = iSoundGroup({
	"cobra_01",
	"cobra_02",
})

--- @sndgroup sounds.snake_rattle
--  @snd snake_rattle
sounds.snake_rattle = iSoundGroup({
	"snake_rattle",
})

--- <br>
--
--  Includes:
--
--  - `sounds.cobra`
--  - `sounds.snake_rattle`
--
--  @sndgroup sounds.snake
sounds.snake = sounds.cobra + sounds.snake_rattle



--- Swine
--
--  @section swine


--- @sndgroup sounds.pig_snort
--  @snd pig_snort
sounds.pig_snort = iSoundGroup({
	"pig_snort",
})

--- @sndgroup sounds.pig_squeal
--  @snd pig_squeal
sounds.pig_squeal = iSoundGroup({
	"pig_squeal",
})

--- <br>
--
--  Includes:
--
--  - `sounds.pig_snort`
--  - `sounds.pig_squeal`
--
--  @sndgroup sounds.pig
sounds.pig = sounds.pig_snort + sounds.pig_squeal
