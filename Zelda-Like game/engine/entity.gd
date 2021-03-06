extends KinematicBody2D
signal onPlayerHit
var LEVELONE = "res://areas.test.tscn"
var TYPE = "ENEMY"
var SPEED = 0
var SLOWSPEED
var SPEEDCONTAINER
var DAMAGE = 0
var POSITION
var MONEY

var movedir = Vector2(0,0)
var spritedir = "down"

var hitstun = 0
var knockdir = Vector2(0,0)
var health = 100

var aoehitstun = 0

func lavaaoe():
	var aoe = load("res://spells/lavaaoe.tscn").instance()
	aoe.position = get_global_mouse_position()
	get_parent().add_child(aoe)

func iceaoe():
	var iceaoe = load("res://spells/iceaoe.tscn").instance()
	iceaoe.position = get_global_mouse_position()
	get_parent().add_child(iceaoe)

func movement_loop(): 
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * SPEED
	else:
		motion = knockdir.normalized() * 125
	move_and_slide(motion,Vector2(0,0))
	

func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0, 1):
			spritedir = "down"

func anim_switch(animation):
	var newanim = str(animation, spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func damage_loop():
	if aoehitstun > 0:
		aoehitstun -= 1
	if hitstun > 0:
		hitstun -= 1
		# Damaged Texture here
	else:
		# Normal Texture here
		if TYPE == "ENEMY" && health <= 0:
			queue_free()
	for area in $hitbox.get_overlapping_areas():
		var  body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE and body.get ("TYPE") != "SPELL" and body.get("TYPE") != "LADDER":
			health -= body.get("DAMAGE")
			hitstun = 10
			knockdir = global_transform.origin - body.global_transform.origin
			emit_signal("onPlayerHit", health)
		#if hitstun ==0 and body.get("DAMAGE") != null and body.get("TYPE") == "PLAYER":
			#connect("onPlayerHit", self, "change_bar")
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE and aoehitstun == 0:
			health -= body.get("DAMAGE")
			aoehitstun = 60
		if body.get("TYPE") == "ENEMY":
			SPEED = 50
		if body.get("TYPE") == "SLOWSPELL":  
			SPEED = SLOWSPEED
		if body.get("TYPE") != "SLOWSPELL":
			SPEED = SPEEDCONTAINER
		if body.get("TYPE") == "LADDER":
			#print(get_tree().current_scene)
			get_tree().change_scene("res://areas/shop.tscn") 
		if body.get ("TYPE") == "MONEY":
			MONEY += 10
			print(MONEY)


func use_item(item):
	var newitem = item.instance()
	newitem.add_to_group(str(newitem.get_name(), self))
	add_child(newitem)
	if get_tree().get_nodes_in_group(str(newitem.get_name(), self)).size() > newitem.maxamount:
		newitem.queue_free()
	