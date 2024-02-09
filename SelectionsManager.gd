extends TextureRect

class_name SelectionsManager
# Called when the node enters the scene tree for the first time.
var selectedPieces = []
signal AddSelection(piece: BoardPiece)
signal UndoSelection(piece: BoardPiece)
signal ClearSelection

func SelectionMade(piece: BoardPiece):
	AddSelection.emit(piece)
	selectedPieces.push_back(piece)

func Undo():
	if !selectedPieces.is_empty():
		UndoSelection.emit(selectedPieces.pop_back())

func ClearPieces():
	selectedPieces.clear()
	ClearSelection.emit()
