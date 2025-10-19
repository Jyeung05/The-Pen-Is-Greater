extends buff

var deactivateF = false

func _ready() -> void:
	
	title = "Pincher"
	desc = "every 10 seconds, gain money equal to leftover pen"

func activate():
	while !deactivateF:
		await get_tree().create_timer(10, false).timeout
		if deactivateF:
			deactivateF = false
			return
		GlobalStats.money += ( GlobalStats.basicEnergy + GlobalStats.bounceEnergy + GlobalStats.phaseEnergy + GlobalStats.profitEnergy )/ 100
	deactivateF = false

func deactivate():
	deactivateF = true
	
