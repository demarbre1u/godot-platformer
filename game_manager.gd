extends Node

@onready var score_label = $"../UI/Panel/ScoreLabel"

var score = 0

func add_to_score(points):
	score += points
	score_label.text = "Score : " + str(score)

func game_over():
	get_tree().reload_current_scene()
