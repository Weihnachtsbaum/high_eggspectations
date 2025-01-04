extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_paused()


func _process(_delta: float) -> void:
	size = get_viewport().size


func toggle_paused() -> void:
	var tree := get_tree()
	tree.paused = not tree.paused
	visible = not visible
