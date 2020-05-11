extends Node2D


# Declare member variables here. Examples:
# var a = 2
var current_position = get_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var SPEED = 200 * delta

	
	if(Input.is_action_pressed("move_up")):
		current_position.y -= SPEED
	
	if(Input.is_action_pressed("move_down")):
		current_position.y += SPEED
	
	if(Input.is_action_pressed("move_left")):
		current_position.x -= SPEED
	
	if(Input.is_action_pressed("move_right")):
		current_position.x += SPEED
		

		
		
		
		
	set_position(current_position)
	
	
	pass
	
func _input(event):
	if(event.is_pressed()):
		print(event.get_device())
		print(event.as_text())
		print("---")
