extends Area2D

var lastCrate = null

func _on_Portal_body_entered(body):
	if body.is_in_group("crate"):
		Score.score += 1000
		body.should_reset = true
	pass
