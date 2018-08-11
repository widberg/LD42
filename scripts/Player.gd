extends RigidBody2D

var rot
var forward

func _process(delta):
	rot = get_transform().get_rotation() - PI/2.0
	forward = Vector2(cos(rot), sin(rot))
	if Input.is_action_pressed("move_forward"):
		apply_impulse(Vector2(), forward * 0.5)
	if Input.is_action_pressed("move_backward"):
		apply_impulse(Vector2(), -forward * 0.5)
	if Input.is_action_pressed("turn_right"):
		apply_impulse(Vector2(0, -32), Vector2(0.05, 0));
		apply_impulse(Vector2(0, 32), Vector2(-0.05, 0));
	if Input.is_action_pressed("turn_left"):
		apply_impulse(Vector2(0, -32), Vector2(-0.05, 0));
		apply_impulse(Vector2(0, 32), Vector2(0.05, 0));
	pass
