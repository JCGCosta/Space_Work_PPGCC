extends KinematicBody2D

var raio setget set_raio
var ship setget set_ship

var positionInitial = Vector2(0, 0)
var velocity = Vector2()
var speed = 35
var pointsScore = 4

func _ready():
	positionInitial = self.position

func _physics_process(delta):
	if(ship && raio && raio.raio_active && raio.captured['soldier']):
		capturar(delta)

	if(ship && raio && (!raio.raio_active || !raio.captured['soldier'])):
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
	Global.score += self.pointsScore
	queue_free()

func set_raio(value):
	raio  = value

func set_ship(value):
	ship = value
