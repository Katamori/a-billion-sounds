extends Node2D

# exportable properties
export var is_usable = false # can interact_passive
export var is_pickable = false # can item_take

# global randomizer
var rng = RandomNumberGenerator.new()

# alpha value of Node color modulation
var MOD_ALPHA = 0.5

# the increment value for texture flashing
var STEP = 0.07

# inner state variables
var is_active = false;

# general WorldObject behavior
func _ready():
	rng.randomize()
	pass

func _process(delta):
	if is_active:
		MOD_ALPHA += STEP
		generate_transition()
	else:
		MOD_ALPHA = 0.5
		set_modulate(default_color())
	pass

func generate_transition():
	set_modulate(sinoid_fadeout())
	pass

# todo: find a better place for color output functions
func default_color():
	return Color(1, 1, 1, 1)
	pass

func sinoid_fadeout():
	return Color(1, 1, 1, abs(sin(MOD_ALPHA)))

func full_random_color():
	return Color(rng.randf(), rng.randf(), rng.randf())
	
