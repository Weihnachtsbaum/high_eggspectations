extends Area2D

const GRAVITY := 250.
var y_vel := 0.

var speed := 300.
var jump_speed := -150.
var jump_timer := 0.
var x_dir: float
var target_y: float
var has_parachute := false
var touched_player := false

func _ready() -> void:
	if $Sprite.flip_h:
		x_dir = 1.
	else:
		x_dir = -1.
	target_y = position.y


func _physics_process(delta: float) -> void:
	position.x += x_dir * speed * delta
	y_vel += GRAVITY * delta
	position.y += y_vel * delta
	jump_timer += delta
	if position.y > target_y and jump_timer > 0.5:
		y_vel = jump_speed
		jump_timer = 0.


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		touched_player = true
		speed = 500.
		jump_speed = -300.
		if randi_range(0, 1):
			x_dir = 1.
		else:
			x_dir = -1.
		target_y = randf_range(-30., get_viewport().size.y - 200.)
		if x_dir > 0.:
			$Sprite.flip_h = true
		elif x_dir < 0.:
			$Sprite.flip_h = false
		$Call.play()
