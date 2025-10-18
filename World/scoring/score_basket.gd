extends Node2D

enum mode {SCORE, HURT, BONUS}
@export var currentMode = mode.SCORE
@export var damage: float = 1
@export var moneyAddAmount: int = 1

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
	if currentMode == mode.SCORE:
		GlobalStats.money += moneyAddAmount
	elif currentMode == mode.HURT:
		GlobalStats.health = GlobalStats.health - damage
	elif currentMode == mode.BONUS:
		GlobalStats.money = GlobalStats.money + moneyAddAmount + 3
