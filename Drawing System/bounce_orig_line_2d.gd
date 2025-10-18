extends basicLine


var staticBody: StaticBody2D = null
var area2d: Area2D = null
var damage: int
var bounceForce: float = 1500.0

func _process(delta: float) -> void:
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
	
	createArea2d()

func createArea2d():
	area2d = Area2D.new()
	add_child(area2d)
	
	for i in range(points.size() - 1):
		var collisionShape = CollisionShape2D.new()
		var segment = SegmentShape2D.new()
		
		segment.a = points[i]
		segment.b = points[i + 1]
		
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
	var closestPoint = points[0]
	var minDistance = point.distance_to(global_position + points[0])
	
	for i in range(points.size() - 1):
		var a = global_position + points[i]
		var b = global_position + points[i + 1]
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
