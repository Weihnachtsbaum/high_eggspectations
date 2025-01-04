extends Area2D

var speed := 300.
var direction: Vector2
var has_parachute := false
var touched_player := false

func _ready() -> void:
	if $Sprite.flip_h:
		direction = Vector2(1., 0.)
	else:
		direction = Vector2(-1., 0.)


func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		touched_player = true
		speed = 500.
		direction = Vector2(
			randf_range(-1., 1.),
			randf_range(-1., 0.)
		).normalized()
		if direction.x > 0.:
			$Sprite.flip_h = true
		elif direction.x < 0.:
			$Sprite.flip_h = false
		$Call.play()
