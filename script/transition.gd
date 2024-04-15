extends Node2D


@onready var world = get_node("/root/main")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_transition_to_village_body_entered(body):
	if body.name=="player":
		world._change_map("village")


func _on_transition_to_dongeon_body_entered(body):
	if body.name=="player":
		world._change_map("dungeon")
