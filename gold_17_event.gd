extends event
#turns 1 and 7 gold

var desc = "pockets 1 and 7 give bonus points"

func activate():
	var main = get_parent().get_parent()
	var world = main.get_child(0)
	var children = world.get_children()
	for child in children:
		if child.name.contains("scoreBasket") :
			print("scoreBasket")
			if child.id == 1 or child.id == 7:
				print("change")
				child.bonusSwitcher()
	print("bonus 17")
	pass
