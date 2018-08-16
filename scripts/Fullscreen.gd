extends CheckBox

var checkedt
var uncheckedt
var tex

func _ready():
	pressed = OS.window_fullscreen
	checkedt = load("res://assets/texture/CheckedBox.png")
	uncheckedt = load("res://assets/texture/UncheckedBox.png")
	tex = get_child(0)
	pass
	
func _process(delta):
	if pressed:
		tex.set_texture(checkedt)
	else:
		tex.set_texture(uncheckedt)
	pass

func _on_Fullscreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	pass
