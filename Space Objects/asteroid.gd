extends RigidBody2D
class_name Asteroid
@export var damageToDeal: float = 500.0
@export var speed: float = 500.0 # Player movement speed
var dir: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	self.gravity_scale = GlobalStats.gravity
	
func _ready() -> void:
	body_entered.connect(_on_space_object_base_hitbox_body_entered)
func takeDamage(some):
	print(some)

func _on_space_object_base_hitbox_body_entered(body: Node2D) -> void:
	print("Body entered: ", body.name)
	
	# Check if the body has a line_owner metadata
	if body.has_meta("line_owner"):
		var line_owner = body.get_meta("line_owner")
		if line_owner.has_method("takeDamage"):
			print("Found line with takeDamage function!")
			line_owner.takeDamage(damageToDeal)
	# Also check parent as fallback
	elif body.get_parent() != null and body.get_parent().has_method("takeDamage"):
		print("Found parent with takeDamage function!")
		body.get_parent().takeDamage(damageToDeal)
