extends Label

func _ready():
	set_text("%06d" % Score.score)
	Score.score = 0
	pass
