extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -700.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("echap"):
		get_tree().quit()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		# $Sprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()