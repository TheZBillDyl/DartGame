extends Resource
class_name Profile
@export var playerName: String
@export var gamesPlayed: int
@export var dartsThrown: int
@export var wins:int
@export var losses: int

func Create(name:String):
	playerName = name
