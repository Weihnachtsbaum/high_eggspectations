extends Sprite2D

@onready var parent := get_parent()

func _process(_delta: float) -> void:
	flip_h = parent.flip_h
