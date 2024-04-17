extends Control

@export var world : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_main_open_options(is_options_open):
	if is_options_open:
		show()
	else:
		hide()

func _on_exit_pressed():
	world.optionsOpen = false
