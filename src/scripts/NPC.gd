extends Node2D

# Name of the NPC character
export var character_name = "Name";

# Called when the node enters the scene tree for the first time.
func _ready():
	$tag.text = character_name
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
