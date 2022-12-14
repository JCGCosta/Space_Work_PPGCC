extends KinematicBody2D

var raio setget set_raio
var ship setget set_ship

var abduzir = false
var positionInitial = Vector2(0, 0)
var velocity = Vector2()
var speed = 35
var pointsScore = 4
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

	var angle = rng.randi_range(0, 100)

	self.scale = Vector2(0.4, 0.4)
	self.position = Vector2(sin(angle) * (Global.planet_orbit - 8), cos(angle) * (Global.planet_orbit - 8)) + Global.planet	

	positionInitial = self.position

func _physics_process(delta):
	Global.rotate_to_target(delta, self, $Sprite)

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

	var distanceShip = ship.position - self.position

	if(abs(distanceShip.x) < 20 && abs(distanceShip.y) < 20):
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
