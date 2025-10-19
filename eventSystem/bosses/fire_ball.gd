extends Node2D

var xSpeed = 0
var ySpeed = 0

func _process(delta: float) -> void:
	self.position = Vector2(self.position.x  + xSpeed, self.position.y + ySpeed)
	print(self.position)
