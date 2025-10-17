extends CharacterBody2D
class_name Asteroid

@export var speed: float = 500.0 # Player movement speed
var dir: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	self.velocity = dir * speed
	move_and_slide()
