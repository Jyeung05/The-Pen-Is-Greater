extends Node2D
class_name scoreBasket

enum mode {SCORE, HURT, BONUS}
@export var currentMode = mode.SCORE
@export var damage: float = 1
var moneyAddAmount: int =  GlobalStats.asteroidWorth
@export var moneyMult: float = 1.0
@export var id: int = 1
var label
var reCounter = GlobalStats.restartCounter

func _ready() -> void:
	label = $Control
	
func _process(delta: float) -> void:
	if reCounter > GlobalStats.restartCounter:
		currentMode = mode.SCORE
		moneyAddAmount = GlobalStats.asteroidWorth
		moneyMult = 1
		$colorRect.color = Color("f8001d")
		reCounter += 1
	
	
func switchMode():
	if currentMode == mode.SCORE:
		$ColorRect.color = Color("f8001d")
		currentMode = mode.HURT
	elif currentMode == mode.HURT:
		$ColorRect.color = Color("8bd689")
		currentMode == mode.SCORE

func bonusSwitcher():
	if currentMode == mode.SCORE:
		$ColorRect.color = ("bab51c")
		currentMode = mode.BONUS
	elif currentMode == mode.BONUS:
		$ColorRect.color = Color("8bd689")
		currentMode == mode.SCORE


func _on_area_2d_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(0.1).timeout
	GlobalStats.distrabution[id - 1] += 1
	if currentMode == mode.SCORE:
		GlobalStats.money += money()
	elif currentMode == mode.HURT:
		GlobalStats.health = GlobalStats.health - damage
	elif currentMode == mode.BONUS:
		GlobalStats.money = GlobalStats.money + money() + 3
		
func money() -> int:
	var distrabution = GlobalStats.distrabution
	var sum = 0
	for val in distrabution:
		sum += val
	var average = sum/7
	print(sum)
	print(moneyAddAmount)
	print(moneyMult)
	var cash = int( ceil((float(average)/float(distrabution[id -1])) * moneyAddAmount  * moneyMult))
	print(cash)
	return max(cash,1)

func mutateMult(i:int):
	self.moneyMult = i

func returnToScore():
	if self.currentMode == mode.BONUS:
		bonusSwitcher()
