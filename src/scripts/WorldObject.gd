extends Node2D


var rng = RandomNumberGenerator.new()

# alpha value of Node color modulation
var MOD_ALPHA = 0

# the increment value for texture flashing
var STEP = 0.07

# general WorldObject behavior
func _ready():
	rng.randomize()
	pass

func _process(delta):
	MOD_ALPHA += STEP
	generate_transition()
	pass

func generate_transition():
	set_modulate(sinoid_fadeout())
	pass

# todo: find a better place for color output functions
func sinoid_fadeout():
	return Color(1, 1, 1, abs(sin(MOD_ALPHA)))

func full_random_color():
	return Color(rng.randf(), rng.randf(), rng.randf())
	
