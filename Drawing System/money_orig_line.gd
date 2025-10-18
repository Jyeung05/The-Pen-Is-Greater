extends basicLine

var staticBody: StaticBody2D = null
var area2d: Area2D = null
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
		GlobalStats.money += 1
