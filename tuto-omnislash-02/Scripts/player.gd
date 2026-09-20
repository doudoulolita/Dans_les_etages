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
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:		
		if Input.is_action_pressed("ui_left"):
			rotation_degrees.y = 270
			velocity.x = direction.z * SPEED
		if Input.is_action_pressed("ui_right"):
			rotation_degrees.y = 90
			velocity.x = - direction.z * SPEED
		if Input.is_action_pressed("ui_up"):
			rotation_degrees.y = 180
			velocity.z = - direction.z * SPEED
		if Input.is_action_pressed("ui_down"):
			rotation_degrees.y = 0
			velocity.z = direction.z * SPEED
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
