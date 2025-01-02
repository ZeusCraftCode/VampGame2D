extends CharacterBody2D


const SPEED =2000.0
const JUMP_VELOCITY = -400.0

@onready var target=$"../../Spieler"
@onready var followPlayer = false

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
