extends Node2D

const SCROLL_SPEED: float = 120.0


func _process(delta):
	position.x -= SCROLL_SPEED * delta


func crash_plane(body):
	if not body.has_method("collide_with_pipes"):
		return
	body.collide_with_pipes()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_upper_pipe_body_entered(body):
	crash_plane(body)


func _on_lower_pipe_body_entered(body):
	crash_plane(body)
