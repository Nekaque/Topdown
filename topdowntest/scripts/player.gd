extends Area2D

var movement_dir: Vector2 = Vector2.ZERO
var look_dir: Vector2 = Vector2.UP
@export var speed: float

var should_shoot: bool

var bullet_scene = preload("res://scenes/bullet.tscn")

func _process(delta: float) -> void:
	read_input()
	move(delta)
	look()
	shoot()

func read_input() -> void:
	movement_dir = Vector2.ZERO
	if Input.is_action_pressed("left"):
		movement_dir.x -= 1
	if Input.is_action_pressed("right"):
		movement_dir.x += 1
	if Input.is_action_pressed("front"):
		movement_dir.y -= 1
	if Input.is_action_pressed("back"):
		movement_dir.y += 1
	if Input.is_action_just_pressed("shoot"):
		should_shoot = true
		
	look_dir = get_global_mouse_position()
	movement_dir = movement_dir.normalized()

func move(delta: float) -> void:
	position += delta * speed * movement_dir
	
func look() -> void:
	look_at(look_dir)
	rotation_degrees += 90
	
func shoot() -> void:
	if should_shoot:
		should_shoot = false
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.transform = get_global_transform()
		bullet_instance.dir = Vector2.RIGHT.rotated(deg_to_rad(rotation_degrees - 90))
		get_tree().root.add_child(bullet_instance)
