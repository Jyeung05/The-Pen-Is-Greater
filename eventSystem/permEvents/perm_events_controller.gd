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
	#if Input.is_action_pressed("pen2"):
		#events[0].activate()
	#pass
	if reCounter < GlobalStats.restartCounter:
		print("recounter: " + str(reCounter))
		reCounter += 1
		deacFlag = true
		for i in actCounter:
			events[i].deactivate()
		eventClock()
		GlobalStats.eventList.clear()
		

func eventClock() -> void:
	for e in events:
		if deacFlag:
			deacFlag = false
			return
		await get_tree().create_timer(15,false).timeout
		if deacFlag:
			deacFlag = false
			return
		print("event activate")
		actCounter += 1
		e.activate()
		GlobalStats.eventList.append(e.desc)
