extends Node2D

func _ready() -> void:
	#$scoreBasket2.switchMode()
	#$scoreBasket4.switchMode()
	#$scoreBasket.bonusSwitcher()
	goal()
	pass
	
	
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("restart"):
		#GlobalStats.restart()

func goal() -> void:
	GlobalStats.anteCountDown = 30
	while true:
		await get_tree().create_timer(1, false).timeout
		GlobalStats.anteCountDown = GlobalStats.anteCountDown - 1
		if GlobalStats.money < GlobalStats.ante and GlobalStats.anteCountDown <= 0:
			$sounds/lose.play()
			$loseScreen.visible = true
			await get_tree().create_timer(99999, false).timeout
			
		elif GlobalStats.anteCountDown == 1 and GlobalStats.money > GlobalStats.ante:
			GlobalStats.ante = GlobalStats.ante * 2
			GlobalStats.anteCountDown = 30
			$sounds/anteUp.play()

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
