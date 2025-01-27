extends TextureProgressBar
@onready var ausdauer: TextureProgressBar = $"."

var max_ausdauer = 100

func _ready():
	ausdauer.value = max_ausdauer


func _on_aufladen_timeout():
	ausdauer.value += 1
