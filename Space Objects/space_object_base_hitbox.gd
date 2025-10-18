extends Area2D

@export var damageToDeal: float = 20.0


func _on_body_entered(body: Node2D) -> void:
	print("Body entered: ", body.name)
	
	# Check if the body has a line_owner metadata
	if body.has_meta("line_owner"):
		var line_owner = body.get_meta("line_owner")
		if line_owner.has_method("takeDamage"):
			print("Found line with takeDamage function!")
			line_owner.takeDamage(damageToDeal)
	# Also check parent as fallback
	elif body.get_parent() != null and body.get_parent().has_method("takeDamage"):
		print("Found parent with takeDamage function!")
		body.get_parent().takeDamage(damageToDeal)
