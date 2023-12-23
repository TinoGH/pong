extends Node

signal pressedStart

@export var ball_scene:PackedScene
var hud
var player_left
var player_right
var score_left = 0
var score_right = 0
var ball


# Called when the node enters the scene tree for the first time.
func _ready():
	hud = $Scores
	player_left = $PlayerLeft
	player_right = $PlayerRight
	ball = ball_scene.instantiate()
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("player_left_down"):
		player_left.move_down(delta)
	if Input.is_action_pressed("player_left_up"):
		player_left.move_up(delta)

	if Input.is_action_pressed("player_right_down"):
		player_right.move_down(delta)
	if Input.is_action_pressed("player_right_up"):
		player_right.move_up(delta)


func _input(event):
	if event.is_action_pressed("start"):
		pressedStart.emit()


func new_game():
	player_right.toggle_start_ball_sprite(false)
	new_point(player_left)
	

func end_game():
	pass
	

func new_point(player):
	ball.queue_free()
	
	player_left.reset()
	player_right.reset()
	hud.update_scores(score_left, score_right)
	
	player.toggle_start_ball_sprite(true)
	
	ball = ball_scene.instantiate()
	ball.bounced_too_much.connect(on_ball_bounced_too_much)
	
	await pressedStart
	ball.set_start(player)
	player.toggle_start_ball_sprite(false)
	add_child(ball)
	

func on_ball_bounced_too_much(player):
	if player.is_left:
		_on_goal_left_goal()
	else:
		_on_goal_right_goal()


func _on_goal_left_goal():
	score_right += 1
	new_point(player_left)


func _on_goal_right_goal():
	score_left += 1
	new_point(player_right)
