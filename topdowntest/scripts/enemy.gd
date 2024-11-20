extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'bullet':
		var tween = get_tree().create_tween()
		tween.tween_property($Sprite, "modulate", Color.RED, 0.1)
		tween.tween_callback($Sprite.queue_free)
