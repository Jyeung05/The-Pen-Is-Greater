extends Node

@export var health: float = 100.0
@export var money: int = 0
@export var gravity: float = 1.0

enum penType {basic, elastic, phase, profit, NONE}
var currentPen = penType.basic

@export var ante: int = 5

@export var basicUnlocked: bool = true
@export var bounceUnlocked: bool = false
@export var phaseUnlocked: bool = false
@export var profitUnlocked: bool = false

@export var basicEnergyMax: int = 2000
@export var bounceEnergyMax: int = 2000
@export var phaseEnergyMax: int = 1000
@export var profitEnergyMax: int = 1000

@export var basicEnergy: int = basicEnergyMax
@export var bounceEnergy: int = bounceEnergyMax
@export var phaseEnergy: int = phaseEnergyMax
@export var profitEnergy: int = profitEnergyMax

@onready var distrabution:Array = [1,1,1,1,1,1,1]

@export var eventList:Array = []

@export var buffList:Array = []
@export var buffAmount = 0
@export var buffMax = 8

@export var spawnCooldown: float = 1.5
@export var asteroidWorth: int = 1
var anteCountDown: int = 0
@export var restartCounter = 0
# RESTART VARIABLES
var RanteCountdown = anteCountDown
var Rhealth: float = health
var Rmoney: int = money
var Rgravity: float = gravity
var Rante: int = ante
var RbasicUnlocked: bool = basicUnlocked
var RbounceUnlocked: bool = bounceUnlocked
var RphaseUnlocked: bool = phaseUnlocked
var RprofitUnlocked: bool = profitUnlocked
var RbasicEnergyMax: int = basicEnergyMax
var RbounceEnergyMax: int = bounceEnergyMax
var RphaseEnergyMax: int = phaseEnergyMax
var RprofitEnergyMax: int = profitEnergyMax
var ReventList:Array = eventList
var RbuffList:Array = buffList
var RspawnCooldown: float = spawnCooldown
var RasteroidWorth: int = asteroidWorth


func restart():
	anteCountDown = RanteCountdown
	health = Rhealth
	money = 0
	gravity = Rgravity
	ante = Rante
	basicUnlocked = RbasicUnlocked
	bounceUnlocked = RbounceUnlocked
	phaseUnlocked = RphaseUnlocked
	profitUnlocked = RprofitUnlocked
	basicEnergyMax = RbasicEnergyMax
	bounceEnergyMax = RbounceEnergyMax
	phaseEnergyMax = RphaseEnergyMax
	profitEnergyMax = RprofitEnergyMax
	basicEnergy = RbasicEnergyMax
	bounceEnergy = RbounceEnergyMax
	phaseEnergy = phaseEnergyMax
	profitEnergy = profitEnergyMax
	distrabution = [1,1,1,1,1,1,1]
	eventList = []
	buffList = []
	spawnCooldown = 1.5
	asteroidWorth = RasteroidWorth
	restartCounter += 1
