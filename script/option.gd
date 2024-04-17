extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var musique_ambience = get_node("/root/Main/Control_musique/musique_ambience")




func _on_retour_pressed():
	show()


func _on_option_pressed():
	hide()
