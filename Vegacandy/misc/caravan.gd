extends Node2D
@export var hp =100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	if self.hp == 0 or self.hp < 0:
		get_tree().change_scene_to_file("res://Level/LoseTest.tscn")
