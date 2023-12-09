extends Node

signal score_finalized(score, is_new_high_score)

const SAVE_PATH = "user://player_data.json"

var save_data: Dictionary = {
	"high_score": 0
}
var score: int = 0
var is_new_high_score = false

func _ready() -> void:
	load_save_file()


func load_save_file() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
		
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	save_data = file.get_var()
	


func save() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(save_data)


func check_high_score() -> void:
	if score > save_data["high_score"]:
		save_data["high_score"] = score
		is_new_high_score = true
	save()
	score_finalized.emit(score, is_new_high_score)
