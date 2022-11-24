extends CanvasLayer

export var clock = 200
var clockAtt = 0
var rng = RandomNumberGenerator.new()

func _ready():
	create_cow()
	create_chicken()
	create_person()
	create_soldier()

	$FighterShip.ship = $Ship
	$FighterShip.raio = $Raio

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
