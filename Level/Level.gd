extends Node

var PlayerSocre = 0
var OpponentScore = 0

func _process(delta):
	$CounterLabel.text = str(int($CountdownTimer.time_left) + 1)

func _on_Left_body_entered(body):
	$Ball.position = Vector2(640,360)
	OpponentScore += 1
	$OpponentScore.text = str(OpponentScore)
	score_achieved()

func _on_Right_body_entered(body):
	$Ball.position = Vector2(640,360)
	PlayerSocre += 1
	$PlayerScore.text = str(PlayerSocre)
	score_achieved()

func _on_CountdownTimer_timeout():
	$CounterLabel.visible = false
	get_tree().call_group("BallGroup","start_ball")

func score_achieved():
	$ScoreSound.play()
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$CounterLabel.visible = true
	
