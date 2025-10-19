extends Node2D
var desc = "10 pegs to block your path"
var bounceForce: float = 500.0

func activate():
	print("pegs")
	var positions = [
		Vector2(0.0, -1600.0),
		Vector2(-800, -800.0),
		Vector2(800, -800.0),
		Vector2(-1600, 000),
		Vector2(0, 000),
		Vector2(1600, 000),
		Vector2(2400, 800), 
		Vector2(800, 800), 
		Vector2(-800, 800), 
		Vector2(-2400, 800), 
	]
	
	for pos in positions:
		createPeg(pos)

func createPeg(pos: Vector2):
	var circleBody = StaticBody2D.new()
	circleBody.position = pos
	
	# Static collision
	var collisionShape = CollisionShape2D.new()
	var circleShape = CircleShape2D.new()
	circleShape.radius = 100
	collisionShape.shape = circleShape
	
	var sprite = Sprite2D.new()
	var texture = createCircleTexture(100, Color.RED)
	sprite.texture = texture
	
	circleBody.add_child(collisionShape)
	circleBody.add_child(sprite)
	circleBody.collision_layer = 2
	circleBody.collision_mask = 2
	
	# Area2D for bounce detection
	var area2d = Area2D.new()
	var areaCollision = CollisionShape2D.new()
	var areaShape = CircleShape2D.new()
	areaShape.radius = 100
	areaCollision.shape = areaShape
	
	area2d.add_child(areaCollision)
	area2d.collision_layer = 2
	area2d.collision_mask = 2
	area2d.body_entered.connect(_onBodyEntered.bind(circleBody))
	
	circleBody.add_child(area2d)
	add_child(circleBody)

func _onBodyEntered(body: Node2D, peg: StaticBody2D):
	if body is RigidBody2D:
		var bodyPos = body.global_position
		var pegPos = peg.global_position
		var bounceDirection = (bodyPos - pegPos).normalized()
		
		body.apply_central_impulse(bounceDirection * bounceForce)

func createCircleTexture(radius: float, color: Color) -> ImageTexture:
	var img = Image.create(int(radius * 2), int(radius * 2), false, Image.FORMAT_RGBA8)
	
	for x in range(int(radius * 2)):
		for y in range(int(radius * 2)):
			var dx = x - radius
			var dy = y - radius
			if dx * dx + dy * dy <= radius * radius:
				img.set_pixel(x, y, color)
	
	return ImageTexture.create_from_image(img)
