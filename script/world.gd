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
	if destination_world=="dungeon":
		scene_futur = preload("res://scene/donjon.tscn")
	current_world = scene_futur.instantiate()
	add_child(current_world)


var value
var result
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("ath/ProgressBar").value == 90:
		value = "gameOver"
	if int(get_node("ath/piece/Control/Label").text) >= 1:
		value = "win"
	if !result:
		if value == "win":
			get_node("CanvasLayer/win").show()
			get_node("CanvasLayer/win").play()
			result = true
		elif value == "gameOver":
			get_node("CanvasLayer/gameOver").show()
			get_node("CanvasLayer/gameOver").play()
			result = true
		

func _input(event : InputEvent):
	if event.is_action_pressed("ui_home") and !optionsOpen and inGame:
		gamePaused = !gamePaused


func _on_win_finished():
	if result:
		get_tree().quit()


func _on_game_over_finished():
	if result:
		current_world.queue_free()
		result = false
		value = ""
		get_node("ath/ProgressBar").value = 100
		get_node("ath/piece/Control/Label").text = "0"
		get_node("CanvasLayer/gameOver").hide()
		get_node("CanvasLayer/Menu").show()
