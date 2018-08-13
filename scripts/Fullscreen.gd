extends CheckBox

func _ready():
	pressed = OS.window_fullscreen
	pass

func _on_Fullscreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	pass
