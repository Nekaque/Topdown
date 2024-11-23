extends Area2D

var dir: Vector2 = Vector2.ZERO
@export var speed: float

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position += dir * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
