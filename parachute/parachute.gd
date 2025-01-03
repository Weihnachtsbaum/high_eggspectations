extends Area2D

const SPEED := 110.
var following: Node2D
var on_egg := false

func _physics_process(delta: float) -> void:
	if following != null:
		global_position.x = following.global_position.x
		global_position.y = following.global_position.y - 25.
	else:
		position.y += SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if not (body.has_parachute or on_egg):
			following = body
			body.has_parachute = true
	else:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Egg":
		if not area.parachute:
			following.has_parachute = false
			area.parachute = true
			following = area
			on_egg = true
			var sfx := $"../Parachute"
			sfx.position = position
			sfx.play()
			SignalBus.saved.emit()
