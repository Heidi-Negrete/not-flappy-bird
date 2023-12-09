extends CharacterBody2D

signal died

const GRAVITY: float = 25.0
const POWER: float = -400.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var collision_shape_2d = $CollisionShape2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var game_over: PackedScene = preload("res://scenes/game_over.tscn")


func _physics_process(_delta) -> void:
	velocity.y += GRAVITY
	boost_plane()
	move_and_slide()
	
	if is_on_floor():
		crash()


func boost_plane() -> void:
	if Input.is_action_just_pressed("boost"):
		velocity.y = POWER
		var tween = create_tween()
		tween.tween_property(animated_sprite_2d, "rotation_degrees", -20, 0.4).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
		tween.tween_property(animated_sprite_2d, "rotation_degrees", 0, 0.4)


func crash() -> void:
	audio_stream_player_2d.stop()
	set_physics_process(false)
	died.emit()
	animation_player.play("crash")
	await animation_player.animation_finished
	var game_over_instance = game_over.instantiate()
	get_tree().get_first_node_in_group('UI').add_child(game_over_instance)
	queue_free()

func collide_with_pipes():
	collision_shape_2d.disabled = true
	crash()
