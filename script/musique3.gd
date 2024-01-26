extends Button

var touch = InputEventMouseMotion.new()
var classEventKey = InputEventKey.new()
var buttonPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.get_class() == classEventKey.get_class() and buttonPressed:
		touch = event

func _on_pressed():
	buttonPressed=true
	if touch.get_class() == classEventKey.get_class():
		InputMap.action_erase_events("musique3")
		InputMap.action_add_event("musique3", touch)

func save():
	var save_dict = {
		"musique3" : InputMap.action_get_events("musique3")[0]
	}
	return save_dict
