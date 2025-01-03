extends CharacterBody2D

const JUMP_SPEED := -500.
const SPEED := 500.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_parachute := false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		velocity.y = JUMP_SPEED
		$Flap.play()

func _physics_process(delta: float) -> void:
	velocity.x = Input.get_axis("left", "right") * SPEED
	if velocity.x != 0.:
		$Sprite.flip_h = velocity.x > 0.
	velocity.y += gravity * delta
	move_and_slide()
