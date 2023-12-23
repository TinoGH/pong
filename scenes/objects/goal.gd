extends Area2D

signal goal

func _on_body_entered(_body):
	goal.emit()
