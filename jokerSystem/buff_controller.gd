extends Node2D

var buffs

var main
var world 
var initBuff = GlobalStats.buffAmount
func _ready():
	main = self.get_parent()
	world = get_parent().get_child(0)
	buffs = get_children()
	
func _process(delta: float) -> void:
	if initBuff < GlobalStats.buffAmount:
		buyBuff(randi_range(0,buffs.size() -1))
		initBuff+=1
func buyBuff(i: int):
	buffs[i].activate()
	GlobalStats.buffList.append("" + buffs[i].title + ": " + buffs[i].desc)


func getWorld():
	return world
	
func getMain():
	return main
