extends Node

var score = 0
var timer
var initial_time = 30.0
var min_time = 10.0
var max_time = 60.0
var add_time = 30
var high_score = 0
var enable_tutorial = true
var first_game = true
var user_tutorial = false

func _ready():
	OS.set_window_maximized(true)
	timer = Timer.new()
	add_child(timer)
	
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(initial_time)
	timer.set_one_shot(true)
	pass

func _on_Timer_timeout():
	timer.stop()
	Debris.timer.stop()
	if score > high_score:
		high_score = score 
	get_tree().change_scene("res://scenes/GameOver.tscn")
	Score.add_time = 30
	Score.timer.set_wait_time(Score.initial_time)
	Debris.timer.set_wait_time(Debris.spawn_time)
	if !user_tutorial && first_game:
		enable_tutorial = false
	first_game = false
	pass
