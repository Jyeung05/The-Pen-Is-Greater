extends Node

@export var health: float = 100.0
@export var money: int = 0
@export var gravity: float = 1.0

enum penType {basic, damage, money}

@export var basicEnergy: int = 20000
@export var bounceEnergy: int =20000
@export var phaseEnergy: int = 10000
@export var profitEnergy: int = 10000
