extends Node2D

func _ready():
	hide()
	get_tree().paused = true

func _on_main_start_fight(is_in_fight):
	if is_in_fight:
		get_tree().paused = true
		hide()
	else:
		get_tree().paused = false
		show()

func _on_main_current_world(current_world):
	if current_world == 1:
		show()
	else:
		hide()
