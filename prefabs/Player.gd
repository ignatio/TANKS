extends "res://scripts/Tank.gd"

func control(delta):
	#$Turret.look_at(get_global_mouse_position())
	var rotDir = 0
	if Input.is_action_pressed("tank_right"):
		rotDir += 1
	if Input.is_action_pressed("tank_left"):
		rotDir -= 1
	rotation += rotationSpeed * rotDir * delta
	velocity = Vector2()
	if Input.is_action_pressed("tank_fwd"):
		velocity = Vector2(0, -speed).rotated(rotation)
	if Input.is_action_pressed("tank_bk"):
		velocity = Vector2(0, speed).rotated(rotation)
		
		
func _ready():
	pass
