extends KinematicBody2D

var raio setget set_raio
var ship setget set_ship

var positionInitial = Vector2(0, 0)
var velocity = Vector2()
var speed = 50
var pointsScore = 1

func _ready():
	positionInitial = self.position

func _physics_process(delta):
	if(ship && raio && raio.raio_active && raio.captured['chicken']):
		capturar(delta)

	if(ship && raio && (!raio.raio_active || !raio.captured['chicken'])):
		reset()

func capturar(delta):
	if(ship.position.y > self.position.y):
		self.position.y += speed * delta
		
	if(ship.position.x > self.position.x):
		self.position.x += speed * delta

	if(ship.position.y < self.position.y):
		self.position.y -= speed * delta
		
	if(ship.position.x < self.position.x):
		self.position.x -= speed * delta
		
	if(abs(ship.position.x - self.position.x) < 30):
		die()

func reset():
	self.position = positionInitial

func die():
	print('CAPTUROU')
	# colocar no score os pontos da vaca
	queue_free()

func set_raio(value):
	raio  = value

func set_ship(value):
	ship = value
