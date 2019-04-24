extends "res://engine/entity.gd"

#This was bugged for some reason. Whenever I hit the skeleton it would knockback and the game would crash
#If we can figure out what was bugged we can add them into the level

func _init():
	SPEED = 40
	TYPE = "ENEMY"
	DAMAGE = 1
	print(TYPE)

var movetimer_length = 15
var movetimer = 0

func _ready():
	$anim.play("default")
	movedir = dir.rand()
	
func _physics_process(delta):
	movement_loop()
	damage_loop()
	if movetimer > 0:
		movetimer -=1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length