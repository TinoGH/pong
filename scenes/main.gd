extends Node


@export var ball_scene:PackedScene
@export var player_speed = 1000
var player_left
var player_right
var goal_left
var goal_right


# Called when the node enters the scene tree for the first time.
func _ready():
	player_left = $PlayerLeft
	player_right = $PlayerRight
	goal_left = $GoalLeft
	goal_right = $GoalRight
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
	

func new_game():
	new_point(Constants.SIDE.LEFT)
	

func end_game():
	pass
	

func new_point(side):
	player_left.reset()
	player_right.reset()
	
	var ball = ball_scene.instantiate()
	ball.set_start(side)
	
	# wait for input
	call_deferred("add_child", ball)


func _on_goal_left_goal():
	new_point(Constants.SIDE.LEFT)


func _on_goal_right_goal():
	new_point(Constants.SIDE.RIGHT)
