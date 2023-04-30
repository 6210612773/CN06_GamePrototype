extends CharacterBody2D
@export var hp =50
@export var speed = 30.0
var direction = 1
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if $AnimationPlayer.current_animation == "attack":
		return
	detect_player()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	


func hit():
	$Hitbox.monitorable = true
	#print_debug("on")
func end_of_hit():
	$Hitbox.monitorable = false


func die():
	$MobDetector.enabled = false
	$AnimationPlayer.play("die")
	direction = 0
	
func detect_player():
	if $MobDetector.is_colliding():
		$AnimationPlayer.play("attack")
		
func start_walk():
	$AnimationPlayer.play("walk")
	


func _on_hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	print_debug("cabbage took damage")
	if self.hp == 0 or self.hp < 0:
		die()
