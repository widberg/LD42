extends Node

var spawn_time = 1.0
var objectNames = ["Tire", "Trash", "Mug", "Pot", "Brick"]
var objects = []
var should_spawn
var timer
var new_transform
var debris

func _ready():
	for objectName in objectNames:
		objects.append(load("res://scenes/object/" + objectName + ".tscn"))
	timer = Timer.new()
	add_child(timer)
	
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(spawn_time)
	timer.set_one_shot(false)
	
	should_spawn = false
	pass

func _physics_process(delta):
	if should_spawn:
		debris = objects[rand_range(0, objects.size())].instance()
		new_transform = debris.get_transform()
		new_transform.origin = Vector2(rand_range(64, 1856), rand_range(64, 1016))
		debris.set_transform(new_transform)
		debris.apply_impulse(Vector2(), Vector2(rand_range(-250, 250), rand_range(-250, 250)))
		get_node("/root/Background/Debris").add_child(debris)
		should_spawn = false
	pass
	
func _on_Timer_timeout():
	should_spawn = true
	pass
