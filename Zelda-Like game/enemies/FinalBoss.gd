extends "res://engine/entity.gd"
func _init():
	TYPE = "ENEMY"
	SPEED = 900
	SLOWSPEED = 200
	SPEEDCONTAINER = 400
	DAMAGE = 10
	


var left = Vector2(-1,0)



var MaxDistance = 10
var velocity = Vector2(0,0)
var timer = 0
var current_dir
onready var player = get_node("../player")
onready var enemy = get_node("../meleeEnemy")
#var currentLocation = $enemyy.position
#var distanceToPlayer = $enemyy.get_global_pos().to_global.distance_to(player.get_global_pos())
#var distanceToPlayer = enemy.distance_to(player)
var movetimer = 0
var movetimer_length = 15
var enemyX# = position.x
var enemyY #= position.y
#var playerX = player.position.x
#var playerY = player.position.y
var enemyXY
var playerX
var playerY
var playerXY
var playerEnemy
var enemyPlayer
var isAgro = false


func _process(delta):
	enemyX = position.x
	enemyY = position.y
	enemyXY = enemyX + enemyY
	playerX = player.position.x
	playerY = player.position.y
	playerXY = playerX + playerY
	playerEnemy = playerXY - enemyXY
	enemyPlayer = enemyXY - playerXY
	
	if playerEnemy >= -1 and playerEnemy <= 1:
		isAgro = true
	if isAgro == true:
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