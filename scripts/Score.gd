extends Node

var score
var timer
var initial_time = 30.0
var min_time = 10.0
var max_time = 60.0
var add_time

func _ready():
	score = 0
	add_time = 30
	
	timer = Timer.new()
	add_child(timer)
	
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(initial_time)
	timer.set_one_shot(true)
	pass
	
func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/GameOver.tscn")
	pass
