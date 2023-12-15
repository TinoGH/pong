extends Node

@export var player_speed = 1000
var player_left
var player_right
var ball

# Called when the node enters the scene tree for the first time.
func _ready():
	player_left = $PlayerLeft
	player_right = $PlayerRight
	ball = $Ball
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = player_speed * delta
	
	if Input.is_action_pressed("player_left_down"):
		player_left.position.y += movement
	if Input.is_action_pressed("player_left_up"):
		player_left.position.y -= movement

	if Input.is_action_pressed("player_right_down"):
		player_right.position.y += movement
	if Input.is_action_pressed("player_right_up"):
		player_right.position.y -= movement


func _on_goal_left_body_entered(body):
	new_point("left")


func _on_goal_right_body_entered(body):
	new_point("right")
	

func new_game():
	new_point("left")
	

func end_game():
	pass
	

func new_point(side):
	player_left.position = Vector2(16, 360)
	player_right.position = Vector2(1264, 360)
	ball.reset(side)
	
