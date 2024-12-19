extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -1500.0
var jumps_left = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 3
		$CollisionShape2D/AnimatedSprite2D.stop()
	if is_on_floor():
		jumps_left = 1

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif jumps_left == 1:
			velocity.y = JUMP_VELOCITY
			jumps_left = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$CollisionShape2D/AnimatedSprite2D.play("walk")
		$CollisionShape2D/AnimatedSprite2D.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$CollisionShape2D/AnimatedSprite2D.stop()

	move_and_slide()
