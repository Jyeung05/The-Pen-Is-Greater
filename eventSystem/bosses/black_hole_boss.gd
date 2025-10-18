extends boss

var blackHoleScene = preload("res://eventSystem/bosses/black_hole.tscn")

func action() -> void:
	var hole1 = blackHoleScene.instantiate()
	hole1.position = Vector2(-2000,2000)
	var hole2 = blackHoleScene.instantiate()
	hole2.position = Vector2(2000,2000)
	add_child(hole1)
	add_child(hole2)

	
	
func deactivate() -> void:
	for child in get_children():
		child.die()
