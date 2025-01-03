extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var inv: Inv

#Laufen &S pringen
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Springen") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction
	var direction := Input.get_axis("Links-Laufen", "Rechts-Laufen")
	
	#Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true 
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#Dreht animation
	if direction > 0:
		animated_sprite.flip_h  = false
	elif direction < 0:
		animated_sprite.flip_h  = true
	
