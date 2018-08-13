extends Node2D

var initial_radius
var radius

func _ready():
	initial_radius = 200
	radius = initial_radius

func draw_empty_circle(circle_center, circle_radius, color, resolution):
	var draw_counter = 1
	var line_origin = Vector2()
	var line_end = Vector2()
	line_origin = circle_radius + circle_center

	while draw_counter <= 360:
		line_end = circle_radius.rotated(deg2rad(draw_counter)) + circle_center
		draw_line(line_origin, line_end, color)
		draw_counter += 1 / resolution
		line_origin = line_end

	line_end = circle_radius.rotated(2 * PI) + circle_center
	draw_line(line_origin, line_end, color)
	pass

func _draw():
	draw_empty_circle(Vector2(0, 0), Vector2(radius, 0), Color(255, 0, 0), 1)
	draw_empty_circle(Vector2(0, 0), Vector2(radius-1, 0), Color(255, 0, 0), 1)
	draw_empty_circle(Vector2(0, 0), Vector2(radius-2, 0), Color(255, 0, 0), 1)
	pass
