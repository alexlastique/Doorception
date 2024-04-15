extends CharacterBody2D

@onready var main = get_node("/root/main")
@onready var combat = get_node("/root/main/CanvasLayer/Combat")
@onready var navigation_agent : NavigationAgent2D = $NavigationAgent2D
var moovspeed = 500
var vel

func _ready():
	$AnimatedSprite2D.play()
	
func _physics_process(delta):
	if (!main.inFight):
		vel = Vector2()
		velocity = vel

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.# Si le bouton droit de la souris est pressé, réinitialiser la position souhaitée
		if Input.is_mouse_button_pressed(1):
			navigation_agent.target_position = get_local_mouse_position() + global_position

		# Si la distance entre la position actuelle et la position souhaitée est supérieure à 50, déplacer
		if Input.is_action_pressed("ui_up"):
			vel.y -= 1
		if Input.is_action_pressed("ui_down"):
			vel.y += 1
		if Input.is_action_pressed("ui_left"):
			vel.x -= 1
		if Input.is_action_pressed("ui_right"):
			vel.x += 1
		if vel:
			navigation_agent.target_position = global_position
			velocity = vel.normalized() * moovspeed
		elif global_position.distance_to(navigation_agent.target_position) > 10.0:
			var direcion = Vector2.ZERO
			direcion = (navigation_agent.get_next_path_position() - global_position).normalized()
			velocity = direcion * moovspeed

		move_and_slide()
		
		if velocity.length() > 0:
			$AnimatedSprite2D.animation = "run"
			$AnimatedSprite2D.flip_h = velocity.x > 0
		else:
			$AnimatedSprite2D.animation = "default"

func _on_area_2d_body_entered(body):
	if body.is_in_group("mob"):
		combat.mob = body
		$musique_ambience.stream_paused = true
		main.inFight = true;


func _on_area_2d_body_entered_hide(body):
	if body.name=="player":
		hide()

func _on_area_2d_body_entered_show(body):
	if body.name=="player":
		show()
