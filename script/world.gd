extends Node

class_name GameManager

signal toggleGamePaused(is_paused : bool)
var gamePaused : bool = false:
	get:
		return gamePaused
	set(value):
		gamePaused = value
		get_tree().paused = gamePaused
		emit_signal("toggleGamePaused", gamePaused)

signal openOptions(is_options_open : bool)
var optionsOpen : bool = false:
	get:
		return optionsOpen
	set(value):
		optionsOpen = value
		emit_signal("openOptions", optionsOpen)

signal startGame(is_game_started : bool)
var inGame : bool = false:
	get:
		return inGame
	set(value):
		inGame = value
		emit_signal("startGame", inGame)

signal startFight(is_in_fight : bool)
var inFight : bool = false:
	get:
		return inFight
	set(value):
		inFight = value
		emit_signal("startFight", inFight)
		
var scene
func _ready():
	scene = preload("res://scene/village.tscn")

var current_world;
func _on_start_game(is_game_started):
	if is_game_started:
		current_world = scene.instantiate()
		add_child(current_world)
	else:
		inFight = false
		current_world.queue_free()

func _change_map(destination_world : String):
	current_world.queue_free()
	var scene_futur
	if destination_world=="village":
		scene_futur = preload("res://scene/village.tscn")
	if destination_world=="dongeon":
		scene_futur = preload("res://scene/dongeon.tscn")
	current_world = scene_futur.instantiate()
	add_child(current_world)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("ath/ProgressBar").value == 0:
		print("You Lose")
		get_tree().quit()
	if int(get_node("ath/piece/Control/Label").text) >= 10:
		print("You Win")
		get_tree().quit()

func _input(event : InputEvent):
	if event.is_action_pressed("ui_home") and !optionsOpen and inGame:
		gamePaused = !gamePaused
