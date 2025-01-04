extends Area2D

const SPEED_BOOST := 500.
const JUMP_BOOST := -250.
const DURATION := 15.
var player: Node
var time := 0.

func _physics_process(delta: float) -> void:
	if player == null:
		return
	time += delta
	if time >= DURATION:
		player.speed -= SPEED_BOOST
		player.jump_speed -= JUMP_BOOST
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if visible and body.name == "Player":
		player = body
		player.speed += SPEED_BOOST
		player.jump_speed += JUMP_BOOST
		hide()
