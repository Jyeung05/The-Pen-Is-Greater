extends Node2D

var buffs

var main
var world 
var initBuff = GlobalStats.buffAmount
var reC = GlobalStats.restartCounter

func _ready():
	main = self.get_parent()
	world = get_parent().get_child(0)
	buffs = get_children()
	
func _process(delta: float) -> void:
	if initBuff < GlobalStats.buffAmount:
		buyBuff(randi_range(0,buffs.size() -1))
		initBuff+=1
		
	if reC < GlobalStats.restartCounter:
		for c in get_children() :
			c.deactivate()
		reC += 1
		GlobalStats.buffList.clear()
func buyBuff(i: int):
	buffs[i].activate()
	GlobalStats.buffList.append("" + buffs[i].title + ": " + buffs[i].desc)


func getWorld():
	return world
	
func getMain():
	return main
