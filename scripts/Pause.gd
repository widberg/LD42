extends Node

var panel
var text
var resume
var main

func hide_all():
	panel.hide()
	text.hide()
	resume.hide()
	main.hide()
	pass
	
func show_all():
	panel.show()
	text.show()
	resume.show()
	main.show()
	pass
	
func _ready():
	panel = get_node("/root/Background/Pause/PausePanel")
	text = get_node("/root/Background/Pause/PauseText")
	resume = get_node("/root/Background/Pause/Resume")
	main = get_node("/root/Background/Pause/MainMenu")
	hide_all()
	pass

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
	pass

func toggle_pause():
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		show_all()
	else:
		hide_all()
	pass

func _on_Resume_pressed():
	get_tree().paused = false
	hide_all()
	pass


func _on_MainMenu_pressed():
	Score.timer.stop()
	Debris.timer.stop()
	Score.add_time = 30
	Score.score = 0
	Score.timer.set_wait_time(Score.initial_time)
	Debris.timer.set_wait_time(Debris.spawn_time)
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Main.tscn")
	pass
