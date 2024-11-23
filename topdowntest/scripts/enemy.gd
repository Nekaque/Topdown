extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		$CPUParticles2D.emitting = true
		var tween = get_tree().create_tween()
		tween.tween_property($Sprite2D, "modulate", Color.RED, 1)
		tween.tween_property($Sprite2D, "scale", Vector2(), 1)
		tween.tween_callback(queue_free)
		
