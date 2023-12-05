extends CharacterBody2D

const GRAVITY: float = 25.0
const POWER: float = -400.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer


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
	set_physics_process(false)
	animation_player.play("crash")
