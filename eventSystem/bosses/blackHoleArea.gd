extends Area2D

var eventHorizon = 100
var pullForce = 1000000000

func _physics_process(delta: float) -> void:
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body is RigidBody2D:
			var direction = global_position - body.global_position
			var distance = direction.length()
			
		
			if distance > eventHorizon:
				var force = pullForce / (distance * distance)
				body.apply_force(direction.normalized() * force)
				print(force*delta *direction.normalized())
			else :
				body.queue_free()
