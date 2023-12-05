extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D


func _ready():
	animation_player.seek(randf_range(0, 1.5))


func _on_body_entered(body):
	var tween = create_tween()
	tween.tween_property(sprite_2d, "modulate", Color(1,1,1,0), 0.15).set_ease(Tween.EASE_OUT)
	#sprite_2d.modulate = Color(1,1,1,0) 


func _on_body_exited(body):
	var tween = create_tween()
	tween.tween_property(sprite_2d, "modulate", Color(1,1,1,0), 0.15).set_ease(Tween.EASE_OUT)
	#sprite_2d.modulate = Color(1,1,1,1)
