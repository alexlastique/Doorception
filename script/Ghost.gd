extends CharacterBody2D

@onready var player : CharacterBody2D = $'../player'

var speed : int = 300
var mobLoot = {"PV":10,"loot":1,"attack":10}
var spawn_pos

@onready var navigation_agent : NavigationAgent2D = $Navigation/NavigationAgent2D
func _ready():
	$AnimatedSprite2D.play()
	spawn_pos = self.position

func _physics_process(delta):
	var direcion = Vector2.ZERO
	if (sqrt(pow(player.position.x - position.x, 2) + pow(player.position.y - position.y, 2))<700):
		direcion = (navigation_agent.get_next_path_position() - global_position)
	else :
		direcion = (spawn_pos - global_position)
	velocity = direcion.normalized() * speed
	
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0

func _on_timer_timeout():
	navigation_agent.target_position = player.global_position
