extends basicDrawing




# Change this one line to target different energy types

func _ready() -> void:
	energyTarget = "profitEnergy"
	colour = Color.SKY_BLUE
	startNew()
func refund(health) -> void:
	set_energy(getEnergy() + health)


	
func select():
	self.selected = true
func deselect():
	self.selected = false
