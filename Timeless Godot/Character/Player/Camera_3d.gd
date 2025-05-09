class_name Camera
extends Camera3D

static var captured: bool = true 
#this should be referenced when taking user input, determines whether or not the mouse is captured

func _ready() -> void:
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if(captured):
		if(event is InputEventMouseMotion):
				rotation.y -= event.relative.x * .005
				#Need to introduce vertical direction
		elif(event is InputEventKey):
			if(event.keycode == 4194305): #escape
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				captured = false
	elif(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT):
			Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
			captured = true
