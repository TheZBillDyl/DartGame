extends Button
class_name AddPlayer
@export var currentPlayerListObject: VBoxContainer
@export var currentPlayer: OptionButton
# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(Add)
func Add():
	if currentPlayer.selected == -1:
		return
	var player = currentPlayer.get_item_text(currentPlayer.selected)
	var label = Label.new()
	label.text = player
	label.add_theme_font_size_override("font_size", 35)
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	for child in currentPlayerListObject.get_children():
		if child.text == label.text:
			print("Player is already in the list.")
			return
	currentPlayerListObject.add_child(label)
	GameManager.selectedPlayers.push_back(ProfileSystem.GetProfile(player))
	
func Remove():
	var node = currentPlayerListObject.get_children().pop_back()
	if !node:
		return
	node.queue_free()
	GameManager.selectedPlayers.pop_back()
