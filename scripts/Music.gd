extends Node

var max_track = 10
var max_vol = -10
var min_vol = -80
var tracks = []
var last_track
var new_track
var valid
var stream0
var stream1
var alt_stream

func _ready():
	stream0 = get_child(0)
	stream1 = get_child(1)
	last_track = 0
	new_track = 0
	valid = false
	alt_stream = false
	for i in range(0, max_track):
		tracks.append(load("res://assets/audio/" + str(i) + ".ogg"))
	rand_track()
	pass

func _on_Stream0_finished():
	rand_track()
	pass


func _on_Stream1_finished():
	rand_track()
	pass

func rand_track():
	while !valid:
		new_track = rand_range(0, max_track)
		if new_track != last_track:
			valid = true
	valid = false
	if alt_stream:
		stream1.stop()
		stream0.set_stream(tracks[new_track])
		stream0.play()
	else:
		stream0.stop()
		stream1.set_stream(tracks[new_track])
		stream1.play()
	alt_stream = !alt_stream
	last_track = new_track
	pass
