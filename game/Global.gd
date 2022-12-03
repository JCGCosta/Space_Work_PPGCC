extends Node

var planet_orbit := 115.0
var planet := Vector2(512,288)
var score = 0
var lifes = 3
var venceu = false
var scores = []
var fase = 1

func rotate_to_target(delta, element, sprite):
	var direction = planet - element.position
	var angleTo = sprite.transform.y.angle_to(direction)

	sprite.rotate(sign(angleTo) * min (delta, abs(angleTo)))
