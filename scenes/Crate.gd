extends RigidBody2D

var should_reset
var new_transform

func _ready():
	should_reset = true
	pass

func _integrate_forces(state):
	if should_reset:
		randomize()
		state.set_linear_velocity(Vector2(rand_range(-250, 250), rand_range(-250, 250)))
		state.set_angular_velocity(rand_range(-15, 15))
		new_transform = state.get_transform()
		new_transform.origin = Vector2(rand_range(64, 1856), rand_range(64, 1016))
		state.set_transform(new_transform)
		should_reset = false
	pass