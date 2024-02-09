extends OptionButton
class_name ProfileSelectorMenu

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	ProfileSystem.ProfilesListModified.connect(UpdateMenu)
	UpdateMenu(ProfileSystem.profiles)
func UpdateMenu(profiles: Array):
	clear()
	for profile in profiles:
		add_item(profile.playerName)
