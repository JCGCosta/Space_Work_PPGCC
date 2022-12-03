extends KinematicBody2D

var raio setget set_raio
var ship setget set_ship
var orbit setget set_orbit

var angle := 180.0
var speed := 1.0
var capture_active = false
var radius_orbit := 200.0

func _ready():
	self.scale.x = 0.5
	self.scale.y = 0.5

	if(orbit == 1):
		self.rotate(deg2rad(180))
		self.angle = 180
		self.radius_orbit = 200
		self.speed = 1
	if(orbit == 2):
		self.angle = 50
		self.radius_orbit = 290
		self.speed = 1.5

func _physics_process(delta):
	movement_loop(delta)
	rotate_to_target(delta)

func movement_loop(delta):
	if(self.orbit == 1):
		self.angle += delta
	if(self.orbit == 2):
		self.angle -=delta

	self.position = Vector2(sin(self.angle * speed) * self.radius_orbit, cos(self.angle * speed) * self.radius_orbit) + Global.planet

func rotate_to_target(delta):
	var direction = Global.planet - self.position
	var angleTo = $Sprite.transform.x.angle_to(direction)

	$Sprite.rotate(sign(angleTo) * min (delta * speed, abs(angleTo)))

func set_raio(value):
	raio  = value

func set_ship(value):
	ship = value
	
func set_orbit(value):
	orbit = value

func _on_Area2D_body_entered(body):
	if(body.get_name() == 'Ship'):
		body.die()
