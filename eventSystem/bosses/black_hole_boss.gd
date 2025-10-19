extends boss

var bossName = "\"The Twins\""
var description = "Two black holes appear!"

var blackHoleScene = preload("res://eventSystem/bosses/black_hole.tscn")

func action() -> void:
	var shift = 2000
	var hole1 = blackHoleScene.instantiate()
	var hole2 = blackHoleScene.instantiate()
	var r1x = randi_range(-1 * shift, shift) 
	var r2x = randi_range(-1 * shift, shift) 
	var r1y = randi_range(-1 * shift, shift) 
	var r2y = randi_range(-1 * shift, shift) 
	hole1.position = Vector2(-2000 + r1x,500 + r1y)
	hole2.position = Vector2(2000 + r2x,500 + r1y)
	add_child(hole1)
	add_child(hole2)

	
	
func deactivate() -> void:
	for child in get_children():
		child.queue_free()
