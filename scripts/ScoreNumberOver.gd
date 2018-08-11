extends Label

func _ready():
	set_text("%06d" % Score.score)
	Score.score = 0
	Score.add_time = 30
	
	Score.timer.set_wait_time(Score.initial_time)
	pass
