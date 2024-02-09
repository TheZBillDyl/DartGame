extends Button
@export var element: Control
@export var toggleValue: bool
@export var parent: Control
@export var parentToggleValue: bool

func _ready():
	mouse_entered.connect(Hovered)
func Hovered():
	UiSoundManager.Hovered.emit()
func _pressed():
	UiSoundManager.Pressed.emit()
	element.visible = toggleValue
	if parent:
		parent.visible = parentToggleValue
