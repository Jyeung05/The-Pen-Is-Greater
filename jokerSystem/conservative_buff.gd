extends buff


func _ready() -> void:
	
	title = "Pincher"
	desc = "every 10 seconds, gain money equal to leftover pen"

func activate():
	while true:
		await get_tree().create_timer(10, false).timeout
		GlobalStats.money += ( GlobalStats.basicEnergy + GlobalStats.bounceEnergy + GlobalStats.phaseEnergy + GlobalStats.profitEnergy )/ 100
