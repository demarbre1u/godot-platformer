extends Area2D

@onready var game_manager = %GameManager
@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_body_entered(body):
	if body.name == "Player":
		animated_sprite_2d.animation = "collected"
		game_manager.add_to_score(10)



func _on_animated_sprite_2d_animation_finished():
	if(animated_sprite_2d.animation == "collected"):
		queue_free()
