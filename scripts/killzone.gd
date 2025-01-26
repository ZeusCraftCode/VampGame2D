extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(_body: Node2D) -> void:
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()


#Fullscreen an/aus
func _process(delta):
	if Input.is_action_just_pressed("Fullscreen"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif Input.is_action_just_pressed("Window"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
