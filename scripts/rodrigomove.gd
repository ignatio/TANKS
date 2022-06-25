# Movement where the character rotates and moves forward or backward.
extends RigidBody2D

export var enginePower = 200
export var rotationPower = 10000
export var maxAngular = 1.0
export var maxPower = Vector2(0,1000)

var thrust = Vector2()
var rotationDir = 0

func get_input():
	if Input.is_action_pressed("tank_fwd"):
		thrust = Vector2(enginePower, 0)
	elif Input.is_action_pressed("tank_bk"):
		thrust = Vector2(-enginePower, 0)
	else:
		thrust = Vector2()
	if Input.is_action_pressed("tank_right"):
		rotationDir = 1
	if Input.is_action_pressed("tank_left"):
		rotationDir = -1
	if not Input.is_action_pressed("tank_right") and not Input.is_action_pressed("tank_left"):
		rotationDir = 0		
		
func _process(delta):
	get_input()
	
func _physics_process(delta):
	set_applied_force(thrust.rotated(rotation))
	set_applied_torque(rotationDir * rotationPower)
	if angular_velocity >= maxAngular:
		angular_velocity = maxAngular
	if thrust.y > maxPower.y:
		thrust.y = maxPower.y
#
#func  _integrate_forces(delta):
#	if not Input.is_action_pressed("tank_fwd") and not Input.is_action_pressed("tank_bk"):
#		set_applied_force(Vector2(0,0))
#	if not Input.is_action_pressed("tank_right") and not Input.is_action_pressed("tank_left"):
#		set_applied_torque(0)
#	if Input.is_action_pressed("tank_fwd"):
#		apply_impulse(Vector2(), fore)
#	if Input.is_action_pressed("tank_bk"):
#		apply_impulse(Vector2(), Vector2(0, enginePower))		
#	if Input.is_action_pressed("tank_right"):
#		add_torque(100000.0)	
#	if Input.is_action_pressed("tank_left"):
#		add_torque(-100000.0)	
#onready var tanksp_anim = $tanksp
#
## Movement speed in pixels per second.
#export var speed := 0
## Rotation speed in radians per second.
#export var angular_speed := 1.0
#
#export var max_speed := 200
##maybe something else
#var accel := 500
#var friction := accel / 2.0
#
#func _physics_process(delta):
#
#	#speed += friction * delta
#	#if speed < 0:
#	#	speed = 0
#
#	if speed > 0:
#		speed -= friction * delta
#		if speed < 0:
#			speed = 0
#
#	if speed < 0:
#		speed += friction * delta
#		if speed > 0:
#			speed = 0
#
#	if Input.is_action_pressed("tank_fwd"):
#		speed += accel * delta
#		if speed > max_speed:
#			speed = max_speed
#		if Input.is_action_pressed("speed_boost") and not Input.is_action_pressed("tank_bk"):
#			speed += speed + 100
#		if speed > (max_speed + 100):
#			speed = (max_speed + 100)
#		if speed < (-max_speed - 100):
#			speed = (-max_speed - 100)
#
#	if Input.is_action_pressed("tank_bk"):
#		speed -= accel * delta
#		if speed < -max_speed:
#			speed = -max_speed
#
#
#	# See how we're using Input.get_action_strength() to calculate the direction we rotate.
#	# The value will be in the [-1.0, 1.0] range.
#	var rotate_direction := Input.get_action_strength("tank_right") - Input.get_action_strength("tank_left")
#	rotation += rotate_direction * angular_speed * delta
#	# Below, we calculate the forward or backward move direction and directly multiply it to calculate a velocity.
#	# `transform.y` stores the node's local axes, allowing us to move it in the direction it's currently facing.
#	var velocity := -transform.y * speed
#	move_and_slide(velocity)
#
#func _process(delta):
#	if speed >= 10 or speed <= -10:
#		tanksp_anim.play("move")
#		$"Particles/Sand Puff/Particles2D".set_emitting(true)
#		$"Particles/Sand Puff2/Particles2D".set_emitting(true)
#	else:
#		tanksp_anim.stop()
#		$"Particles/Sand Puff/Particles2D".set_emitting(false)
#		$"Particles/Sand Puff2/Particles2D".set_emitting(false)
