extends Control

@export var world : GameManager

func _on_jouer_pressed():
	world.inGame = true

func _on_options_pressed():
	world.optionsOpen = true

func _on_quit_pressed():
	get_tree().quit()
