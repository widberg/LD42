extends Node2D

var checkedt
var uncheckedt
var tex
var tutorial

func _ready():
	hide()
	tutorial = get_node("/root/Background/Pause/Tutorial")
	tutorial.pressed = Score.enable_tutorial
	checkedt = load("res://assets/texture/CheckedBox.png")
	uncheckedt = load("res://assets/texture/UncheckedBox.png")
	tex = get_child(4).get_child(0)
	pass

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
	if tutorial.pressed:
		tex.set_texture(checkedt)
	else:
		tex.set_texture(uncheckedt)
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
