extends RigidBody2D
class_name Asteroid
@export var damageToDeal: float = 500.0
@export var speed: float = 500.0 # Player movement speed
var dir: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	apply_central_impulse(dir)
	
func randomShoot(v: Vector2) -> void:
	dir = v * 20
	
func takeDamage(some):
	print(some)
