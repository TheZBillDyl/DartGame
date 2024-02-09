extends Button

@export var profileOptionButton: OptionButton
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(DeleteProfile)
func DeleteProfile():
	ProfileSystem.DeleteProfile(profileOptionButton.selected)
