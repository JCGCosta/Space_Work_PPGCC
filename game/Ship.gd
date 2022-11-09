extends KinematicBody2D

var angle := 90.0
var speed := 2.0
var radius_orbit_1 := 250.0
var planet := Vector2(505,306)

var controll = {
	'up' : false,
	'down': false,
	'left': false,
	'right': false	
}

func _physics_process(delta : float) -> void :
	controll_loop()
	movement_loop(delta)
	
func controll_loop():
	self.controll['up'] = Input.is_action_pressed("ui_up")
	self.controll['down'] = Input.is_action_pressed("ui_down")
	self.controll['left'] = Input.is_action_pressed("ui_left")
	self.controll['right'] = Input.is_action_pressed("ui_right")
	
func movement_loop(delta):
	if(self.controll['left']):
		angle += delta
	
	if(self.controll['right']):
		angle -= delta
		
	if(self.controll['left'] || self.controll['right']):
		self.position = Vector2 (
			sin(angle * speed) * radius_orbit_1,
			cos(angle * speed) * radius_orbit_1 
		) + planet
		

	
	
	
