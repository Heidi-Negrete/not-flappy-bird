extends Node2D

const SPAWN_BOUNDARY = Vector2(158, 700)

@export var pipes_scene: PackedScene

@onready var pipe_timer = $PipeTimer
@onready var pipe_container = $PipeContainer



func _ready():
	spawn_pipes()
	pipe_timer.start()


func spawn_pipes():
	var pipes_scene_instance = pipes_scene.instantiate()
	pipe_container.add_child(pipes_scene_instance)
	pipes_scene_instance.global_position.x = 500
	pipes_scene_instance.global_position.y = randi_range(SPAWN_BOUNDARY.x, SPAWN_BOUNDARY.y) 


func _on_pipe_timer_timeout():
	pipe_timer.wait_time = randf_range(2.0, 4.0)
	pipe_timer.start()
	spawn_pipes()
