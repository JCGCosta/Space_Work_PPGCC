extends Area2D

var raio setget set_raio
var ship setget set_ship

func _physics_process(delta):
	pass

func set_raio(value):
	raio  = value

func set_ship(value):
	ship = value
