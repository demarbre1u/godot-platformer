extends Area2D

@onready var game_manager = %GameManager

func _on_body_entered(body):
	if body.name == "Player":
		game_manager.add_to_score(10)
		queue_free()
