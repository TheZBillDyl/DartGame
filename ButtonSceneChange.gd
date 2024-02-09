extends Button

@export var sceneToGoTo: String
@export var useSceneStringOnClick: bool
func _ready():
	button_up.connect(ButtonClicked)
	mouse_entered.connect(Focused)
	
func ButtonClicked():
	UiSoundManager.Pressed.emit()
	if useSceneStringOnClick:
		if sceneToGoTo == "Main Menu":
			GameManager.EndGame()
		SceneManager.LoadScene(sceneToGoTo)
		return
	GameManager.StartGame()
func Focused():
	UiSoundManager.Hovered.emit()
