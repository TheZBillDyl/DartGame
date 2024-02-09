extends Node

signal Hovered
signal Pressed
@export var hoveredSound: AudioStream
@export var pressedSound: AudioStream
@export var uiSoundPlayer: AudioStreamPlayer
func _ready():
	Hovered.connect(HoveredElement)
	Pressed.connect(PressedElement)
func HoveredElement() -> void:
	SetClipAndPlay(hoveredSound)
func PressedElement() -> void:
	SetClipAndPlay(pressedSound)
func SetClipAndPlay(clip: AudioStream)-> void:
	uiSoundPlayer.stream = clip
	uiSoundPlayer.play()
