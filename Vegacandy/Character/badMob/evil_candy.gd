extends CharacterBody2D
@export var hp =30
@export var speed = 60.0
var direction = -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
	
	
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
	
func die():
	$MobDetector.enabled = false
	$AnimationPlayer.play("die")
	
	direction = 0
	
func start_walk():
	$AnimationPlayer.play("walk")
		
func detect_player():
	if $MobDetector.is_colliding():
		$AnimationPlayer.play("attack")
	
func hit():
	$Hitbox.monitorable = true
func end_of_hit():
	$Hitbox.monitorable = false


func _on_hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	print_debug("candy took damage")
	print_debug(hitbox.damage)
	if self.hp == 0 or self.hp < 0:
		die()
