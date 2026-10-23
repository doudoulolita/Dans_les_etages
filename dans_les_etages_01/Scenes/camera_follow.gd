extends Camera3D

#class member variables go here
@export var distance_camera = 10
@export var height_camera = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var target = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin
	var up = Vector3(0,1,0)
	
	var offset = pos - target
	
	offset = offset.normalized()*distance_camera
	offset.y = height_camera
	
	pos = target + offset
	
	look_at_from_position(pos, target,up)
