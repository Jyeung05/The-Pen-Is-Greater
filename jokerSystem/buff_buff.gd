extends buff

func _ready() -> void:
	title = "buff buff"
	desc = "+x0.7 mult for each pockets for each other buff"
	
	
func activate():
	var increase = GlobalStats.buffList.size() * 0.7
	self.desc = "+x0.7 mult for each pockets for each buff (" + str(increase) + ")"
	var baskets = get_parent().getWorld().getBaskets()
	for b in baskets:
		b.moneyMult += increase

func deactivate():
	pass
