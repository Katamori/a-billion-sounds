extends Node


# global randomizer
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
