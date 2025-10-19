extends Node

@export var health: float = 100.0
@export var money: int = 0
@export var gravity: float = 1.0

enum penType {basic, elastic, phase, profit, NONE}
var currentPen = penType.basic

@export var ante: int = 300

@export var basicUnlocked: bool = true
@export var bounceUnlocked: bool = false
@export var phaseUnlocked: bool = false
@export var profitUnlocked: bool = false

@export var basicEnergyMax: int = 20000
@export var bounceEnergyMax: int = 20000
@export var phaseEnergyMax: int = 10000
@export var profitEnergyMax: int = 10000

@export var basicEnergy: int = basicEnergyMax
@export var bounceEnergy: int = bounceEnergyMax
@export var phaseEnergy: int = phaseEnergyMax
@export var profitEnergy: int = profitEnergyMax

@onready var distrabution:Array = [1,1,1,1,1,1,1]

@export var eventList:Array = []

@export var buffList:Array = []

@export var spawnCooldown: float = 1.0
@export var asteroidWorth: int = 1

# RESTART VARIABLES

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
var Rdistrabution:Array = distrabution
var ReventList:Array = eventList
var RbuffList:Array = buffList
var RspawnCooldown: float = spawnCooldown
var RasteroidWorth: int = asteroidWorth


func restart():
	health = Rhealth
	money = Rmoney
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
	distrabution = Rdistrabution
	eventList = ReventList
	buffList = RbuffList
	spawnCooldown = RspawnCooldown
	asteroidWorth = RasteroidWorth
