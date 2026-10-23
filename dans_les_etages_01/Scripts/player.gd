class_name Player
extends CharacterBody3D

@export var player_hp = 1

const SPEED = 8
const JUMP_VELOCITY = 10

func _ready() -> void:
	print("début")
	
func _on_box_1_body_entered(_body):
	if(_body.name == "Player"):
		print("box 1")
	
func _on_box_2_body_entered(_body):
	if(_body.name == "Player"):
		print("box 2") # Replace with function body.		

func _physics_process(_delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	var direction := global_transform.basis * Vector3(input_dir.x, 0, input_dir.y) * SPEED
	
	if direction :		

		if Input.is_action_pressed("walk_left"):
			rotation_degrees.y = 90 #tourne le joueur dans la bonne direction
			velocity = Vector3(direction.z, 0, 0)
		if Input.is_action_pressed("walk_right"):
			rotation_degrees.y = 270 #tourne le joueur dans la bonne direction
			velocity = Vector3(-direction.z, 0, 0)
		if Input.is_action_pressed("walk_up"):
			rotation_degrees.y = 0 #tourne le joueur dans la bonne direction
			velocity = Vector3(0, 0, -direction.z)
		if Input.is_action_pressed("walk_down"):
			rotation_degrees.y = 180 #tourne le joueur dans la bonne direction
			velocity = Vector3(0, 0, direction.z)
			
	else : 
		velocity = Vector3(0, velocity.y, 0)
	
	move_and_slide()
