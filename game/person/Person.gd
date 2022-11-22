extends KinematicBody2D

var raio setget set_raio
var ship setget set_ship

var abduzir = false
var positionInitial = Vector2(0, 0)
var velocity = Vector2()
var speed = 40
var pointsScore = 3

func _ready():
	positionInitial = self.position

func _physics_process(delta):
	if(ship && raio && raio.raio_active && self.abduzir):
		capturar(delta)

	if(ship && raio && (!raio.raio_active || !self.abduzir)):
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
		
	if(abs(ship.position.y - self.position.y) < 30):
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

func _on_Area2D_body_entered(body):
	if(body.get_name() == 'Raio'):
		self.abduzir = true

func _on_Area2D_body_exited(body):
	if(body.get_name() == 'Raio'):
		self.abduzir = false
