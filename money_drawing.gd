extends basicDrawing




# Change this one line to target different energy types

func _ready() -> void:
	energyTarget = "profitEnergy"
	colour = Color.SKY_BLUE
	startNew()
func refund(health) -> void:
	set_energy(getEnergy() + health)


func startNew():
	line = self.get_child(0).duplicate()
	self.points.clear()
	line.width = 4
	line.default_color = colour
	line.id = 1
	self.health = 1
	self.distance = 0.0
	self.failToDraw = false
	add_child(line)
	
func select():
	self.selected = true
func deselect():
	self.selected = false
