extends Node

@export var health: float = 100.0
@export var money: int = 0
@export var gravity: float = 1.0

enum penType {basic, elastic, phase, profit, NONE}
var currentPen = penType.basic

@export var ante: int = 300

@export var basicEnergyMax: int = 20000
@export var bounceEnergyMax: int =20000
@export var phaseEnergyMax: int = 10000
@export var profitEnergyMax: int = 10000

@export var basicEnergy: int = basicEnergyMax
@export var bounceEnergy: int = bounceEnergyMax
@export var phaseEnergy: int = phaseEnergyMax
@export var profitEnergy: int = profitEnergyMax

@onready var distrabution:Array = [1,1,1,1,1,1,1]
