extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	var gameModes = GameManager.gameModes
	for mode in gameModes:
		var x = mode.instantiate()
		add_item(x.modeName)
	GameManager.selectedIdx = 0
	#Add in way to select Game Mode
