extends "res://scripts/Tank.gd"


onready var parent = get_parent()
onready var atEase_dir = Vector2(1,0).rotated($Turret.global_rotation)


export (float) var turretSpeed
export (int) var detectRadius

var target = null

func _ready():
	$DetectRadius/CollisionShape2D.shape.radius = detectRadius
	

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		position = Vector2()
	else:
		#other movement code here
		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1,0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir, turretSpeed * delta).angle()
		print(current_dir)
	else:
		var target_dir = Vector2(1,0).rotated(self.global_rotation)
		var current_dir = Vector2(1,0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir, turretSpeed * delta).angle()


func _on_DetectRadius_body_entered(body):
	if body.name == "Player":
		target = body


func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null
