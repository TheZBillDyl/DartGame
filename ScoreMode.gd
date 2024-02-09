extends GameMode

var startingNumber: int = 201
var scoresList: Dictionary
var currentPlayerTempScore: int
func _ready():
	StartGame(GameManager.selectedPlayers)
	selectionManager.AddSelection.connect(UpdateResponseCalculatedScore)
	selectionManager.UndoSelection.connect(UndoCalculatedScore)
func StartGame(players: Array):
	super.StartGame(players)
	#Ask players for the X01 game type
	for player in players:
		scoresList[player.playerName] = startingNumber
		print("Adding player " + player.playerName)
	print("Starting " + modeName)
	currentPlayerTurn = players.front().playerName
	currentPlayerIdx = 0
	print("Current Score of player " + currentPlayerTurn + " is: " + str(startingNumber))
	currentPlayerTempScore = startingNumber
	NextPlayer.emit(players[currentPlayerIdx])
	UpdateResponse(str(startingNumber))
func UpdateResponse(txt: String):
	responseBox.UpdateResponse(txt)
func UpdateResponseCalculatedScore(piece: BoardPiece):
	currentPlayerTempScore -= piece.value * piece.multiplier
	UpdateResponse(str(currentPlayerTempScore))
func UndoCalculatedScore(piece: BoardPiece):
	var x = BoardPiece.new()
	x.value = -piece.value
	x.multiplier = piece.multiplier
	UpdateResponseCalculatedScore(x)
func EndTurn():
	var pieces: Array = selectionManager.selectedPieces
	var currentScore = scoresList[currentPlayerTurn]
	for piece: BoardPiece in pieces:
		currentScore = currentScore - (piece.value * piece.multiplier)
	if currentScore < 0:
		print("Bust")
		currentScore = scoresList[currentPlayerTurn]
	elif currentScore == 0:
		print("Win!")
		UpdateResponse(currentPlayerTurn + " is the Winner!")
		menuButton.show()
		return
	else:
		print("Current Score: " + str(currentScore))
		scoresList[currentPlayerTurn] = currentScore
	menuButton.hide()
	currentPlayerIdx = (currentPlayerIdx + 1) % players.size()
	currentPlayerTurn = players[currentPlayerIdx].playerName
	selectionManager.ClearPieces()
	NextPlayer.emit(players[currentPlayerIdx])
	currentPlayerTempScore = scoresList[currentPlayerTurn]
	UpdateResponse(str(scoresList[currentPlayerTurn]))
