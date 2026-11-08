extends Node2D

var race_time: float = 0.0
var racing: bool = false
var checkpoint_passed: bool = false
var crashes: int = 0


func _ready() -> void:
	$Car.set_physics_process(false)
	update_crashes()
	$StartTimer.start()


func _process(delta: float) -> void:
	if racing:
		race_time += delta
		if race_time > 1.0:
			$StatusLabel.text = ""
	elif not $StartTimer.is_stopped():
		# Cuenta atrás: 3, 2, 1
		$StatusLabel.text = str(ceili($StartTimer.time_left))

	$TimeLabel.text = "Tiempo: %.2f s" % race_time

	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()


func update_crashes() -> void:
	$CrashLabel.text = "Choques: " + str(crashes)


func _on_start_timer_timeout() -> void:
	racing = true
	$Car.set_physics_process(true)
	$StatusLabel.text = "¡Ya!"


func _on_checkpoint_body_entered(body: Node2D) -> void:
	if body == $Car:
		checkpoint_passed = true


func _on_finish_body_entered(body: Node2D) -> void:
	# Al salir también se cruza la meta, por eso hace falta el checkpoint
	if body == $Car and racing and checkpoint_passed:
		racing = false
		$Car.set_physics_process(false)
		$StatusLabel.text = "¡Meta! %.2f s\nPulsa R para repetir" % race_time


func _on_car_crashed() -> void:
	crashes += 1
	update_crashes()
