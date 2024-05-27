extends Button

@export var title_scene = PackedScene

func _on_pressed():
	get_tree().change_scene_to_packed(title_scene)
