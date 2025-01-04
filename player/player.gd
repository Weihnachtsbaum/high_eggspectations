extends CharacterBody2D

var jump_speed := -500.
var speed := 500.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_parachute := false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		velocity.y = jump_speed
		$Flap.play()

func _physics_process(delta: float) -> void:
	velocity.x = Input.get_axis("left", "right") * speed
	if velocity.x != 0.:
		$Sprite.flip_h = velocity.x > 0.
	velocity.y += gravity * delta
	move_and_slide()
