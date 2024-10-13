extends SpringArm3D

var test = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotate_y(0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)
		rotate_y(.005 * -event.relative.x)
		test = transform.basis.x.x
		rotate_x(-test)
		rotate_x((.005 * event.relative.y * .5)+test)
		#rotate_z((.005 * event.relative.y * .5)+test) #havin a spot of bother with this one
