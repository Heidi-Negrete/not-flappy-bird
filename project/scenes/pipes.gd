extends Node2D

const SCROLL_SPEED: float = 120.0


func _process(delta):
	position.x -= SCROLL_SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
