extends Area2D

@onready var player = $"../../Player"

func _on_body_entered(body):
	if body.name == "Player":
		body.get_node("Sprite2D").play("disappearing")
		queue_free()
