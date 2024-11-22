extends Area2D

var movement_dir: Vector2 = Vector2.ZERO
@export var speed: float = 1000

var should_shoot: bool

var bullet_scene = preload("res://scenes/bullet.tscn")

func _process(delta: float) -> void:
	read_input()
	move(delta)
	#look()
	shoot()
	
func move(delta: float) -> void:
	position += delta * speed * movement_dir

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
	movement_dir = movement_dir.normalized()

func shoot() -> void:
	if should_shoot:
		var mouse = get_global_mouse_position()
		var direction = (mouse - position).normalized()
		should_shoot = false
		var projectile = bullet_scene.instantiate()
		get_parent().add_child(projectile)
		projectile.position = position
		projectile.dir = direction
