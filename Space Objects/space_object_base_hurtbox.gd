extends Area2D



	

func die():
	await get_tree().create_timer(0.1).timeout
	get_parent().queue_free()


func _on_area_entered(area: Area2D) -> void:
	die()
