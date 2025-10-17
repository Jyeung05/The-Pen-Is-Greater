extends Line2D

var id = 0
var health: int = 1

func _process(delta: float) -> void:
	if health == 0 && id != 0 :
		queue_free()

func create_collision_from_line():
	# Create a StaticBody2D to hold the collision
	var static_body = StaticBody2D.new()
	get_parent().add_child(static_body)
	
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
	
