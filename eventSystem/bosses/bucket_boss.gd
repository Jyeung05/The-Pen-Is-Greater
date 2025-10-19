extends boss


var bossName = "\"The Bucket\""
var description = "Collects balls in a bucket"
var area2d: Area2D = null
var bounceForce: float = 1500.0
var p:Array
func action() -> void:
	var xOff = randi_range(-1000,1000)
	var yOff = randi_range(-1000,1000)
	
	p = [Vector2(-1500.0 + xOff,-500 + yOff), Vector2(-1000 + xOff ,500+ yOff),
	 Vector2(1000 + xOff ,500+ yOff), Vector2(1500 + xOff,-500+ yOff)]
	var line = Line2D.new()
	line.points = p  # Fixed: remove brackets
	line.width = 80
	line.default_color = Color.RED
	
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
	
	createArea2d()

func createArea2d():
	area2d = Area2D.new()
	add_child(area2d)
	
	for i in range(p.size() - 1):
		var collisionShape = CollisionShape2D.new()
		var segment = SegmentShape2D.new()
		
		segment.a = p[i]
		segment.b = p[i + 1]
		
		collisionShape.shape = segment
		area2d.add_child(collisionShape)
	
	area2d.collision_layer = 2
	area2d.collision_mask = 2
	
	area2d.body_entered.connect(_onBodyEntered)

func _onBodyEntered(body: Node2D):
	if body is RigidBody2D:
		var bodyPos = body.global_position
		var closestPoint = getClosestPointOnLine(bodyPos)
		var bounceDirection = (bodyPos - closestPoint).normalized()
		
		body.apply_central_impulse(bounceDirection * bounceForce)

func getClosestPointOnLine(point: Vector2) -> Vector2:
	var closestPoint = p[0]
	var minDistance = point.distance_to(global_position + p[0])
	
	for i in range(p.size() - 1):
		var a = global_position + p[i]
		var b = global_position + p[i + 1]
		var closestOnSegment = getClosestPointOnSegment(point, a, b)
		var distance = point.distance_to(closestOnSegment)
		
		if distance < minDistance:
			minDistance = distance
			closestPoint = closestOnSegment - global_position
	
	return global_position + closestPoint

func getClosestPointOnSegment(point: Vector2, a: Vector2, b: Vector2) -> Vector2:
	var ab = b - a
	var ap = point - a
	var t = ap.dot(ab) / ab.length_squared()
	t = clamp(t, 0.0, 1.0)
	return a + ab * t

func deactivate() -> void:
	for child in get_children():
		child.queue_free()
