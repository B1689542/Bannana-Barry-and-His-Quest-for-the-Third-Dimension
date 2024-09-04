extends CharacterBody3D

#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 4.0  # movement speed
var jump_speed = 6.0  # determines jump height
var mouse_sensitivity = 0.002  # turning speed

func get_input():
	var input = Input.get_vector("strafe_left", "strafe_right", "move_forward", "move_back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed

func _physics_process(delta):
	get_input()
	$MeshInstance3D.look_at(transform.origin + velocity + Vector3(0,1,0), Vector3(0, 1, 0))
	#velocity.y += -gravity * delta
	move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$MeshInstance3D.rotate_y(-(-event.relative.x * mouse_sensitivity))
		$CollisionShape3D.rotate_y(-(-event.relative.x * mouse_sensitivity))
		
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
