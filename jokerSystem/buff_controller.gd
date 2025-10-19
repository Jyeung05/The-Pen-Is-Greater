extends Node2D

var buffs

var main = get_parent()
var world = get_parent().get_child(0)
func _ready():
	buffs =get_children()
	
func buyBuff(i: int):
	buffs[i].activate()
		
	
