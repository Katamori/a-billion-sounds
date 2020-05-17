extends Node2D

func _ready():
	pass
	
func _process(delta):
	# todo: check out if referring to Player as "owner" is error-prone
	set_visible(owner.can_interact)

	pass
