extends Node2D
class_name scoreBasket

enum mode {SCORE, HURT, BONUS}
@export var currentMode = mode.SCORE
@export var damage: float = 1
@export var moneyAddAmount: int = 1
@export var moneyMult: int =1 
@export var id: int
var label

func _ready() -> void:
	label = $Control
	
func _process(delta: float) -> void:
	pass
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
	var cash = ( average/distrabution[id -1] + moneyAddAmount ) *moneyMult
	return cash

func mutateMult(i:int):
	self.moneyMult = i
