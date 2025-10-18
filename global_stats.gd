extends Node

@export var health: float = 100.0
@export var money: int = 0
@export var gravity: float = 1.0

enum penType {basic, damage, money}

@export var basicEnergy: int = 2000
@export var bounceEnergy: int =2000
@export var phaseEnergy: int = 1000
@export var profitEnergy: int = 1000
