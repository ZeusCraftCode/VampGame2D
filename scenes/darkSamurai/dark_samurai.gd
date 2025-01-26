extends CharacterBody2D


const SPEED =2000.0
const JUMP_VELOCITY = -400.0

@onready var target=$"../../Spieler"
@onready var followPlayer = false
@export var maxHealth = 100
@onready var currentHealth: int = maxHealth
signal healthChanged

func _ready() -> void:
	if not target:
		print("Warnung: Spieler-Node wurde nicht gefunden!")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# fügt Playerverfolgung hinzu
	if followPlayer:
		var direction = (target.position - position).normalized()
		velocity.x = direction.x * SPEED * delta
		if $AnimatedSprite2D.animation != "attack":
			$AnimatedSprite2D.flip_h = direction.x < 0
	
	move_and_slide()



func playerEnteredNoticeArea(body: Node2D) -> void:
	if body == target:
		print("In: " + body.to_string())
		followPlayer = true


func playerExitedNoticeArea(body: Node2D) -> void:
	if body == target:
		print("Out")
		velocity.x = 0
		followPlayer = false

func playerEnteredAttackArea(body: Node2D) -> void:
	if body == target:
		print("Attack")
		$AnimatedSprite2D.play("attack")
		currentHealth -= 5
		print(currentHealth)
