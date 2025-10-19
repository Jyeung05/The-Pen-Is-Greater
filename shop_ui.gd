extends Control
var paused = false

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false

func _on_open_shop_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		paused = true
		$shop.visible = true
		pause()
	if toggled_on == false:
		paused = false
		$shop.visible = false
		unpause()
