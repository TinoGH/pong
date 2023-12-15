extends RigidBody2D

@export var base_speed = 500
var reset_status = false
var side_status = "left"
var start_pos_left = Vector2(48, 360)
var start_pos_right = Vector2(1232, 360)


func _integrate_forces(state):
	if reset_status:
		if side_status == "left":
			position = start_pos_left
			linear_velocity = Vector2(1, 0) * base_speed
		elif side_status == "right":
			position = start_pos_right
			linear_velocity = Vector2(-1, 0) * base_speed
		reset_status = false

func reset(side):
	side_status = side
	reset_status = true
