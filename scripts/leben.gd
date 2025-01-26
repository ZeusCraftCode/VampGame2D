extends TextureProgressBar

@export var spieler: Spieler

func _ready():
	update()

func update():
	value = spieler.currentHealth * 100 / spieler.maxHealth
