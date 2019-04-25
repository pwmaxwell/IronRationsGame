extends "res://engine/entity.gd"

func _init():
	TYPE = "PLAYER"
	SLOWSPEED = 40
	SPEED = 70
	SPEEDCONTAINER = 70
	#POSITION = position.x + position.y
	
	

var state = "default"


func _physics_process(delta):
	match state:
		"default":
			state_default()
		"swing":
			state_swing()
		"shoot":
			state_shoot()

func state_default():
	controls_loop()
	movement_loop()
	spritedir_loop()
	damage_loop()
	print(health)
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	
	if Input.is_action_just_pressed("a"):
		use_item(preload("res://items/sword.tscn"))
	if Input.is_action_just_pressed("b"):
		use_item(preload("res://items/arrow.tscn"))
	if Input.is_action_just_pressed("spell_one"):
		lavaaoe()
		#use_item(preload("res://spells/lavaaoe.tscn"))
	if Input.is_action_just_pressed("spell_two"):
		iceaoe()



func state_swing():
	anim_switch("idle")
	movement_loop()
	damage_loop()
	movedir = Vector2(0,0)

func state_shoot():
	anim_switch("idle")
	movement_loop()
	damage_loop()
	movedir = Vector2(0,0)
	

func controls_loop():
	var LEFT	= Input.is_action_pressed("ui_left") 
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP	=Input.is_action_pressed("ui_up")
	var DOWN	=Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	


