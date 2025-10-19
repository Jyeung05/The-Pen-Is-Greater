extends Node2D
#a spawner for events. this will act as a controller, enabling and disabling events
#bosses are temporary large events

var bosses: Array = []
func _ready() -> void:
	bosses = get_children()
	bossClock()
	
func _process(delta: float) -> void:
	#if Input.is_action_pressed("pen1"):
		#bosses[2].activate()
		#await get_tree().create_timer(5).timeout
		#bosses[2].deactivate
	pass
func bossClock() -> void:
	while true:
		var response:bool = false
		print("boss timer start")
		await get_tree().create_timer(3).timeout
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
		await get_tree().create_timer(5).timeout
		response = false
		bosses[select].deactivate()
		GlobalStats.eventList.pop_at(eventListPoint)
		print("boss despawned")
