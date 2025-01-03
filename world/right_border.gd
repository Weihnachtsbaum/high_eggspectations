extends CollisionShape2D

func _physics_process(_delta: float) -> void:
	position.x = get_viewport().size.x
