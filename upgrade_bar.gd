extends Control
@onready var points_label: Label = $HBoxContainer/pointsLabel

func _ready() -> void:
	for card in $HBoxContainer.get_children():
		if card is StatCard:
			card._refresh()
