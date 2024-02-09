extends Button

@export var selectionsManager: SelectionsManager
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(Undo)


func Undo():
	selectionsManager.Undo()
