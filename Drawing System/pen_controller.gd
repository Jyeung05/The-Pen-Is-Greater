extends Node2D

var penArray: Array = []

func _ready() -> void:
	penArray.append(self.get_child(0))
	penArray.append(self.get_child(1))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pen1"):
		selection(1)
	elif Input.is_action_just_pressed("pen2"):
		selection(2)


func selection(penNumber:int) -> void:
	for pen in penArray.size():
		if pen + 1 == penNumber:
			penArray[pen].select()
		else:
			penArray[pen].deselect()
		
