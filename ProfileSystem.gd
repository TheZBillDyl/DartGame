extends Node

var profiles = []
var pathToSaveFolder = "user://"
var extension = ".tres"
signal ProfilesListModified(profiles: Array)
func _ready():
	LoadProfiles()
	ProfilesListModified.emit(profiles)
func CreateProfile(profile: Profile):
	for x in profiles:
		if x.playerName == profile.playerName:
			return ERR_ALREADY_EXISTS
	profiles.push_front(profile)
	ProfilesListModified.emit(profiles)
	SaveProfiles()
	print("Created Profile for " + profile.playerName)
func DeleteProfile(idx: int):
	if idx < 0:
		return
	var profile: Profile = profiles[idx]
	DirAccess.remove_absolute(pathToSaveFolder + profile.playerName + extension)
	profiles.remove_at(idx)
	ProfilesListModified.emit(profiles)
func SaveProfiles():
	for profile in profiles:
		var result = ResourceSaver.save(profile, pathToSaveFolder + profile.playerName + extension)
		assert(result == OK)
func LoadProfiles():
	var loadedProfiles = DirAccess.get_files_at(pathToSaveFolder)
	for prof in loadedProfiles:
		print(prof)
		var profile: Profile = ResourceLoader.load(pathToSaveFolder + prof, "Profile")
		profiles.push_front(profile)
func GetProfile(nameOfPlayer:String) -> Profile:
	for profile in profiles:
		if profile.playerName == nameOfPlayer:
			return profile
	print("Couldn't find profile " + nameOfPlayer)
	return null
#Windows: %APPDATA%\Godot\app_userdata\[project_name]
#macOS: ~/Library/Application Support/Godot/app_userdata/[project_name]
#Linux: ~/.local/share/godot/app_userdata/[project_name]
