extends Control


func _process(delta: float) -> void:
	$moneyLabel.text = "Score: " + str(GlobalStats.money)
	$healthLabel.text = "Health: " + str(int(GlobalStats.health)) 
	$anteLabel.text = "Score Needed: " + str(GlobalStats.ante)
	$eventLabel.text = "Events: \n" + eventListToString()
	$buffLabel.text = "Buffs: \n" + buffListToString()
	$anteCountdown.text = "Time Remaining: " + str(GlobalStats.anteCountDown)
	inkBar()
	
func buffListToString() -> String:
	var s:String = ""
	for line in GlobalStats.buffList:
		s = s + line +"\n"
	return s
	
func eventListToString() -> String:
	var s:String = ""
	for line in GlobalStats.eventList:
		s = s + line +"\n"
	return s
	
func _ready() -> void:
	pass
	$anteLabel.add_theme_font_size_override("font_size", 200)
	$eventLabel.add_theme_font_size_override("font_size", 100)
	$buffLabel.add_theme_font_size_override("font_size", 100)

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
