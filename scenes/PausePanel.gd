extends Panel

@onready var game_manager = %GameManager

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_manager.is_paused: 
		show()
	else: 
		hide()
