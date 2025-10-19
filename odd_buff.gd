extends buff

func _ready() -> void:
	title = "odds"
	desc = "odd pockets give +2"
	
func activate():
	var baskets = get_parent().getWorld().getBaskets()
	for b in baskets:
		if b.id % 2 == 1:
			b.moneyAddAmount += 2
	
