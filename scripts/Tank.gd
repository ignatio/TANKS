extends KinematicBody2D

signal health_changed
signal dead

export (PackedScene) var Bullet
export (int) var speed
export (float) var rotationSpeed
export (float) var gunCooldown
export (int) var health

var velocity = Vector2()
var canShoot = true
var alive = true


func _ready():
	$GunTimer.wait_time = gunCooldown

func control(delta):
	pass
	
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)	
