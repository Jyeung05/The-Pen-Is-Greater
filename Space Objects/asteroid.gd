extends RigidBody2D
class_name Asteroid

@export var damageToDeal: float = 500.0
@export var speed: float = 500.0
var dir: Vector2 = Vector2.RIGHT



@onready var trail: GPUParticles2D = $GPUParticles2D
var velocity: Vector2

@export var move_threshold: float = 10.0   # px/s; below this => stop emitting

var _was_emitting := true

func _ready() -> void:
	_was_emitting = true
	trail.emitting = true   # start as-is; no amount/alpha changes
func _physics_process(delta: float) -> void:
	apply_central_impulse(dir)

	velocity = linear_velocity
	var spd := velocity.length()
	var should_emit := spd >= move_threshold

	# Toggle emitting only when state changes; do NOT tween amount/alpha
	if should_emit != _was_emitting:
		_was_emitting = should_emit
		trail.emitting = should_emit
		# Optional: if turning off, you can delay any cleanup until after lifetime:
		# if !should_emit:
		#     await get_tree().create_timer(trail.lifetime).timeout
		#     # nothing else needed; leftover particles already faded out

	# keep your direction logic unchanged
	if spd > 0.0001:
		var pm := trail.process_material as ParticleProcessMaterial
		pm.direction = Vector3(-velocity.x, -velocity.y, 0).normalized()
		trail.rotation = 0.0

# your existing helpers
func randomShoot(v: Vector2) -> void:
	dir = v * 20

func takeDamage(some):
	print(some)
func die() -> void:
	queue_free()
	
func changeGravity(amount):
	self.gravity_scale = amount



	
