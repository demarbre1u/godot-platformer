extends Control

@onready var game_manager = %GameManager

func _on_texture_button_pressed():
	if game_manager.is_paused: 
		return
		
	game_manager.togglePaused()
