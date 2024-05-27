extends Button

@onready var game_manager = %GameManager

func _on_pressed():
	game_manager.togglePaused()
