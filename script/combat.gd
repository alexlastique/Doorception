extends Node2D

@export var world : GameManager
@onready var player : CharacterBody2D
@onready var musiqueGame = get_node("/root/main/CanvasLayer/Combat/Control/MusiqueCombat")
@onready var PV = get_node("/root/main/ath/ProgressBar")
var nbgagner = 0
var nbperdu = 0
var mob
var piece
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$player.play("default")
	var volume = get_node("/root/main/CanvasLayer/options_menu/Sound/Panel/VBoxContainer/VBoxContainer2/sound")
	musiqueGame.set_volume_db(volume.value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if nbgagner+nbperdu==12:
		world.inFight = false
		if nbgagner>nbperdu:
			piece = int(get_node("/root/main/ath/piece/Control/Label").text)+mob.mobLoot["loot"]
		else:
			piece = int(get_node("/root/main/ath/piece/Control/Label").text)
			PV.value -= mob.mobLoot["attack"] 
		get_node("/root/main/ath/piece/Control/Label").text = str(piece)
		get_node("/root/main/"+world.current_world.name+"/player/musique_ambience").stream_paused = false
		musiqueGame.playing = false
		get_node("/root/main/"+world.current_world.name+"/" + mob.name).queue_free()
		musiqueGame.playing = false
		nbgagner = 0
		nbperdu = 0

func _on_main_start_fight(is_in_fight):
	player = get_node("/root/main/"+world.current_world.name+"/player")
	if is_in_fight:
		show()
		$mob.play(mob.name)
	else:
		hide()
