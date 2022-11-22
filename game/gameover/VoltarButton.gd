extends Button

func _on_VoltarButton_pressed():
	$Sprite.modulate.r = 0.6
	$Sprite.modulate.g = 0.6
	$Sprite.modulate.b = 0.6
	get_tree().change_scene("res://menu/Menu.tscn")

func _on_VoltarButton_mouse_entered():
	$Sprite.modulate.r = 0.8
	$Sprite.modulate.g = 0.8
	$Sprite.modulate.b = 0.8

func _on_VoltarButton_mouse_exited():
	$Sprite.modulate.r = 1
	$Sprite.modulate.g = 1
	$Sprite.modulate.b = 1
