extends KinematicBody2D

var raio setget set_raio
var ship setget set_ship

var angle := 180.0
var speed := 1.0
var capture_active = false
var radius_orbit := 200.0

func _physics_process(delta):
	movement_loop(delta)
	rotate_to_target(delta)

func movement_loop(delta):
	self.angle += delta
	self.position = Vector2(sin(self.angle * speed) * self.radius_orbit, cos(self.angle * speed) * self.radius_orbit) + Global.planet

func rotate_to_target(delta):
	var direction = Global.planet - self.position
	var angleTo = $Sprite.transform.x.angle_to(direction)

	$Sprite.rotate(sign(angleTo) * min (delta * speed, abs(angleTo)))

func set_raio(value):
	raio  = value

func set_ship(value):
	ship = value

func _on_Area2D_body_entered(body):
	if(body.get_name() == 'Ship'):
		body.die()
