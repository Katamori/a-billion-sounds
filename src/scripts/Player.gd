extends Human
class_name Player

# player constants
var SPEED = 15000

var PROX_THRESHOLD = 85

# player state properties
var move_vector: Vector2

# nodes from other parts of the applications
onready var body = get_node("body")
onready var camera_pointer = get_node("pointer")
# todo: is it the only way?
onready var props = get_tree().get_nodes_in_group("props")

# inheritance override
var can_interact = false


func _init():
	move_vector = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Same as '_process' but with physics.
func _physics_process(delta):
	# basic movement and camera
	move_fluid(SPEED * delta)
	
	camera_pointer.set_position(body.get_position())
	
	look_for_interactions()
	
func _input(event):
	if(event.is_action("toggle_inventory")):
		print("toggle inventory")
		
# item proximity check
# todo: find out if it's an optimal solution
func look_for_interactions():
	var had_nearby_prop = false
	
	for prop in props:
		prop.is_active = body.get_global_position().distance_to(prop.get_global_position()) < PROX_THRESHOLD
		
		# if even only one prop signals is_active, player can interact
		had_nearby_prop = had_nearby_prop || prop.is_active
	pass
	
	can_interact = had_nearby_prop
	pass

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
