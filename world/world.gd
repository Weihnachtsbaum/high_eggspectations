extends Node2D

const EGG := preload("res://objects/egg/egg.tscn")
var spawn_timer := 0.

func _physics_process(delta: float) -> void:
	spawn_timer += delta
	if spawn_timer >= 4.:
		spawn_timer = 0.
		var egg := EGG.instantiate()
		egg.position.x = get_viewport().size.x / 2.
		egg.position.y = 26.
		add_child(egg)
