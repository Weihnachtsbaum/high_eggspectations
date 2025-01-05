extends Control

const END := preload("res://end/end.tscn")
var secs_left := 90.

func _physics_process(delta: float) -> void:
	size = get_viewport().size
	secs_left -= delta
	if floor(secs_left + delta) != floor(secs_left):
		var mins := floori(secs_left / 60.)
		var secs := floori(secs_left) % 60
		var seperator := ":" if secs > 9 else ":0"
		$Label.text = str(mins) + seperator + str(secs)
		if secs_left < 21.0 and secs % 2 == 0:
			$Label.label_settings.font_color = Color.CRIMSON
		elif secs_left < 21.:
			$Label.label_settings.font_color = Color.WHITE
	if secs_left <= 0.:
		get_parent().add_child(END.instantiate())
