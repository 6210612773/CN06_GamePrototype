extends TextureButton
@export var cooldown_time = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()
	$TextureProgressBar.value = 0
	$TextureProgressBar.texture_progress = texture_normal
	$Timer.wait_time=cooldown_time
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "%0.1f" % $Timer.time_left
	$TextureProgressBar.value=int(($Timer.time_left/cooldown_time)*100)
	pass


func _on_timer_timeout():
	disabled = false
	$Label.hide()
	pass # Replace with function body.
	

func _on_pressed():
	disabled = true
	$Label.show()
	$Timer.start()
	set_process(true)
	pass # Replace with function body.
