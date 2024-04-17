extends Control

var classEventKey = InputEventKey.new()
var buttonPressed : int = -1
var input_tab: Array = ["ui_up","ui_down","ui_left","ui_right","ui_accept","ui_home","musique1","musique2","musique3","musique4"]

var up_button : Label
var down_button : Label
var left_button : Label
var right_button : Label
var interact_button : Label
var break_button : Label
var button_1 : Label
var button_2 : Label
var button_3 : Label
var button_4 : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	up_button = $Panel/VBoxContainer/HBoxContainer/VBoxContainer2/Up/Label
	down_button = $Panel/VBoxContainer/HBoxContainer/VBoxContainer2/Down/Label
	left_button = $Panel/VBoxContainer/HBoxContainer/VBoxContainer2/Left/Label
	right_button = $Panel/VBoxContainer/HBoxContainer/VBoxContainer2/Right/Label
	interact_button = $Panel/VBoxContainer/HBoxContainer/VBoxContainer2/Interact/Label
	break_button = $Panel/VBoxContainer/HBoxContainer/VBoxContainer/Break/Label
	button_1 = $Panel/VBoxContainer/HBoxContainer/VBoxContainer/Button1/Label
	button_2 = $Panel/VBoxContainer/HBoxContainer/VBoxContainer/Button2/Label
	button_3 = $Panel/VBoxContainer/HBoxContainer/VBoxContainer/Button3/Label
	button_4 = $Panel/VBoxContainer/HBoxContainer/VBoxContainer/Button4/Label

func _input(event):
	if event.get_class() == classEventKey.get_class() and buttonPressed >= 0:
		InputMap.action_erase_events(input_tab[buttonPressed])
		InputMap.action_add_event(input_tab[buttonPressed], event)
	buttonPressed = -1

func _on_config_touch_pressed():
	show()

func _on_cancel_pressed():
	hide()

func _on_up_pressed():
	buttonPressed = 0

func _on_down_pressed():
	buttonPressed = 1

func _on_left_pressed():
	buttonPressed = 2

func _on_right_pressed():
	buttonPressed = 3

func _on_interact_pressed():
	buttonPressed = 4

func _on_break_pressed():
	buttonPressed = 5

func _on_button_1_pressed():
	buttonPressed = 6

func _on_button_2_pressed():
	buttonPressed = 7

func _on_button_3_pressed():
	buttonPressed = 8

func _on_button_4_pressed():
	buttonPressed = 9

func _process(delta):
	up_button.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[0])[0].keycode))
	down_button.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[1])[0].keycode))
	left_button.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[2])[0].keycode))
	right_button.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[3])[0].keycode))
	interact_button.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[4])[0].keycode))
	break_button.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[5])[0].keycode))
	button_1.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[6])[0].keycode))
	button_2.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[7])[0].keycode))
	button_3.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[8])[0].keycode))
	button_4.text = str(OS.get_keycode_string(InputMap.action_get_events(input_tab[9])[0].keycode))
