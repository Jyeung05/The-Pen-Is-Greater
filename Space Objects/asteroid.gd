extends RigidBody2D
class_name Asteroid
@export var damageToDeal: float = 500.0
@export var speed: float = 500.0 # Player movement speed
var dir: Vector2 = Vector2.RIGHT

@onready var trail := $GPUParticles2D
var velocity: Vector2

func _physics_process(delta: float) -> void:
	apply_central_impulse(dir)
	var v := velocity
	if v.length() > 0.0001:
		var pm := trail.process_material as ParticleProcessMaterial
		pm.direction = Vector3(-v.x, -v.y, 0).normalized()  # Vector3 required
		# Optional: keep node unrotated
		trail.rotation = 0.0
	
func randomShoot(v: Vector2) -> void:
	dir = v * 20
	
func takeDamage(some):
	print(some)
