extends Node2D

var crate

func _ready():
	crate = load("res://scenes/object/Crate.tscn")
	spawn_crate()
	pass

func spawn_crate():
	add_child(crate.instance())
	pass
