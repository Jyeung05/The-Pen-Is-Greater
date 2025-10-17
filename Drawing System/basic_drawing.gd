extends Node2D

var line:Line2D
var points:Array = []


func _ready() -> void:
	line = self.get_child(0).duplicate()
	line.width = 4
	line.id = 1
	line.default_color = Color.YELLOW
	add_child(line)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouseClick"):
		startNew()
	if Input.is_action_pressed("mouseClick"):
		points.append(get_global_mouse_position())
		line.points = points
	if Input.is_action_just_released("mouseClick"):
		line.create_collision_from_line()
	


func startNew():
	line = self.get_child(0).duplicate()
	self.points.clear()
	line.width = 4
	line.default_color = Color.YELLOW
	line.id = 1
	add_child(line)
	
	
