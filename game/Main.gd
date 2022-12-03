extends Node2D

func _process(delta):
	if((Global.fase == 1 && Global.score >= 50) || (Global.fase == 2 && Global.score >= 150)):
		Global.venceu = true
		get_tree().change_scene("res://gameover/GameOver.tscn")
