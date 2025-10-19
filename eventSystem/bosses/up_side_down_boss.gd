extends boss

var bossName = "\"The DownsideUp\""
var description = "Map is Flipped"

var blackHoleScene = preload("res://eventSystem/bosses/black_hole.tscn")

func action() -> void:
	var main = get_parent().get_parent()
	main.flipSpawn()

	
	
func deactivate() -> void:
	var main = get_parent().get_parent()
	main.flipSpawn()
