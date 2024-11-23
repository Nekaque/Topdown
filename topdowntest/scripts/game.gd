extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

func _on_spawn_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	#enemy.transform = get_global_transform()
	var player_pos = $Klara.position
	var angle = randi_range(0,359)
	var shift = randi_range(300,310)
	enemy.position = $Klara.position+shift*Vector2.from_angle(deg_to_rad(angle))
	get_tree().root.add_child(enemy)
	
	
