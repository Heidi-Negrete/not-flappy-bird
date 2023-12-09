extends CanvasLayer

@onready var high_score = $MarginContainer/HighScore


func _ready():
	high_score.text = 'High Score: %d' % ScoresAndSaves.save_data["high_score"]


func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
