extends HBoxContainer

@export var dartBoard: SelectionsManager
# Called when the node enters the scene tree for the first time.
func _ready():
	dartBoard.AddSelection.connect(AddSelection)
	dartBoard.ClearSelection.connect(ClearSelection)
	dartBoard.UndoSelection.connect(Undo)
	
func AddSelection(piece: BoardPiece):
	var label = Label.new()
	var text = GetSelectionText(piece)
	label.text = text
	label.add_theme_font_size_override("font_size", 35)
	add_child(label)
	
func GetSelectionText(piece: BoardPiece):
	var prefix: String
	match piece.multiplier:
		1: prefix = "Single "
		2: prefix = "Double "
		3: prefix = "Triple "
	prefix += str(piece.value)
	return prefix
	
func ClearSelection():
	for child in get_children():
		child.queue_free()
	
func Undo(piece: BoardPiece):
	var child = get_children().pop_back()
	if child:
		child.queue_free()
