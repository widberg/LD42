extends Node

func _process(delta):
	if Score.enable_tutorial || Score.first_game:
		show()
	else:
		hide()
	pass
