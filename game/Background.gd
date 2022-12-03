extends CanvasLayer

export var clock = 200
var clockAtt = 0
var rng = RandomNumberGenerator.new()

func _ready():
	create_cow()
	create_chicken()
	create_person()
	create_soldier()
	create_fighter_ship(1)
	
	if(Global.fase == 2):
		create_fighter_ship(2)

func _process(delta):
	clockAtt += 1

	if(clockAtt % clock == 0):
		rng.randomize()
		var opcao = rng.randi_range(1, 4)

		if(opcao == 1):
			create_chicken()
		if(opcao == 2):
			create_cow()
		if(opcao == 3):
			create_person()
		if(opcao == 4):
			create_soldier()

func create_fighter_ship(orbit):
	var scene = load('res://fighter_ship/FighterShip.tscn')
	var fighter = scene.instance()

	fighter.ship = $Ship
	fighter.raio = $Raio
	fighter.orbit = orbit

	add_child(fighter)

func create_cow():
	var scene = load('res://cow/Cow.tscn')
	var cow = scene.instance()

	cow.ship = $Ship
	cow.raio = $Raio

	add_child(cow)

func create_person():
	var scene = load('res://person/Person.tscn')
	var person = scene.instance()

	person.ship = $Ship
	person.raio = $Raio

	add_child(person)

func create_chicken():
	var scene = load('res://chicken/Chicken.tscn')
	var chicken = scene.instance()

	chicken.ship = $Ship
	chicken.raio = $Raio

	add_child(chicken)

func create_soldier():
	var scene = load('res://soldier/Soldier.tscn')
	var soldier = scene.instance()

	soldier.ship = $Ship
	soldier.raio = $Raio

	add_child(soldier)
