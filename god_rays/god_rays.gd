extends Sprite2D

func _process(_delta: float) -> void:
	var size: Vector2 = get_viewport().size
	scale.x = size.x
	scale.y = size.y * 1.3
	position.x = size.x / 2. + 200.
	position.y = size.y / 2. * 0.85
