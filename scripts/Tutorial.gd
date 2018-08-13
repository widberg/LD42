extends Node2D

func _process(delta):
	if Score.enable_tutorial:
		show()
	else:
		hide()
	pass
