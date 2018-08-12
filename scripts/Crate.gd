extends RigidBody2D

var should_reset
var new_transform
var new_position
var pos_valid
var center = Vector2(960, 540)
var should_radar
var circle_draw
var timer
var col_bodies = []
var inactive_time = 5.0

func _ready():
	should_reset = true
	pos_valid = false
	should_radar = false
	circle_draw = get_node("/root/Background/Crate/CircleDraw")
	timer = Timer.new()
	add_child(timer)
	
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(inactive_time)
	timer.set_one_shot(false)
	timer.start()
	pass

func _process(delta):
	if should_radar:
		circle_draw.radius -= 0.5
		if circle_draw.radius < 0:
			circle_draw.radius = circle_draw.initial_radius
			should_radar = false
			circle_draw.hide()
		else:
			circle_draw.show()
			circle_draw.update()
	pass

func _physics_process(delta):
	col_bodies = get_colliding_bodies()
	if col_bodies.size() > 0:
		for body in col_bodies:
			if body.is_in_group("player"):
				timer.set_wait_time(inactive_time)
				timer.start()

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
		should_radar = true
		timer.set_wait_time(inactive_time)
		timer.start()
	pass
	
func _on_Timer_timeout():
	should_radar = true
	pass
