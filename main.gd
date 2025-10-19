extends Node2D

var gravityChange = 1
var rng = RandomNumberGenerator.new()
var currentAsteroid
@export var asteroidSize = Vector2(1,1)
@onready var asteroidScene: PackedScene = preload("res://Space Objects/Asteroid.tscn")
@export var spawnHeight = -4000
var reCounter = GlobalStats.restartCounter


func _ready() -> void:
	rng.randomize()
	currentAsteroid = asteroidScene
	spawnAsteroids()

#func _process(delta: float) -> void:
	if reCounter < GlobalStats.restartCounter:
		for c in get_children():
			if c is Asteroid:
				c.die()
		
func spawnAsteroids():
	while true:
		while get_tree().paused:
			await get_tree().process_frame
		var asteroid := asteroidScene.instantiate() as Asteroid
		
		
		asteroid.changeGravity(gravityChange)
		
		asteroid.global_position = Vector2(rng.randf_range(-200, 200), rng.randf_range(spawnHeight, spawnHeight + 500))
		var spread = deg_to_rad(20.0)
		asteroid.dir = Vector2.DOWN.rotated(rng.randf_range(-spread, spread))

		add_child(asteroid)
		await get_tree().create_timer(GlobalStats.spawnCooldown).timeout

func setGravity(amount):
	gravityChange = amount
	
	
func gravityAsteroid():
	for n in get_children():
		if n is Asteroid:
			n.changeGravity(gravityChange)
			
func flipSpawn():
	self.spawnHeight = spawnHeight * -1
	setGravity(self.gravityChange * -1)
	gravityAsteroid()
	var world = get_child(0)
	var baskets = world.getBaskets()
	for b:Node2D in baskets:
		b.global_position = Vector2(b.global_position.x, -b.global_position.y - 1000)
	
func unflipSpawn():
	self.spawnHeight = spawnHeight * -1
	setGravity(self.gravityChange * -1)
	gravityAsteroid()
	var world = get_child(0)
	var baskets = world.getBaskets()
	for b:Node2D in baskets:
		b.global_position = Vector2(b.global_position.x, -b.global_position.y + 1000)
	
