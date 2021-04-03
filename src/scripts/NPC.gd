extends Human
class_name NPC

# Name of the NPC character
export var character_name: String;

func _init():
	character_name = "Name";


# Called when the node enters the scene tree for the first time.
func _ready():
	$tag.text = character_name
	
	# set modulate to that of parent
	# todo: handle if parent is null or has no modulate
	var baseMod = get_parent().get_modulate()
	set_modulate(baseMod)
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
