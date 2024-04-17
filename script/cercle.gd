extends RigidBody2D

@onready var combat = get_node("/root/main/CanvasLayer/Combat")
var defence = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity.y = 600
	if position.y>568:
		defence= true
	if position.y>725:
		combat.nbperdu +=1
		free()

func _input(event):
	if event is InputEventKey:
		if 444<position.y and position.y<568:
			if event.is_action("musique1") and is_in_group("bleu"):
				combat.nbgagner +=1
				free()
			if event.is_action("musique2") and is_in_group("vert"):
				combat.nbgagner +=1
				free()
			if event.is_action("musique3") and is_in_group("rouge"):
				combat.nbgagner +=1
				free()
			if event.is_action("musique4") and is_in_group("jaune"):
				combat.nbgagner +=1
				free()
		else:
			defence = true
