extends Node2D

const EGG := preload("res://objects/egg/egg.tscn")
const PARACHUTE := preload("res://parachute/parachute.tscn")
var egg_timer := 0.
var parachute_timer := 0.

func spawn_egg() -> void:
	var egg := EGG.instantiate()
	var width: float = get_viewport().size.x
	egg.position.x = randf_range(width * 0.25, width * 0.75)
	egg.position.y = -26.
	add_child(egg)


func spawn_parachute() -> void:
	var parachute := PARACHUTE.instantiate()
	var width: float = get_viewport().size.x
	if randi_range(0, 1):
		parachute.position.x = randf_range(width * 0.05, width * 0.2)
	else:
		parachute.position.x = randf_range(width * 0.8, width * 0.95)
	parachute.position.y = -26.
	add_child(parachute)


func _physics_process(delta: float) -> void:
	egg_timer += delta
	parachute_timer += delta
	if egg_timer >= 4.:
		egg_timer = 0.
		spawn_egg()
	if parachute_timer >= 2.:
		parachute_timer = 0.
		spawn_parachute()
