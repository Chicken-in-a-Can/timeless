extends CharacterBody3D

const SPEED : float = 5.0
const JUMP_VELOCITY : float = 4.5

func collect_sighted_objects() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	#(but not adding yet)
	
	var direction : Vector3
	# Handle jump.
	if(Camera.captured):
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		var input_dir := Input.get_vector("move_left", "move_right", "move_forwards", "move_backwards")  
		direction = ($Camera3D.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized() #To make in direction of Camera rotation
		
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	
