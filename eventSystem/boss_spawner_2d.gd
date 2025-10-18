extends Node2D
#a spawner for events. this will act as a controller, enabling and disabling events
#bosses are temporary large events

var bosses: Array = []
func _ready() -> void:
	bosses = get_children()
	bossClock()
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("pen1"):
		bosses[1].activate()
		await get_tree().create_timer(5).timeout
		bosses[1].deactivate
func bossClock() -> void:
	while true:
		var response:bool = false
		print("boss timer start")
		await get_tree().create_timer(40).timeout
		var select
		while !response:
			print("spawning boss")
			var rng = RandomNumberGenerator.new()
			select = rng.randi_range(0, bosses.size() - 1)
			response = bosses[select].activate()
		print("despawning boss")
		await get_tree().create_timer(20).timeout
		response = false
		bosses[select].deactivate()
		print("boss despawned")
