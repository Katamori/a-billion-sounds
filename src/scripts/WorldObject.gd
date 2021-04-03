extends Node2D
class_name WorldObject

# exportable properties
export var is_usable: bool # can interact_passive
export var is_pickable: bool # can item_take

# the increment value for texture flashing
var STEP = 0.07

# alpha value of Node color modulation
var MOD_ALPHA: float

# inner state variables
var is_active: bool

# general WorldObject behavior
func _init().():
	MOD_ALPHA = 0.5
	
	is_usable = false
	is_pickable = false
	is_active = false

func _ready():
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
	return Color(Boot.rng.randf(), Boot.rng.randf(), Boot.rng.randf())
	
