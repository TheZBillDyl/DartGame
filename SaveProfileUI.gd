extends Button

@export var inputField: TextEdit
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(submitted)
func submitted():
	var profile: Profile = Profile.new()
	profile.Create(inputField.text)
	var result = ProfileSystem.CreateProfile(profile)
	if result == ERR_ALREADY_EXISTS:
		print(profile.playerName + " already exists. Please change the name.")
		return
	inputField.clear()
