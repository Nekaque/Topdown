extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

func _on_spawn_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.transform = get_global_transform()
	var player_pos = $Klara.position
	var x = randi_range(100,300)*sign(randf()-0.5)
	var y = randi_range(100,300)*sign(randf()-0.5)
	enemy.position.x = player_pos.x+x
	enemy.position.y = player_pos.y+y
	get_tree().root.add_child(enemy)
	
	
