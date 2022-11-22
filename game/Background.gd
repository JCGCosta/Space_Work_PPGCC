extends CanvasLayer

func _ready():
	# Substituir essa parte para criação dinamica

	$Cow.ship = $Ship
	$Cow.raio = $Raio
	
	$Person.ship = $Ship
	$Person.raio = $Raio
	
	$FighterShip.ship = $Ship
	$FighterShip.raio = $Raio
	
	$Chicken.ship = $Ship
	$Chicken.raio = $Raio
	
	$Soldier.ship = $Ship
	$Soldier.raio = $Raio

func _process(delta):
	# idea é que a cada X clock de CPU rodar a criação dos elementos na tela
	# pode ser todos ou um por um (da para usar um random para escolher qual criar)
	pass

# Essas criações aqui é necessário criar uma função nos arquivos de cada inimigo
# para adicionar em vários lugares do planeta
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
