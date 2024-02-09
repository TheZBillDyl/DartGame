extends Node
signal ChangedScenes(sceneName: String)
var scenes: Dictionary = {
	"X01": preload("res://GameModes/X01.tscn"),
	"Main Menu" : preload("res://MenuScreen.tscn")
}
func LoadScene(sceneName: String):
	if sceneName == "Quit":
		get_tree().quit()
	else:
		ChangedScenes.emit(sceneName)
		var scene = scenes.get(sceneName)
		if scene:
			get_tree().call_deferred("change_scene_to_packed",scene)
		else:
			print("Error: Couldn't find scene " + sceneName)
func LoadPackedScene(scene: PackedScene):
	LoadScene(scene.instantiate().name)
