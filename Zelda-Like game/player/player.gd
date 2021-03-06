extends "res://engine/entity.gd"



func _init():
	TYPE = "PLAYER"
	SLOWSPEED = 50
	SPEED = 100
	SPEEDCONTAINER = 100
	#POSITION = position.x + position.y
	health = 100
	

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
	if health == 0:
		get_tree().change_scene("res://areas/test.tscn") #This will just reset the game
		#queue_free()
	#print(health)
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
		#var value = get_node("../HealthBar").get_value()
		#get_node("../HealthBar").set_value(value - 10)



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
	





