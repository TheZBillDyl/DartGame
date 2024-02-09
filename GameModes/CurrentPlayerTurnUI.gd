extends Label

var gameMode: GameMode
# Called when the node enters the scene tree for the first time.
func _ready():
	gameMode = $"../../.."
	gameMode.NextPlayer.connect(UpdateUI)
func UpdateUI(player: Profile):
	text = player.playerName
