extends Label

var count := 0

func _ready() -> void:
	SignalBus.saved.connect(_on_saved)


func _on_saved() -> void:
	count += 1
	text = "Saved: " + str(count)
