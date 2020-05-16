extends Node2D

# Declare member variables here. Examples:
var move_vector = Vector2(0, 0)
var SPEED = 15000

onready var body = get_node("Human/kinematicBody2D")
onready var camera_pointer = get_node("Human/pointer")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Same as '_process' but with physics.
func _physics_process(delta):
	move_fluid(SPEED * delta)
	
	camera_pointer.set_position(body.get_position())
	pass
	
func _input(event):
	if(event.is_action("toggle_inventory")):
		print("toggle inventory")
		

func move_fluid(speed):
	if(Input.is_action_pressed("move_up")):
		move_vector.y = -speed
	
	if(Input.is_action_pressed("move_down")):
		move_vector.y = speed
	
	if(Input.is_action_pressed("move_left")):
		move_vector.x = -speed
	
	if(Input.is_action_pressed("move_right")):
		move_vector.x = speed
		
	# release
	if(Input.is_action_just_released("move_up")):
		move_vector.y = 0
	
	if(Input.is_action_just_released("move_down")):
		move_vector.y = 0
	
	if(Input.is_action_just_released("move_left")):
		move_vector.x = 0
	
	if(Input.is_action_just_released("move_right")):
		move_vector.x = 0

	body.move_and_slide(move_vector)

	pass
