extends "res://Hitbox/hitbox.gd"

@export var damage : int = 15
@export var speed : int = 100

func _physics_process(delta):
	var direction = Vector2.LEFT.rotated(rotation)
	global_position += speed *direction *delta
	
func destroy():
	queue_free()

func _on_area_entered(area):
	destroy()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
