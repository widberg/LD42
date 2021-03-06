extends Area2D

var crates

func _ready():
	crates = get_node("/root/Background/Crates")
	pass

func _process(delta):
	set_rotation(get_rotation() - PI/7 * delta)
	pass

func _on_Portal_body_entered(body):
	if body.is_in_group("crate"):
		Score.score += 1000
		Score.timer.set_wait_time(min(Score.timer.time_left + max(Score.add_time, Score.min_time), Score.max_time))
		Score.timer.start()
		Score.add_time -= 2.0
		body.should_die = true
		crates.spawn_crate()
	pass
