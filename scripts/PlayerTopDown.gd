extends KinematicBody2D


#export var speed = 10
#var rotation_speed = 2.0
#export var friction = 0.1
#export var acceleration = 0.001
#
#var velocity = Vector2()
#var rotation_dir = 0
#
#onready var turrsp = $turrsp
onready var tanksp_anim = $tanksp

var velocity = 0

# Movement speed in pixels per second.
export var speed := 100
# Rotation speed in radians per second.
export var angular_speed := 2.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# See how we're using Input.get_action_strength() to calculate the direction we rotate.
	# The value will be in the [-1.0, 1.0] range.
	var rotate_direction := Input.get_action_strength("tank_right") - Input.get_action_strength("tank_left")
	rotation += rotate_direction * angular_speed * delta
	# Below, we calculate the forward or backward move direction and directly multiply it to calculate a velocity.
	# `transform.y` stores the node's local axes, allowing us to move it in the direction it's currently facing.
	var velocity := (Input.get_action_strength("tank_bk") - Input.get_action_strength("tank_fwd")) * transform.y * speed
	move_and_slide(velocity)
	
	
#func _physics_process(delta):
#	rotation_dir = 0
#
#	if Input.is_action_pressed("tank_right"):
#		rotation_dir += 1
#
#	if Input.is_action_pressed("tank_left"):
#		rotation_dir -= 1
#
#	if Input.is_action_pressed("tank_bk"):
#		velocity += transform.y
#		#velocity = lerp(velocity, velocity * speed, acceleration)
#
#	if Input.is_action_pressed("tank_fwd"):
#		velocity -= transform.y
#		#velocity = lerp(velocity, velocity * speed, acceleration)
#
#	#if !Input.is_action_pressed("tank_bk") and !Input.is_action_pressed("tank_fwd"):	
#		#velocity = lerp(velocity, Vector2.ZERO, friction)	
#
#	rotation += rotation_dir * rotation_speed * delta	
#	move_and_slide(velocity)


func _process(delta):
	if velocity >= 10 or velocity <= -10:
		tanksp_anim.play("move")
	else:
		tanksp_anim.stop()
		
