extends boss

var fire:bool = true
var fireScene = preload("res://eventSystem/bosses/fireBall.tscn")

var bossName = "\"Fire Storm\""
var description = "The wizards are angry. FIREBALL!"

func action():
	fire = true
	while fire:
		print("fireBall")
		var newFB = fireScene.instantiate()
		newFB.xSpeed = randi_range(-100,-200)
		newFB.ySpeed = randi_range(-50,50)
		newFB.position = Vector2(4000, -1000)
		add_child(newFB)
		await get_tree().create_timer(1,false).timeout
	
	
func deactivate():
	fire = false
	for c in get_children():
		c.queue_free()
	pass
