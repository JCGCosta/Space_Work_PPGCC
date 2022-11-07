extends Button

func _on_Options_mouse_entered():
	$Sprite.modulate.r = 0.8
	$Sprite.modulate.g = 0.8
	$Sprite.modulate.b = 0.8
	pass

func _on_Options_mouse_exited():
	$Sprite.modulate.r = 1
	$Sprite.modulate.g = 1
	$Sprite.modulate.b = 1
	pass

func _on_Options_pressed():
	$Sprite.modulate.r = 0.6
	$Sprite.modulate.g = 0.6
	$Sprite.modulate.b = 0.6
	pass
