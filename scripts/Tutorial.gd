extends Node

func _ready():
	if Score.enable_tutorial || Score.first_game:
		print("Tutorial")
	pass
