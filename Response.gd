extends Label
class_name Response

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateResponse("")
func UpdateResponse(textToUpdateWith: String):
	text = textToUpdateWith
