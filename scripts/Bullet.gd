extends Area2D

export(int) var bulletSpeed
var movement = Vector2()
onready var mouse_pos = null

func _ready():
	set_as_toplevel(true)
	mouse_pos = get_local_mouse_position()

	

func _physics_process(delta):
	if not $notifier.is_on_screen():
		queue_free()
	position += transform.x * bulletSpeed * delta
	

#outside bounds calculation
func is_outside_view_bounds():
	return position.x>OS.get_screen_size().x or position.x<0.0 or position.y>OS.get_screen_size().y or position.y<0.0


#func _on_Bullet_area_entered(area):
#	queue_free() # Replace with function body.
func boom():
		if $blast.playing == false:
			$blast.play()
		$Sprite.visible = false
		$explosion.set_global_rotation_degrees(0)
		$explosion.play()
		bulletSpeed = 0	

func _on_Bullet_body_entered(body):
	if body.is_in_group("targetable"):
		boom()
		#queue_free() # Replace with function body.


func _on_explosion_animation_finished():
	pass
	#queue_free() # Replace with function body.


func _on_Bullet_area_entered(area):
	if area.is_in_group("targetable"):
		boom()
		

func _on_blast_finished():
	queue_free() # Replace with function body.
