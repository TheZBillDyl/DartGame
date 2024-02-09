extends Node

@export var gameModes: Array[PackedScene]
var selectedIdx: int
var selectedPlayers: Array[Profile]

func StartGame():
	if selectedPlayers.size() > 0:
		SceneManager.LoadPackedScene(gameModes[selectedIdx])
func EndGame():
	#reset all values
	selectedIdx = 0
	selectedPlayers.clear()
