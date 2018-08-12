extends Label

func _ready():
	set_text("%06d" % Score.high_score)
	pass
