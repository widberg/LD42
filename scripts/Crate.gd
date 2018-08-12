extends RigidBody2D

var should_reset
var new_transform
var new_position
var pos_valid = false
var center = Vector2(960, 540)

func _ready():
	should_reset = true
	pass

func _integrate_forces(state):
	if should_reset:
		randomize()
		state.set_linear_velocity(Vector2(rand_range(-250, 250), rand_range(-250, 250)))
		state.set_angular_velocity(rand_range(-15, 15))
		new_transform = state.get_transform()
		while !pos_valid:
			new_position = Vector2(rand_range(64, 1856), rand_range(64, 1016))
			if new_position.distance_to(center) >= 128:
				pos_valid = true
		pos_valid = false
		new_transform.origin = new_position
		state.set_transform(new_transform)
		should_reset = false
	pass