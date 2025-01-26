extends CharacterBody2D
class_name Spieler

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var maxHealth = 100
@onready var currentHealth: int = maxHealth

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
const DASH_SPEED = 300.0
var HP = 100 
var dashing = false
var can_dash = true
var E = 1



#Laufen & Springen
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Springen") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("Dash") and is_on_floor() and can_dash:
		dashing = true
		can_dash = false
		$dash_cooldown.start()
		$dash_erneut.start()
	
	# Get the input direction
	var direction := Input.get_axis("Links-Laufen", "Rechts-Laufen")
	if dashing:
		velocity.x = direction * DASH_SPEED
	else:
		velocity.x = direction * SPEED
	
	#Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true 

	move_and_slide()
	
	#Dreht animation
	if direction > 0:
		animated_sprite.flip_h  = false
	elif direction < 0:
		animated_sprite.flip_h  = true

#Stoppt Dash nach Timer ablauf um unendlichen dash zu verhindern
func _on_dash_cooldown_timeout() -> void:
	dashing = false

#Ermöglicht erneutes Dashen nach Timer ablauf 
func _on_dash_erneut_timeout() -> void:
	can_dash  = true
