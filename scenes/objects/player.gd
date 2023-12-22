extends CharacterBody2D

@export var speed = 1000
var initial_pos

func _ready():
	initial_pos = position
	
func reset():
	position = initial_pos

func move_up(delta):
	position.y -= speed * delta
	
func move_down(delta):
	position.y += speed * delta
	
func toggle_start_ball_sprite(status):
	$BallSprite.visible = status
	
func get_start_ball_pos():
	return $BallSprite.global_position
