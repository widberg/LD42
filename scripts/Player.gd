extends RigidBody2D

var rot
var forward
var movespeed = 2000
var turnspeed = 1000

func _physics_process(delta):
	rot = get_transform().get_rotation() - PI/2.0
	forward = Vector2(cos(rot), sin(rot)).normalized()
	if Input.is_action_pressed("move_forward"):
		apply_impulse(Vector2(), forward * movespeed * delta)
	if Input.is_action_pressed("turn_right"):
		apply_impulse(Vector2(0, -32), Vector2(turnspeed * delta, 0));
		apply_impulse(Vector2(0, 32), Vector2(-turnspeed * delta, 0));
	if Input.is_action_pressed("turn_left"):
		apply_impulse(Vector2(0, -32), Vector2(-turnspeed * delta, 0));
		apply_impulse(Vector2(0, 32), Vector2(turnspeed * delta, 0));
	pass
