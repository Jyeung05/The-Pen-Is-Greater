extends Control


func _process(delta: float) -> void:
	$moneyLabel.text = "Money: " + str(GlobalStats.money)
	$healthLabel.text = "Health: " + str(int(GlobalStats.health)) 
	inkBar()

func _ready() -> void:
	$moneyLabel.add_theme_font_size_override("font_size", 200)
	$healthLabel.add_theme_font_size_override("font_size", 200)
	
func inkBar():
	if GlobalStats.currentPen == GlobalStats.penType.basic:
		$penInk.max_value = GlobalStats.basicEnergyMax
		$penInk.value = GlobalStats.basicEnergy
		var fill := StyleBoxFlat.new()
		fill.bg_color = Color.YELLOW
		$penInk.add_theme_stylebox_override("fill", fill)
	if GlobalStats.currentPen == GlobalStats.penType.elastic:
		$penInk.max_value = GlobalStats.bounceEnergyMax
		$penInk.value = GlobalStats.bounceEnergy 
		var fill := StyleBoxFlat.new()
		fill.bg_color = Color.RED
		$penInk.add_theme_stylebox_override("fill", fill)
	if GlobalStats.currentPen == GlobalStats.penType.phase:
		$penInk.max_value = GlobalStats.phaseEnergyMax
		$penInk.value = GlobalStats.phaseEnergy
		var fill := StyleBoxFlat.new()
		fill.bg_color = Color.GREEN
		$penInk.add_theme_stylebox_override("fill", fill)
	if GlobalStats.currentPen == GlobalStats.penType.profit:
		$penInk.max_value = GlobalStats.profitEnergyMax
		$penInk.value = GlobalStats.profitEnergy
		var fill := StyleBoxFlat.new()
		fill.bg_color = Color.SKY_BLUE
		$penInk.add_theme_stylebox_override("fill", fill)
