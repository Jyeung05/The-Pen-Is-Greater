extends Area2D


func _on_body_entered(body: Node2D) -> void:
	pass
	

func die():
	queue_free()
