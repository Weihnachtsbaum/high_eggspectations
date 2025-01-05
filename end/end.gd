extends Control


func _ready() -> void:
	get_tree().paused = true
	var saved: int = $"../Stats/Saved".count
	var cracked: int = $"../Stats/Cracked".count
	$Saved.text = "Eggs saved: " + str(saved)
	$Cracked.text = "Eggs cracked: " + str(cracked)
	$Score.text = "Score: " + str(saved - cracked)
	$"../Stats".hide()
	$"../Timer".queue_free()


func _process(_delta: float) -> void:
	size = get_viewport().size


func _on_quit_pressed() -> void:
	var tree := get_tree()
	tree.paused = false
	tree.change_scene_to_file("res://main_menu/main_menu.tscn")


func _on_continue_pressed() -> void:
	$"../Stats".show()
	get_tree().paused = false
	queue_free()
