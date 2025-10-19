extends Node2D

var desc = "6 pegs to block your path"

func activate():
	print("pegs")
	var positions = [
		Vector2(0.0, -800.0),
		Vector2(-800, 0.0),
		Vector2(800, 000.0),
		Vector2(-1600, 800),
		Vector2(0, 800),
		Vector2(1600, 800)
	]
	
	for pos in positions:
		var circleBody = StaticBody2D.new()
		circleBody.position = pos
		
		var collisionShape = CollisionShape2D.new()
		var circleShape = CircleShape2D.new()
		circleShape.radius = 100
		collisionShape.shape = circleShape
		
		var sprite = Sprite2D.new()
		var texture = createCircleTexture(100, Color.YELLOW)
		sprite.texture = texture
		
		circleBody.add_child(collisionShape)
		circleBody.add_child(sprite)
		add_child(circleBody)
		circleBody.collision_layer = 2
		circleBody.collision_mask = 2

func createCircleTexture(radius: float, color: Color) -> ImageTexture:
	var img = Image.create(int(radius * 2), int(radius * 2), false, Image.FORMAT_RGBA8)
	
	for x in range(int(radius * 2)):
		for y in range(int(radius * 2)):
			var dx = x - radius
			var dy = y - radius
			if dx * dx + dy * dy <= radius * radius:
				img.set_pixel(x, y, color)
	
	return ImageTexture.create_from_image(img)
