extends basicLine
#phase

var staticBody: StaticBody2D = null
var area2d: Area2D = null
var damage: int
var canSwitch: bool = true
var canPhase: bool = true
var enabled = true

func _process(delta: float) -> void:
	if enabled:
		self.default_color = Color.GREEN
	else:
		self.default_color = Color.DARK_GREEN

	if health <= 0 && id != 0:
		queue_free()

func takeDamage(damage) -> void:
	self.health -= damage

func create_collision_from_line():
	staticBody = StaticBody2D.new()
	add_child(staticBody)
	
	staticBody.set_meta("line_owner", self)
	
	for i in range(points.size() - 1):
		var collisionShape = CollisionShape2D.new()
		var segment = SegmentShape2D.new()
		
		segment.a = points[i]
		segment.b = points[i + 1]
		
		collisionShape.shape = segment
		staticBody.add_child(collisionShape)
		
	staticBody.collision_layer = 2
	staticBody.collision_mask = 2
	while true:
		await get_tree().create_timer(5, false).timeout
		staticBody.set_deferred("collision_layer", 2 if enabled else 0)
		staticBody.set_deferred("collision_mask", 2 if enabled else 0)
		enabled = !enabled
		
