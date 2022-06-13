# Movement where the character rotates and moves forward or backward.
extends KinematicBody2D

onready var tanksp_anim = $tanksp
 
# Movement speed in pixels per second.
export var speed := 0
# Rotation speed in radians per second.
export var angular_speed := 2.0
 
export var max_speed := 200
#maybe something else
var accel := 500
var friction := accel / 2.0
 
func _physics_process(delta):
 
	#speed += friction * delta
	#if speed < 0:
	#	speed = 0
	
	if speed > 0:
		speed -= friction * delta
		if speed < 0:
			speed = 0

	if speed < 0:
		speed += friction * delta
		if speed > 0:
			speed = 0
 
	if Input.is_action_pressed("tank_fwd"):
		speed += accel * delta
		if speed > max_speed:
			speed = max_speed
	if Input.is_action_pressed("tank_bk"):
		speed -= accel * delta
		if speed < -max_speed:
			speed = -max_speed
	if Input.is_action_pressed("speed_boost"):
		speed += speed + 100
	if speed > (max_speed + 100):
		speed = (max_speed + 100)
 
	# See how we're using Input.get_action_strength() to calculate the direction we rotate.
	# The value will be in the [-1.0, 1.0] range.
	var rotate_direction := Input.get_action_strength("tank_right") - Input.get_action_strength("tank_left")
	rotation += rotate_direction * angular_speed * delta
	# Below, we calculate the forward or backward move direction and directly multiply it to calculate a velocity.
	# `transform.y` stores the node's local axes, allowing us to move it in the direction it's currently facing.
	var velocity := -transform.y * speed
	move_and_slide(velocity)

func _process(delta):
	if speed >= 10 or speed <= -10:
		tanksp_anim.play("move")
	else:
		tanksp_anim.stop()
