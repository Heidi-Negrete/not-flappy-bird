extends Node2D

const SPAWN_BOUNDARY: Vector2 = Vector2(158, 700)
const SCROLL_SPEED: float = 30.0

@export var pipes_scene: PackedScene

@onready var pipe_timer = $PipeTimer as Timer
@onready var pipe_container = $PipeContainer as Node
@onready var parallax_background = $ParallaxBackground as ParallaxBackground
@onready var score_timer = $ScoreTimer

var label: Label

func _ready():
	spawn_pipes()
	pipe_timer.start()
	label = get_tree().get_first_node_in_group("score_label")

func _process(delta):
	parallax_background.scroll_offset.x -= SCROLL_SPEED * delta


func spawn_pipes():
	var pipes_scene_instance = pipes_scene.instantiate()
	pipe_container.add_child(pipes_scene_instance)
	pipes_scene_instance.global_position.x = 500
	pipes_scene_instance.global_position.y = randi_range(SPAWN_BOUNDARY.x, SPAWN_BOUNDARY.y) 


func _on_pipe_timer_timeout():
	pipe_timer.wait_time = randf_range(2.0, 3.0)
	pipe_timer.start()
	spawn_pipes()


func _on_score_timer_timeout():
	ScoresAndSaves.score += 1
	label.text = str(ScoresAndSaves.score)


func _on_plane_died():
	score_timer.stop()
