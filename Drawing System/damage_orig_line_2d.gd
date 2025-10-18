extends Line2D
var id = 0
var health: int = 1
var static_body: StaticBody2D = null  # Store reference to the collision body
var damage: int

func _process(delta: float) -> void:
	print(self.health)
	if health <= 0 && id != 0:
		# Free the static body first if it exists

		queue_free()

func takeDamage(damage) -> void:
	self.health -= damage

func create_collision_from_line():
	# Create a StaticBody2D to hold the collision
	static_body = StaticBody2D.new()
	add_child(static_body)
	
	# Store reference to the Line2D in the StaticBody2D
	static_body.set_meta("line_owner", self)
	
	# Create collision segments for each line segment
	for i in range(points.size() - 1):
		var collision_shape = CollisionShape2D.new()
		var segment = SegmentShape2D.new()
		
		# Set the segment points
		segment.a = points[i]
		segment.b = points[i + 1]
		
		collision_shape.shape = segment
		static_body.add_child(collision_shape)
		
	static_body.collision_layer = 2
	static_body.collision_mask = 2
