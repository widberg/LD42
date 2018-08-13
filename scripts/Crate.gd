extends RigidBody2D

var new_transform
var new_position
var pos_valid
var center = Vector2(960, 540)
var should_radar
var circle_draw
var shape
var texture
var sound
var timer
var col_bodies = []
var inactive_time = 5.0
var should_die
var tex_center

func _ready():
	should_die = false
	pos_valid = false
	shape = get_child(0)
	texture = get_child(1)
	circle_draw = get_child(2)
	sound = get_child(3)
	timer = Timer.new()
	add_child(timer)
	
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_one_shot(false)
	randomize()
	set_linear_velocity(Vector2(rand_range(-250, 250), rand_range(-250, 250)))
	set_angular_velocity(rand_range(-15, 15))
	new_transform = get_transform()
	while !pos_valid:
		new_position = Vector2(rand_range(64, 1856), rand_range(220, 1016))
		if new_position.distance_to(center) >= 128:
			pos_valid = true
	new_transform.origin = new_position
	set_transform(new_transform)
	should_radar = true
	timer.set_wait_time(inactive_time)
	timer.start()
	pass

func _process(delta):
	if should_die:
		if texture.get_scale().x <= 0:
			get_parent().remove_child(self)
		elif texture.get_scale().x == 1:
			sound.play()
			shape.disabled = true
			remove_child(circle_draw)
		texture.set_scale(Vector2(texture.get_scale().x - 0.25 * delta, texture.get_scale().y - 0.25 * delta))
		tex_center = get_global_transform().get_origin() - Vector2(32, 32).rotated(get_global_transform().get_rotation())
		apply_impulse(Vector2(), (center - tex_center).normalized() * delta * clamp(tex_center.distance_squared_to(center)/5, 100, 450))
	elif should_radar:
		circle_draw.radius -= 150 * delta
		if circle_draw.radius <= 0:
			circle_draw.radius = circle_draw.initial_radius
			should_radar = false
			circle_draw.hide()
		else:
			circle_draw.update()
	pass

func _physics_process(delta):
	col_bodies = get_colliding_bodies()
	if col_bodies.size() > 0:
		for body in col_bodies:
			if body.is_in_group("player"):
				timer.set_wait_time(inactive_time)
				timer.start()

func _on_Timer_timeout():
	should_radar = true
	circle_draw.show()
	pass
