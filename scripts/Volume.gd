extends HSlider

func _ready():
	if AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) <= -30:
		value = 0
	else:
		value = (AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) + 30)/54 * 100
	pass

func _on_Volume_value_changed(value):
	var scaled
	if value == 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	else:
		scaled = value/100 * 54 - 30
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), scaled)
	pass
