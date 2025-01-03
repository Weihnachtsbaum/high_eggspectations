extends StaticBody2D

func _physics_process(_delta: float) -> void:
	var viewport_size: Vector2 = get_viewport().size
	position.x = viewport_size.x / 2.
	position.y = viewport_size.y
	scale.x = viewport_size.x / 10.
