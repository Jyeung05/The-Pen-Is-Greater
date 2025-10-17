extends RigidBody2D
class_name Asteroid

@export var speed: float = 500.0 # Player movement speed
var dir: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	self.gravity_scale = GlobalStats.gravity
	
