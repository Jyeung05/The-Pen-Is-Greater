extends event

var desc = "pockets 2 4 and 6 give half points"



func activate():
	var main = get_parent().get_parent()
	var world = main.get_child(0)
	var children = world.get_children()
	for child in children:
		if child.name.contains("scoreBasket") :
			if child.id == 2 or child.id == 4 or child.id == 6:
				child.moneyMult = child.moneyMult / 2 
				
	print("doubled 246")
	pass
