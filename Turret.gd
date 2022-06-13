extends RigidBody2D

var angular_speed = 5.0

onready var bullet = preload("res://prefabs/Bullet.tscn")
onready var muzzle = $Position2D

func _physics_process(delta):
	var angle = get_local_mouse_position().angle()
	if angle < 0:
		rotate(-angular_speed*delta)
	elif angle > 0:
		rotate(angular_speed*delta)
		
	if abs(angle) < .3:
		angular_speed = abs(angle / .3)
	else:
		angular_speed = 1
	
func _process(delta):
	
	if Input.is_action_just_pressed("tank_fire"):
		var shot = bullet.instance()
		owner.add_child(shot)
		shot.transform = muzzle.global_transform
	
	$Aimer.set_global_rotation_degrees(0)
	$Aimer.position = get_local_mouse_position()

	
	
