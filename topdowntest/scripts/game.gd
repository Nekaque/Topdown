extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

func _on_spawn_timer_timeout() -> void:
	var bullet_instance = enemy_scene.instantiate()
	bullet_instance.transform = get_global_transform()
	var player_pos = $Klara.position
	bullet_instance.position.x = player_pos.x+400
	bullet_instance.position.y = player_pos.y+400
	get_tree().root.add_child(bullet_instance)
	
	
