extends Control

var id

func _process(delta: float) -> void:
	$Label.text = "" + str(GlobalStats.distrabution[int(id - 1 )])



func _ready() -> void:
	id = get_parent().id
	$Label.add_theme_font_size_override("font_size", 200)

	
