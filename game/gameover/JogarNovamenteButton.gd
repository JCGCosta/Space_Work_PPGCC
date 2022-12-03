extends Button

func _on_JogarNovamenteButton_pressed():
	$Sprite.modulate.r = 0.6
	$Sprite.modulate.g = 0.6
	$Sprite.modulate.b = 0.6

	if(Global.lifes == 0):
		Global.lifes = 3
		Global.score = 0
		Global.fase = 1

	if(!Global.venceu):
		Global.lifes -= 1

	if(Global.venceu && Global.fase == 2):
		Global.score = 0
		Global.lifes = 3
		Global.fase = 1

	if(Global.venceu && Global.fase == 1):
		Global.venceu = false
		Global.fase = 2
		Global.score = 0

	get_tree().change_scene("res://Main.tscn")

func _on_JogarNovamenteButton_mouse_entered():
	$Sprite.modulate.r = 0.8
	$Sprite.modulate.g = 0.8
	$Sprite.modulate.b = 0.8

func _on_JogarNovamenteButton_mouse_exited():
	$Sprite.modulate.r = 1
	$Sprite.modulate.g = 1
	$Sprite.modulate.b = 1
