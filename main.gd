extends Node2D

var gravityChange = 1
var rng = RandomNumberGenerator.new()
var currentAsteroid
@export var asteroidSize = Vector2(1,1)
@onready var asteroidScene: PackedScene = preload("res://Space Objects/Asteroid.tscn")

func _ready() -> void:
	rng.randomize()
	currentAsteroid = asteroidScene
	spawnAsteroids()


func spawnAsteroids():
	while true:
		while get_tree().paused:
			await get_tree().process_frame
		var asteroid := asteroidScene.instantiate() as Asteroid
		
		
		asteroid.changeGravity(gravityChange)
		
		asteroid.global_position = Vector2(rng.randf_range(-200, 200), rng.randf_range(-4000.0, -3500))
		var spread = deg_to_rad(20.0)
		asteroid.dir = Vector2.DOWN.rotated(rng.randf_range(-spread, spread))

		add_child(asteroid)
		await get_tree().create_timer(0.1).timeout

func setGravity(amount):
	gravityChange = amount
	

	
