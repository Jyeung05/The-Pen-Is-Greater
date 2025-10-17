extends Node2D


var rng = RandomNumberGenerator.new()
var currentAsteroid
@onready var asteroidScene: PackedScene = preload("res://Space Objects/Asteroid.tscn")

func _ready() -> void:
	rng.randomize()
	currentAsteroid = asteroidScene
	spawnAsteroids()

func spawnAsteroids():
	while true:
		var asteroid := asteroidScene.instantiate() as Asteroid
		asteroid.global_position = Vector2(rng.randf_range(0.0, 1250.0), rng.randf_range(-250.0, 0.0))
		var spread = deg_to_rad(20.0)
		asteroid.dir = Vector2.DOWN.rotated(rng.randf_range(-spread, spread))
		add_child(asteroid)
		await get_tree().create_timer(2).timeout
