extends AudioStreamPlayer2D

var volume

func _ready():
	volume = get_node("/root/main/CanvasLayer/options_menu/Sound/Panel/VBoxContainer/VBoxContainer2/sound")
	load_musique()
	volume.value = volume_db


# Called when the node enters the scene tree for the first time.
func _process(delta):
	set_volume_db(volume.value)
	save_musique(volume.value)

func save_musique(volume):
	var save_dict = {
		"musique" : volume
	}
	var save_musique = FileAccess.open("optionMusique.txt", FileAccess.WRITE)
	var json_string = JSON.stringify(save_dict)
	save_musique.store_line(json_string)

func load_musique():
	if not FileAccess.file_exists("optionMusique.txt"):
		return 0

	var save_musique2 = FileAccess.open("optionMusique.txt", FileAccess.READ)
	while save_musique2.get_position() < save_musique2.get_length():
		var json_string = save_musique2.get_line()

		var json = JSON.new()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		var node_data = json.get_data()
		for i in node_data:
			var touche
			touche = node_data[i]
			if i == "musique":
				volume.value = touche


func _on_finished():
	playing=true
