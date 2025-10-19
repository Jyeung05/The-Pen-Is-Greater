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
			$loseScreen.visible = true
			
		else:
			GlobalStats.ante = GlobalStats.ante * 2

func getBaskets():
	var children = get_children()
	var retBaskets = []
	for child in children:
		if child.name.begins_with("scoreBasket"):
			retBaskets.append(child)
	return retBaskets


func _on_button_pressed() -> void:
	GlobalStats.restart()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://main.tscn")
