extends Control
class_name StatCard

@export var stat_id: StringName = &"damage"
@export var display_name: String = "Damage"
@export var max_level: int = 8
@export var level: int = 0

@export var filled_color: Color = Color("#3ddc84")
@export var empty_color: Color = Color("#263238")
@export var locked_color: Color = Color.BLACK

@export var global_var_max: StringName = &"basicEnergyMax"
@export var global_var: StringName = &"basicEnergy"
@export var lockedName: StringName = &"empty"
@export var upgrade_step: int = 1000
@export var upgradeCostMultiplyer: int = 2
@export var upgradeCost: int = 3

@export var unlockCost: int = 0

@onready var name_label: Label = $VBoxContainer/nameLabel
@onready var plus_btn: Button = $VBoxContainer/HBoxContainer2/plusButton
@onready var segments: HBoxContainer = $VBoxContainer/segments

func _ready() -> void:
	name_label.text = display_name
	plus_btn.pressed.connect(_on_plus)
	_refresh()
	if GlobalStats.get(lockedName) == false:
		plus_btn.text = "Unlock for: $" + str(unlockCost)
	else:
		plus_btn.text = "Upgrade Cost: $" + str(upgradeCost)
	print(GlobalStats.get(lockedName))

func _on_plus() -> void:
	print(lockedName)
	if GlobalStats.money >= upgradeCost and GlobalStats.get(lockedName) == true:
		if level >= max_level:
			return
		level += 1
		GlobalStats.set(global_var, GlobalStats.get(global_var) + upgrade_step)
		GlobalStats.set(global_var_max, GlobalStats.get(global_var_max) + upgrade_step)
		GlobalStats.money -= upgradeCost
		upgradeCost = upgradeCost * upgradeCostMultiplyer
		plus_btn.text = "Upgrade Cost: $" + str(upgradeCost)
		_refresh()
	
	if GlobalStats.money >= unlockCost and GlobalStats.get(lockedName) == false:
		GlobalStats.money -= unlockCost
		GlobalStats.set(lockedName, true)
		plus_btn.text = "Upgrade Cost: $" + str(upgradeCost)
		_refresh()
	
	if GlobalStats.money >= upgradeCost and global_var_max == "spawn":
		if level >= max_level:
			return
		level +=1
		GlobalStats.set(global_var, GlobalStats.get(global_var) * 0.5)
		GlobalStats.money -= upgradeCost
		upgradeCost = upgradeCost * upgradeCostMultiplyer
		plus_btn.text = "Upgrade Cost: $" + str(upgradeCost)
		_refresh()
	
	if GlobalStats.money >= upgradeCost and global_var_max == "worth":
		if level >= max_level:
			return
		level +=1
		GlobalStats.set(global_var, GlobalStats.get(global_var) + 1)
		GlobalStats.money -= upgradeCost
		upgradeCost = upgradeCost * upgradeCostMultiplyer
		plus_btn.text = "Upgrade Cost: $" + str(upgradeCost)
		_refresh()

	if GlobalStats.money >= upgradeCost and global_var_max == "buffMax":
		if level >= max_level:
			return
		level +=1
		GlobalStats.set(global_var, GlobalStats.get(global_var) + 1)
		GlobalStats.money -= upgradeCost
		upgradeCost = upgradeCost * upgradeCostMultiplyer
		plus_btn.text = "Upgrade Cost: $" + str(upgradeCost)
		_refresh()

func _refresh() -> void:
	for i in range(segments.get_child_count()):
		var r := segments.get_child(i) as ColorRect
		if GlobalStats.get(lockedName) == false:
			r.color = locked_color
		else:
			r.color = filled_color if i < level else empty_color
	plus_btn.disabled = (level >= max_level)
