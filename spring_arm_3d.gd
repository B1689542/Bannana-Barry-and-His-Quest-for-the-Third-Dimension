extends SpringArm3D

var test = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotate_y(45)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)
		#rotate_y(.005 * -event.relative.x)
		test = event.relative.y
		rotate_x(.005 * test * .5)
		rotate_z(.005 * test * -.5) #havin a spot of bother with this one
