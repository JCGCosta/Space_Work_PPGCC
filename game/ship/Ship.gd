extends KinematicBody2D

var person setget set_person
var cow setget set_cow
var fighterShip setget set_fighterShip
var chicken setget set_chicken
var soldier setget set_soldier

var angle := 30.0
var speed := 2.0
var capture_active = false
var orbit_active = 1
var radius_orbit_1 := 200.0
var radius_orbit_2 : = 250.0
var planet := Vector2(512,288)

var p = get_parent()

var controll = {
	'up' : false,
	'down': false,
	'left': false,
	'right': false
}

func _physics_process(delta : float) -> void :
	controll_loop()
	movement_loop(delta)
	rotate_to_target(delta)

func controll_loop():
	self.controll['up'] = Input.is_action_pressed("ui_up")
	self.controll['down'] = Input.is_action_pressed("ui_down")
	self.controll['left'] = Input.is_action_pressed("ui_left")
	self.controll['right'] = Input.is_action_pressed("ui_right")

func movement_loop(delta):
	if(self.controll['up'] && self.orbit_active == 1):
		self.orbit_active = 2

	if(self.controll['down'] && self.orbit_active == 2):
		self.orbit_active = 1

	if(self.controll['left']):
		self.angle += delta

	if(self.controll['right']):
		self.angle -= delta

	var value_orbit = self.radius_orbit_1

	if(self.orbit_active == 2):
		value_orbit = self.radius_orbit_2

	if(self.controll['down'] || self.controll['up'] || self.controll['right'] || self.controll['left']):
		self.position = Vector2(sin(self.angle * speed) * value_orbit, cos(self.angle * speed) * value_orbit) + planet

func rotate_to_target(delta):
	var direction = self.planet - self.position
	var angleTo = $Sprite.transform.y.angle_to(direction)

	$Sprite.rotate(sign(angleTo) * min (delta * speed, abs(angleTo)))

func set_person(value):
	person = value

func set_cow(value):
	cow = value

func set_fighterShip(value):
	fighterShip = value

func set_chicken(value):
	chicken = value

func set_soldier(value):
	soldier = value
