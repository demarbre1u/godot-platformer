extends Area2D

@export var target_scene = PackedScene

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().call_deferred("change_scene_to_packed", target_scene);
