extends CharacterBody2D

signal crashed

@export var max_speed: float = 400.0
@export var acceleration: float = 300.0
@export var turn_speed: float = 3.0

var speed: float = 0.0
var touching_wall: bool = false


func _physics_process(delta: float) -> void:
	var turn := Input.get_axis("move_left", "move_right")
	rotation += turn * turn_speed * delta

	# El coche acelera solo, el jugador solo gira
	speed = move_toward(speed, max_speed, acceleration * delta)
	velocity = Vector2.RIGHT.rotated(rotation) * speed
	move_and_slide()

	# Solo cuenta como choque cuando empieza a tocar el muro
	var hit := get_slide_collision_count() > 0
	if hit and not touching_wall:
		speed = speed * 0.4
		crashed.emit()
	touching_wall = hit
