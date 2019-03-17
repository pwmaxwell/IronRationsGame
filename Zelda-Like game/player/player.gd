extends "res://engine/entity.gd"

const TYPE = "PLAYER"
const SPEED = 70


func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	damage_loop()
	print(health)
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	

func controls_loop():
	var LEFT	= Input.is_action_pressed("ui_left") 
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP	=Input.is_action_pressed("ui_up")
	var DOWN	=Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	

