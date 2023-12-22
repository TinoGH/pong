extends CanvasLayer

var left_score_label
var right_score_label

func _ready():
	left_score_label = $LeftScore
	right_score_label = $RightScore
	update_scores(0, 0)

func update_scores(score_left, score_right):
	left_score_label.text = str(score_left)
	right_score_label.text = str(score_right)
