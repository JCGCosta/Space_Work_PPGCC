extends KinematicBody2D

var raio setget set_raio
var ship setget set_ship

func _physics_process(delta):
	if(ship && raio && raio.raio_active):
		pass

func capturar():
	print('capturando')

func set_raio(value):
	raio  = value

func set_ship(value):
	ship = value
