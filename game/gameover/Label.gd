extends Label

func _ready():
	if(Global.lifes > 1 && !Global.venceu):
		self.text = 'Continuar jogando'
	else:
		self.text = 'Jogar novamente'
