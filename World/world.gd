extends Node2D

func _ready() -> void:
	$scoreBasket2.switchMode()
	$scoreBasket4.switchMode()
	$scoreBasket.bonusSwitcher()
