extends RigidBody2D

var angular_speed = 1.0
#var max_angular_speed = 1.0


onready var bullet = preload("res://prefabs/Bullet.tscn")
onready var muzzleFlash = preload("res://particles/MuzzleFlash.tscn")
onready var muzzle = $Position2D
onready var tank = $tank

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
	
func _process(delta):
	
	if Input.is_action_just_pressed("tank_fire"):
		var shot = bullet.instance()
		owner.add_child(shot)
		$fireSound.play()
		$muzzleFlash.emitting = true
		shot.transform = muzzle.global_transform
	
	$Aimer.set_global_rotation_degrees(0)
	$Aimer.position = get_local_mouse_position()


func _on_Turret_body_entered(body):
	angular_speed = 0.0
