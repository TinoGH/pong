extends RigidBody2D

@export var start_speed = 500

func set_start(side):
	match side:
		Constants.SIDE.LEFT:
			position = Vector2(50, 360)
			linear_velocity = Vector2(1, 0) * start_speed
		Constants.SIDE.RIGHT:
			position = Vector2(1230, 360)
			linear_velocity = Vector2(-1, 0) * start_speed
