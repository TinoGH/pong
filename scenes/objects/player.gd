extends CharacterBody2D

var initial_pos

func _ready():
	initial_pos = position
	
func reset():
	position = initial_pos
