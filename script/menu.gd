extends Control

@export var world : GameManager

var Buttons : VBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	Buttons = $Buttons

func _on_main_start_game(is_game_started):
	if is_game_started:
		hide()
	else:
		show()

func _on_main_open_options(is_options_open):
	if is_options_open:
		Buttons.hide()
	else:
		Buttons.show()

func _on_jouer_pressed():
	world.inGame = true

func _on_options_pressed():
	world.optionsOpen = true

func _on_quit_pressed():
	get_tree().quit()
