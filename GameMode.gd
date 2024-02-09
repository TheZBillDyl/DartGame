extends Node
class_name GameMode

@export var modeName: String
@export var description: String
var players: Array
var currentPlayerTurn: String
var currentPlayerIdx:int
@export var responseBox: Response
@export var selectionManager :SelectionsManager
@export var menuButton: Button
signal NextPlayer(player: Profile)
func EndTurn():
	pass
func StartGame(playersInGame: Array):
	players = playersInGame
	print("Starting Game...")
	pass
