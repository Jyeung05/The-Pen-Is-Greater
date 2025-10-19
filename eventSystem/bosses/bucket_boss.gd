extends boss


var bossName = "\"The Bucket\""
var description = "Collects balls in a bucket"

func action() -> void:
	var xOff = randi_range(-1000,1000)
	var yOff = randi_range(-1000,1000)
	var p:Array = [Vector2(-1500.0 + xOff,-500 + yOff), Vector2(-1000 + xOff ,500+ yOff),
	 Vector2(1000 + xOff ,500+ yOff), Vector2(1500 + xOff,-500+ yOff)]
	
	var line = Line2D.new()
	line.points = p  # Fixed: remove brackets
	line.width = 80
	line.default_color = Color.YELLOW
	
	add_child(line)
	var static_body = StaticBody2D.new()
	# Position the static body at the same position as the line's parent
	static_body.global_position = global_position
	add_child(static_body)
	
	# Store reference to the Line2D in the StaticBody2D
	static_body.set_meta("line_owner", self)
	
	# Create collision segments for each line segment
	for i in range(p.size() - 1):
		var collision_shape = CollisionShape2D.new()
		var segment = SegmentShape2D.new()
		
		# Set the segment points
		segment.a = p[i]
		segment.b = p[i + 1]
		
		collision_shape.shape = segment
		static_body.add_child(collision_shape)
		
	static_body.collision_layer = 2
	static_body.collision_mask = 2

func deactivate() -> void:
	for child in get_children():
		child.queue_free()
