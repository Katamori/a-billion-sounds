extends Node2D

# Declare member variables here.
var SPEED = 200
var boundSpeed = SPEED
	
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	SPEED = boundSpeed * delta
	pass
	
func _input(event):
	if(event.is_pressed()):
		var current_position = get_position()
		
		print(event.get_device())
		print(event.as_text())
		print("---")

		if(event.is_action("move_up")):
			current_position.y -= SPEED
		
		if(event.is_action("move_down")):
			current_position.y += SPEED
		
		if(event.is_action("move_left")):
			current_position.x -= SPEED
		
		if(event.is_action("move_right")):
			current_position.x += SPEED
			
		set_position(current_position)
