extends Label

var count := 0

func _ready() -> void:
	SignalBus.cracked.connect(_on_cracked)


func _on_cracked() -> void:
	count += 1
	text = "Cracked: " + str(count)
