extends Node2D


# Declare member variables here. Examples:
# var a = 2
var current_position = get_position()
var SPEED = 200
var deltaSpeed = SPEED

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_fluid(SPEED * delta)
	pass
	
func _input(event):
	if(event.is_action("toggle_inventory")):
		print("toggle inventory")
		
# Event-based movement is jut not fluid for me
func move_fluid(speed):
	if(Input.is_action_pressed("move_up")):
		current_position.y -= speed
	
	if(Input.is_action_pressed("move_down")):
		current_position.y += speed
	
	if(Input.is_action_pressed("move_left")):
		current_position.x -= speed
	
	if(Input.is_action_pressed("move_right")):
		current_position.x += speed
		
	set_position(current_position)
	pass
