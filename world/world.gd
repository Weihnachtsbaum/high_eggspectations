extends Node2D

const EGG := preload("res://objects/egg/egg.tscn")
var spawn_timer := 0.

func _physics_process(delta: float) -> void:
	spawn_timer += delta
	if spawn_timer >= 4.:
		spawn_timer = 0.
		var egg := EGG.instantiate()
		var width: float = get_viewport().size.x
		egg.position.x = randf_range(width * 0.25, width * 0.75)
		egg.position.y = -26.
		add_child(egg)
