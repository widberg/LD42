extends RigidBody2D

var rot
var forward
var move_speed = 2000
var turn_speed = 150

func _physics_process(delta):
	rot = get_transform().get_rotation() - PI/2.0
	forward = Vector2(cos(rot), sin(rot)).normalized()
	if Input.is_action_pressed("move_forward"):
		apply_impulse(Vector2(), forward * move_speed * delta)
		if Score.timer.is_stopped():
			Score.timer.start()
			Debris.timer.start()
	if Input.is_action_pressed("turn_right"):
		set_angular_velocity(turn_speed * delta)
	if Input.is_action_pressed("turn_left"):
		set_angular_velocity(-turn_speed * delta)
	pass
