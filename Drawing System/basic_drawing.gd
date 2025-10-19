extends Node2D
class_name basicDrawing

@export var selected:bool = false
var line:Line2D
var points:Array = []
var distance: float = 0.0
var currentEnergy:int = 0
var failToDraw: bool = false
var type = GlobalStats.penType.basic
var health: float = 1.0

# Change this one line to target different energy types
var energyTarget: String = "basicEnergy"
var colour = Color.YELLOW

func refund(health) -> void:
	set_energy(getEnergy() + health)
	
func _ready() -> void:
	startNew()

func _process(delta: float) -> void:
	if !self.selected:
		return
	if Input.is_action_just_pressed("mouseClick"):
		startNew()
		currentEnergy = getEnergy()  # Use getter function
		points.append(get_global_mouse_position())
		
	if Input.is_action_pressed("mouseClick"):
		if getEnergy() > 0:  # Use getter function
			var newPoint = get_global_mouse_position()
			if points.size() > 1:
				var oldPoint = points[points.size() -1]
				var distance = (newPoint.distance_to(oldPoint))
				if floor(distance) >= getEnergy():  # Use getter function
					failToDraw = true
					return
				set_energy(getEnergy() - floor(distance))  # Use setter function
				health = (distance + health)
			points.append(newPoint)
			line.points = points

			
	if Input.is_action_just_released("mouseClick"):
		if failToDraw:
			points.clear()
			line.points = points
			set_energy(currentEnergy)  # Use setter function
			return
		line.health = health
		line.create_collision_from_line()
		self.get_parent().addToList(line)

# Helper functions to get/set the energy
func getEnergy() -> int:
	return GlobalStats.get(energyTarget)

func set_energy(value: int) -> void:
	GlobalStats.set(energyTarget, value)

func startNew():
	line = self.get_child(0).duplicate()
	self.points.clear()
	line.width = 40
	line.default_color = colour
	line.id = 1
	self.health = 1
	self.distance = 0.0
	self.failToDraw = false
	add_child(line)
	
func select():
	self.selected = true
func deselect():
	self.selected = false
