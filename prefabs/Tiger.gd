extends RigidBody2D

onready var parent = get_parent()
export var speed = 150

func _ready():
	pass # Replace with function body.

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
	else:
		#other movement code here
		pass


