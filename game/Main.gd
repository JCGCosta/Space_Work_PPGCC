extends Node2D

func _process(delta):
	if(Global.score >= 50):
		Global.venceu = true
		get_tree().change_scene("res://gameover/GameOver.tscn")
