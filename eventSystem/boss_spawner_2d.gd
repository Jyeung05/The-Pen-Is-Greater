extends Node2D
#a spawner for events. this will act as a controller, enabling and disabling events
#bosses are temporary large events
var bosses: Array = []

func _ready() -> void:
	bosses = get_children()
	bossClock()

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("pen1"):
		#bosses[4].activate()
		#await get_tree().create_timer(5, false).timeout  # Added pause-aware parameter
		#bosses[4].deactivate()


	
func bossClock() -> void:
	while true:
		var response:bool = false
		print("boss timer start")
		await get_tree().create_timer(30, false).timeout  # Added pause-aware parameter
		var select
		var eventListPoint = 0
		while !response:
			print("spawning boss")
			var rng = RandomNumberGenerator.new()
			select = rng.randi_range(0, bosses.size() - 1)
			response = bosses[select].activate()
			GlobalStats.eventList.append("Boss Event: " + bosses[select].bossName + ", " + bosses[select].description)
			eventListPoint = GlobalStats.eventList.size() - 1
		print("despawning boss")
		await get_tree().create_timer(15, false).timeout  # Added pause-aware parameter
		response = false
		bosses[select].deactivate()
		GlobalStats.eventList.pop_at(eventListPoint)
		print("boss despawned")
