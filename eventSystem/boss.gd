extends Node2D

class_name boss
var canActivate: bool = true

func activate() -> bool:
	if canActivate:
		action()
		canActivate = false
		flip()
		return true
	else:
		return false
		

func action() -> void:
	pass
	
func deactivate() -> void:
	pass

func flip():
	await get_tree().create_timer(2).timeout
	canActivate = true
