extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$piece.play()

func _on_main_start_game(is_game_started):
	if is_game_started:
		show()
	else:
		hide()
		get_node("piece/Control/Label").text = "0"
