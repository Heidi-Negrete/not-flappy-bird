extends CanvasLayer

#@onready var main_scene = preload("res://scenes/main.tscn")



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
