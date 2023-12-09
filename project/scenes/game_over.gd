extends CanvasLayer

var score_received = false

@onready var score_label = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ScoreLabel
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


func _ready():
	ScoresAndSaves.score_finalized.connect(on_score_finalized)
	ScoresAndSaves.check_high_score()


func _input(event):
	if score_received:
		if Input.is_action_pressed("continue"):
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func on_score_finalized(score, is_new_high_score):
	score_label.text = 'Score: %d' % score
	if is_new_high_score:
		pass # animate new high score label
	score_received = true
