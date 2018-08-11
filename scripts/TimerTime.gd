extends Label

func _process(delta):
	if Score.timer.is_stopped():
		set_text(("%.2f" % Score.initial_time).pad_zeros(3))
	else:
		set_text(("%.2f" % Score.timer.time_left).pad_zeros(3))
	pass
