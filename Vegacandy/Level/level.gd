extends Node2D
var evilCandy = preload("res://Character/badMob/evil_candy.tscn")
var evilCandy2 = preload("res://Character/badMob/evil_candy_2.tscn")
var evilCandy3 = preload("res://Character/badMob/evil_candy_3.tscn")
var cabbage = preload("res://Character/Mob/cabbage/cabbage.tscn")
var tomato = preload("res://Character/Mob/tomato/tomato.tscn")
var orange = preload("res://Character/Mob/orange/orange.tscn")
var corn = preload("res://Character/Mob/corn/corn.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var enemy = evilCandy.instantiate()
	add_child(enemy)
	enemy.position = $Spawn.position
	pass
	
func _on_spawn_timer_2_timeout():
	#var enemy2 = evilCandy2.instantiate()
	#add_child(enemy2)
	#enemy2.position = $Spawn.position
	pass

func _on_spawn_timer_3_timeout():
	#var enemy3 = evilCandy3.instantiate()
	#add_child(enemy3)
	#enemy3.position = $Spawn.position
	pass


func _on_cabbage_button_pressed():
	var cabbageMob = cabbage.instantiate()
	add_child(cabbageMob)
	cabbageMob.position = $Caravan.position	
	
func _on_tomato_button_pressed():
	var tomatoMob = tomato.instantiate()
	add_child(tomatoMob)
	tomatoMob.position = $Caravan.position

func _on_corn_button_pressed():
	var cornMob = corn.instantiate()
	add_child(cornMob)
	cornMob.position = $Caravan.position

func _on_orange_button_pressed():
	var orangeMob = orange.instantiate()
	add_child(orangeMob)
	orangeMob.position = $Caravan.position



