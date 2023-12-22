extends RigidBody2D

@export var start_speed = 500

func set_start(side, pos):
	position = pos
	match side:
		Constants.SIDE.LEFT:
			linear_velocity = Vector2(1, 0) * start_speed
		Constants.SIDE.RIGHT:
			linear_velocity = Vector2(-1, 0) * start_speed
