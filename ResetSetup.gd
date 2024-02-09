extends Button

@export var addPlayerFunctionality: AddPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(RemovePlayer)

func RemovePlayer():
	addPlayerFunctionality.Remove()
