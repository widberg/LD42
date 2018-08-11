extends Label

func _process(delta):
	set_text("%0*d" % [6, Score.score])
	pass