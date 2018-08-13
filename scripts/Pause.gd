extends Node2D

func _ready():
	hide()
	var tutorial = get_node("/root/Background/Pause/Tutorial")
	tutorial.pressed = Score.enable_tutorial
	pass

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
	pass

func toggle_pause():
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		show()
	else:
		hide()
	pass

func _on_Resume_pressed():
	get_tree().paused = false
	hide()
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


func _on_Tutorial_toggled(button_pressed):
	Score.enable_tutorial = button_pressed
	Score.user_tutorial = true
	pass
