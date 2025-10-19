extends Node2D

func _ready() -> void:
	#$scoreBasket2.switchMode()
	#$scoreBasket4.switchMode()
	#$scoreBasket.bonusSwitcher()
	goal()
	pass
	
	
func goal() -> void:
	while true:
		await get_tree().create_timer(20).timeout
		if GlobalStats.money < GlobalStats.ante:
			print("you loose")
		else:
			GlobalStats.ante = GlobalStats.ante * 2
