extends Node2D


var rng = RandomNumberGenerator.new()
var currentAsteroid
@onready var asteroidScene: PackedScene = preload("res://Space Objects/Asteroid.tscn")

func _ready() -> void:
	rng.randomize()
	currentAsteroid = asteroidScene
	spawnAsteroids()
	$Control/moneyLabel.add_theme_font_size_override("font_size", 200)
	$Control/healthLabel.add_theme_font_size_override("font_size", 200)

func _process(delta: float) -> void:
	$Control/moneyLabel.text = "Money: " + str(GlobalStats.money)
	$Control/healthLabel.text = "Health: " + str(int(GlobalStats.health))

func spawnAsteroids():
	while true:
		var asteroid := asteroidScene.instantiate() as Asteroid
		asteroid.global_position = Vector2(rng.randf_range(-2000, 2000), rng.randf_range(-2000.0, -1500))
		var spread = deg_to_rad(20.0)
		asteroid.dir = Vector2.DOWN.rotated(rng.randf_range(-spread, spread))
		add_child(asteroid)
		await get_tree().create_timer(2).timeout
