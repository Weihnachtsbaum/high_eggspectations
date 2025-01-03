extends Area2D

const GRAVITY := 150.
var y_vel := 0.

var parachute := false
const PARACHUTE_Y_VEL := 100.

func _physics_process(delta: float) -> void:
	if parachute:
		position.y += PARACHUTE_Y_VEL * delta
	else:
		y_vel += GRAVITY * delta
		position.y += y_vel * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		parachute = true
	else:
		queue_free()
