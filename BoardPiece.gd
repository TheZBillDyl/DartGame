extends TextureButton
class_name BoardPiece
@export var value: int
@export var multiplier: int = 1
@export var hittable:bool = true
@export var selectionManager:SelectionsManager
func _ready():
	pressed.connect(Activate)
func Activate():
	selectionManager.SelectionMade(self)
