extends Control

@export var world : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_main_toggle_game_paused(is_paused : bool):
	if is_paused:
		show()
	else:
		hide() # Replace with function body.

func _on_main_open_options(is_options_open):
	if is_options_open:
		hide()
	elif world.inGame == true:
		show()

func _on_resume_pressed():
	world.gamePaused = false

func _on_options_pressed():
	world.optionsOpen = true

func _on_quit_pressed():
	world.gamePaused = false
	world.inGame = false
