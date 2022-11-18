extends CanvasLayer

func _ready():
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
	
	$Ship.cow = $Cow
	$Ship.person = $Person
	$Ship.fighterShip = $FighterShip
	$Ship.chicken = $Chicken
	$Ship.soldier = $Soldier

