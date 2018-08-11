extends Node

var score
var timer

func _ready():
	score = 0
	
	timer = Timer.new()
	add_child(timer)
	
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	timer.start()
	pass
	
func _on_Timer_timeout():
	Score.score += 100
	pass
