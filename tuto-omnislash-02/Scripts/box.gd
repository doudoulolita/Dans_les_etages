class_name Box
extends RigidBody3D

@export var player : Player

func _ready():
	print("debut box")	
	print("HP player : ", player.player_hp)
