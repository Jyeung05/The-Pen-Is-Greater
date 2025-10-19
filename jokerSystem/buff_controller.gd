extends Node2D

var buffs

var main
var world 
func _ready():
	main = self.get_parent()
	world = get_parent().get_child(0)
	buffs = get_children()
	
func buyBuff(i: int):
	buffs[i].activate()
	GlobalStats.buffList.append("" + buffs[i].title + ": " + buffs[i].desc)


func getWorld():
	return world
	
func getMain():
	return main
