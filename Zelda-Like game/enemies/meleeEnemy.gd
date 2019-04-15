extends "res://engine/entity.gd"

func _init():
	TYPE = "ENEMY"
	SPEED = 400
	DAMAGE = 10
	


var left = Vector2(-1,0)



var MaxDistance = 10
var velocity = Vector2(0,0)
var timer = 0
var current_dir
onready var player = get_node("../player")
onready var enemy = get_node("../meleeEnemy")
#var currentLocation = $enemyy.position
#var distanceToPlayer = enemy.get_global_pos().to_global.distance_to(player.get_global_pos())
#var distanceToPlayer = enemy.distance_to(player)
var movetimer = 0
var movetimer_length = 15




func _process(delta):
	
	if player.position.x > position.x:
		 velocity.x += SPEED
	if player.position.x < position.x:
		velocity.x -= SPEED
	if player.position.y > position.y:
		 velocity.y += SPEED
	if player.position.y < position.y:
		velocity.y -= SPEED

func _physics_process(delta):
	#if statement that makes it so the box wont move unless the player is in an area around it
	#if EnemyToPlayer.length() < MaxDistance:
	damage_loop()
	movement_loop()
	velocity = move_and_slide(velocity * delta)