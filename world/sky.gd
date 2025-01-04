extends Sprite2D

func _process(_delta: float) -> void:
	var size: Vector2 = get_viewport().size
	scale = size
	position = size / 2.
