extends boss

var bossName = "\"The Fastest\""
var description = "Balls move so fast they can go through drawings"

func action() -> void:
	get_parent().get_parent().setGravity(20.0)
	
func deactivate():
	get_parent().get_parent().setGravity(1.0)
