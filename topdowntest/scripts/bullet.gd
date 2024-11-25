extends Area2D

var dir: Vector2 = Vector2.ZERO
var speed: float = 2000

func _process(delta: float) -> void:
	position += dir * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
