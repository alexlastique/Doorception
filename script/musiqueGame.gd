extends Control

@export var world : GameManager
var j = 0
var presse = false
var musiqueOn = false

func _process(delta):
	j += delta
	if j >=0.74 and presse and !musiqueOn:
		$MusiqueCombat.playing = true
		musiqueOn = true
	elif !presse:
		j = 0

func _on_button_pressed():
	if !presse:
		j = 0
		presse = true
		for i in range(6):
			var bleu = RigidBody2D.new()
			bleu.set_script(load("res://script/cercle.gd"))
			bleu.mass = 1.0
			bleu.position.x = 0
			if i ==0:
				bleu.position.y = 0
				bleu.add_to_group("bleu")
			elif i==1:
				bleu.position.y = -175
				bleu.add_to_group("bleu")
			elif i==2:
				bleu.position.y = -350
				bleu.add_to_group("bleu")
			elif i==3:
				bleu.position.y = -2259
				bleu.add_to_group("bleu")
			elif i==4:
				bleu.position.y = -2434
				bleu.add_to_group("bleu")
			elif i==5:
				bleu.position.y = -2609
				bleu.add_to_group("bleu")
			add_child(bleu)
			var spritebleu = Sprite2D.new()
			var texturebleu = load("res://asset/image/bleu.png")
			spritebleu.texture = texturebleu
			bleu.add_child(spritebleu)
		
		for i in range(4):
			var vert = RigidBody2D.new()
			vert.set_script(load("res://script/cercle.gd"))
			vert.mass = 1.0
			vert.position.x = 100
			if i==0:
				vert.position.y = -696
				vert.add_to_group("vert")
			elif i==1:
				vert.position.y = -781.5
				vert.add_to_group("vert")
			elif i==2:
				vert.position.y = -2955
				vert.add_to_group("vert")
			elif i==3:
				vert.position.y = -3040.5
				vert.add_to_group("vert")
			add_child(vert)
			var spritevert = Sprite2D.new()
			var texturevert = load("res://asset/image/vert.png")
			spritevert.texture = texturevert
			vert.add_child(spritevert)
		
		
		var rouge = RigidBody2D.new()
		rouge.set_script(load("res://script/cercle.gd"))
		rouge.mass = 1.0
		rouge.position.x = 200
		rouge.position.y = -3215.5
		rouge.add_to_group("rouge")
		add_child(rouge)
		var spriterouge = Sprite2D.new()
		var texturerouge = load("res://asset/image/rouge.png")
		spriterouge.texture = texturerouge
		rouge.add_child(spriterouge)
		
		
		var jaune = RigidBody2D.new()
		jaune.set_script(load("res://script/cercle.gd"))
		jaune.mass = 1.0
		jaune.position.x = 300
		jaune.position.y = -3390.5
		jaune.add_to_group("rouge")
		add_child(jaune)
		var spritejaune = Sprite2D.new()
		var texturejaune = load("res://asset/image/jaune.png")
		spritejaune.texture = texturejaune
		jaune.add_child(spritejaune)
