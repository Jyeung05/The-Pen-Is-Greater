extends Node2D


var events: Array = []
func _ready() -> void:
	events = get_children()
	events.shuffle()
	eventClock()
	

func eventClock() -> void:
	for event in events:
		await get_tree().create_timer(15).timeout
		print("event activate")
		event.activate()
		GlobalStats.eventList.append(event.desc)
