extends RigidBody2D

signal bounced_too_much(player)

@export var start_speed = 1000
@export var min_speed = 500
@export var max_speed = 1500
@export var max_wall_bounces = 5
var n_bounces = 0
var last_player

func _integrate_forces(state):
	var current_speed = state.linear_velocity.length()
	if current_speed < min_speed:
		state.linear_velocity = state.linear_velocity.normalized() * min_speed
	elif current_speed > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
		
func _physics_process(_delta):
	for body in get_colliding_bodies():
		if body is StaticBody2D:
			n_bounces += 1
			if n_bounces > max_wall_bounces:
				bounced_too_much.emit(last_player)
		elif body is CharacterBody2D:
			n_bounces = 0
			last_player = body
		
		update_aspect(n_bounces)
		

func set_start(player):
	position = player.get_start_ball_pos()
	last_player = player
	if player.is_left:
		linear_velocity = Vector2(1, 0) * start_speed
	else:
		linear_velocity = Vector2(-1, 0) * start_speed
			
	
func update_aspect(n):
	var color_value = 1.0 - float(n) / max_wall_bounces
	if n > max_wall_bounces:
		color_value = 0
	modulate = Color(color_value, color_value, color_value)
