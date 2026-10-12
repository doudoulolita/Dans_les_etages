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

	var keys =	["ui_left", "ui_right", "ui_up", "ui_down"] #nom des touches définiées dans les controles
	
	var input_dir := Input.get_vector(keys[0], keys[1], keys[2], keys[3])
	var direction := global_transform.basis * Vector3(input_dir.x, 0, input_dir.y) * SPEED		

	var dir_L = [270, direction.z, 0, 0] # (angle, direction x, direction y, direction z)
	var dir_R = [90, -direction.z, 0, 0] 
	var dir_U = [180, 0, 0, -direction.z] 
	var dir_D = [0, 0, 0, direction.z] 
	
	var directions = [dir_L, dir_R, dir_U, dir_D]

	if direction:
		for i in range (0,4):
			if Input.is_action_pressed(keys[i]):
				rotation_degrees.y = directions[i][0] #tourne le joueur dans la bonne direction
				velocity = Vector3(directions[i][1], directions[i][2], directions[i][3])

		move_and_slide()
