extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func passer_a_autre_scene():
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_pressed():
	passer_a_autre_scene()