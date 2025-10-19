extends Node2D
var deacFlag = false
var events: Array = []
var reCounter = GlobalStats.restartCounter
var actCounter = 0

func _ready() -> void:
	events = get_children()
	events.shuffle()
	eventClock()
	
func _process(delta: float) -> void:
	if reCounter < GlobalStats.restartCounter:
		print("recounter: " + str(reCounter))
		reCounter += 1
		deacFlag = true
		for c in events:
			c.deactivate()
		actCounter = 0  # Reset counter
		eventClock()
		GlobalStats.eventList.clear()
		
func eventClock() -> void:
	for e in events:
		# Check flag before waiting
		if deacFlag:
			deacFlag = false
			return
			
		await get_tree().create_timer(15, false).timeout
		
		# Check flag after waiting
		if deacFlag:
			deacFlag = false
			return
			
		print("event activate")
		actCounter += 1
		e.activate()
		GlobalStats.eventList.append(e.desc)
