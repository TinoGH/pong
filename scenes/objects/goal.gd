extends Area2D

signal goal

func _on_body_entered(body):
	body.queue_free()
	goal.emit()
