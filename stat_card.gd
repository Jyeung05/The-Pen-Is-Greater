extends Control
class_name StatCard

@export var stat_id: StringName = &"damage"
@export var display_name: String = "Damage"
@export var max_level: int = 8
@export var level: int = 0

@export var filled_color: Color = Color("#3ddc84")
@export var empty_color: Color = Color("#263238")

@export var global_var_max: StringName = &"basicEnergyMax"
@export var global_var: StringName = &"basicEnergy"
@export var upgrade_step: int = 1000
@export var upgradeCostMultiplyer: int = 2
@export var upgradeCost: int = 3

@onready var name_label: Label = $VBoxContainer/nameLabel
@onready var plus_btn: Button = $VBoxContainer/HBoxContainer2/plusButton
@onready var segments: HBoxContainer = $VBoxContainer/segments

func _ready() -> void:
	name_label.text = display_name
	plus_btn.pressed.connect(_on_plus)
	_refresh()
	plus_btn.text = "Upgrade Cost: " + str(upgradeCost)

func _on_plus() -> void:
	if GlobalStats.money > upgradeCost:
		if level >= max_level:
			return
		level += 1
		GlobalStats.set(global_var, GlobalStats.get(global_var) + upgrade_step)
		GlobalStats.set(global_var_max, GlobalStats.get(global_var_max) + upgrade_step)
		GlobalStats.money -= upgradeCost
		upgradeCost = upgradeCost * upgradeCostMultiplyer
		plus_btn.text = "Upgrade Cost: " + str(upgradeCost)
		_refresh()
		

func _refresh() -> void:
	for i in range(segments.get_child_count()):
		var r := segments.get_child(i) as ColorRect
		r.color = filled_color if i < level else empty_color
	plus_btn.disabled = (level >= max_level)
