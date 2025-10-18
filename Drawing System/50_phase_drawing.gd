extends basicDrawing

# Change this one line to target different energy types

func _ready() -> void:
	energyTarget = "phaseEnergy"
	colour = Color.GREEN
	startNew()
func refund(health) -> void:
	set_energy(getEnergy() + health)

# Helper functions to get/set the energy
func getEnergy() -> int:
	return GlobalStats.get(energyTarget)

func set_energy(value: int) -> void:
	GlobalStats.set(energyTarget, value)


	
func select():
	self.selected = true
func deselect():
	self.selected = false
