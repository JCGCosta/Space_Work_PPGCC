extends KinematicBody2D

var angle := 30.0
var speed := 2.0
var capture_active = false
var orbit_active = 1
var radius_orbit_1 := 200.0
var radius_orbit_2 : = 290.0

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
		self.position = Vector2(sin(self.angle * speed) * value_orbit, cos(self.angle * speed) * value_orbit) + Global.planet

func rotate_to_target(delta):
	var direction = Global.planet - self.position
	var angleTo = $Sprite.transform.y.angle_to(direction)

	$Sprite.rotate(sign(angleTo) * min (delta * speed, abs(angleTo)))

func die():
	get_tree().change_scene("res://gameover/GameOver.tscn")
