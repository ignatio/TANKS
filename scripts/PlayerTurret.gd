extends KinematicBody2D

var angular_speed = 1.0

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
	
	if angular_speed > 1.0:
		angular_speed = 1.0
