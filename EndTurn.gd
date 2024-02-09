extends Button

@export var gameMode: GameMode
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(EndTurn)

func EndTurn():
	gameMode.EndTurn()
