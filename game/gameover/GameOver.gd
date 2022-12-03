extends Label

func _ready():
	if(Global.venceu):
		self.text = 'Você venceu!'
		return
	
	if(Global.lifes > 1):
		self.text = 'Você morreu!'
		return
		
	self.text = 'Game over!'
