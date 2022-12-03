extends Label

func _ready():
	if(Global.venceu && Global.fase == 1):
		self.text = 'Próxima fase'
	else:
		if(Global.lifes > 1 && !Global.venceu):
			self.text = 'Continuar jogando'
		else:
			self.text = 'Jogar novamente'
