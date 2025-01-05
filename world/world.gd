extends Node2D

const EGG := preload("res://objects/egg/egg.tscn")
const PARACHUTE := preload("res://parachute/parachute.tscn")
const RAVEN := preload("res://raven/raven.tscn")
const SPEED := preload("res://upgrades/speed/speed.tscn")
var egg_timer := 0.
var egg_timer_len := 4.
var parachute_timer := 0.
var parachute_timer_len := 2.
var raven_timer := 0.
var raven_timer_len := 15.
var speed_timer := 0.

var eggs: Node

func spawn_egg() -> void:
	var egg := EGG.instantiate()
	var width: float = get_viewport().size.x
	egg.position.x = randf_range(width * 0.25, width * 0.75)
	egg.position.y = -26.
	eggs.add_child(egg)


func spawn_parachute() -> void:
	var parachute := PARACHUTE.instantiate()
	var width: float = get_viewport().size.x
	if randi_range(0, 1):
		parachute.position.x = randf_range(width * 0.05, width * 0.2)
	else:
		parachute.position.x = randf_range(width * 0.8, width * 0.95)
	parachute.position.y = -26.
	add_child(parachute)


func spawn_raven() -> void:
	var size: Vector2 = get_viewport().size
	var raven := RAVEN.instantiate()
	if randi_range(0, 1):
		raven.position.x = -27.
		raven.get_node("Sprite").flip_h = true
	else:
		raven.position.x = size.x + 27.
	for egg: Area2D in eggs.get_children():
		if not egg.parachute:
			continue
		var raven_dist := absf(egg.position.x - raven.position.x)
		var time_needed: float = raven_dist / raven.speed
		var future_egg_y: float = egg.position.y + egg.PARACHUTE_Y_VEL * time_needed
		if size.y - future_egg_y < 200.:
			continue
		var future_parachute_y := future_egg_y - 25.
		raven.position.y = future_parachute_y
		add_child(raven)
		return


func spawn_speed() -> void:
	var speed := SPEED.instantiate()
	var size: Vector2 = get_viewport().size
	speed.position = Vector2(
		randf_range(27., size.x - 27.),
		-30.
	)
	add_child(speed)


func _ready() -> void:
	eggs = Node.new()
	eggs.name = "Eggs"
	add_child(eggs)


func _physics_process(delta: float) -> void:
	egg_timer += delta
	parachute_timer += delta
	raven_timer += delta
	speed_timer += delta
	if egg_timer >= egg_timer_len:
		egg_timer = 0.
		spawn_egg()
		if egg_timer_len > 3.:
			egg_timer_len -= 0.1
	if parachute_timer >= parachute_timer_len:
		parachute_timer = 0.
		spawn_parachute()
		if parachute_timer_len < 3.:
			parachute_timer_len += 0.05
	if raven_timer >= raven_timer_len:
		raven_timer = 0.
		spawn_raven()
		if raven_timer_len > 10.:
			raven_timer_len -= 1.
	if speed_timer >= 30.:
		speed_timer = 0.
		spawn_speed()
