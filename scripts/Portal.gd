extends Area2D

func _on_Portal_body_entered(body):
	if body.is_in_group("crate"):
		Score.score += 1000
		Score.timer.set_wait_time(min(Score.timer.time_left + max(Score.add_time, Score.min_time), Score.max_time))
		Score.timer.start()
		Score.add_time -= 5.0
		body.should_reset = true
	pass
