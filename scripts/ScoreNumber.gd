extends Label

func _process(delta):
	set_text("%06d" % Score.score)
	pass