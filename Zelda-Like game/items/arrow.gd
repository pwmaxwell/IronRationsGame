extends Node2D

#The arrows are bugged and will interact with the player's movement

#Fixing the bug, taken from Godot website: Instead, we need the bullets to be independent of the player’s movement - once fired, 
#they should continue traveling in a straight line and the player can no longer affect them. Instead of being added to the scene 
#tree as a child of the player, it makes more sense to add the bullet as a child of the “main” game scene, which may be the player’s 
#parent or even further up the tree.

#https://docs.godotengine.org/en/3.1/getting_started/step_by_step/signals.html


var TYPE = "ARROW"
var DAMAGE = 10
var HEALTH = 1
var ArrowMoveDir = Vector2(1,0)
var maxamount = 1
var SPEED = 175

func _ready():
	TYPE = get_parent().TYPE
	#$anim.connect("animation_finished", self, "destroy")
	$anim.play(str("shoot",get_parent().spritedir))
	#if get_parent().has_method("state_shoot"):
		#get_parent().state = "shoot"
	#get_parent().state = "default"
	$anim.connect("animation_finished", self, "destroy")
	get_node("Area2D").connect("body_enter", self, "TETING")
	#queue_free()


func _process(delta):
	if $anim.current_animation == "shootright":
		var motion = Vector2(cos(self.rotation), sin(self.rotation)) * SPEED
		position += motion * delta
	if $anim.current_animation == "shootdown":
		var motion = Vector2(sin(self.rotation), cos(self.rotation)) * SPEED
		position += motion * delta
	if $anim.current_animation == "shootleft":
		var motion = Vector2(-cos(self.rotation), -sin(self.rotation)) * SPEED
		position += motion * delta
	if $anim.current_animation == "shootup":
		var motion = Vector2(-sin(self.rotation), -cos(self.rotation)) * SPEED
		position += motion * delta
	#if
	#$anim.connect("animation_finished", self, "destroy")

func _on_Area2D_body_enter(body):
	if body.TYPE("ENEMY"):
		print("IN BODY")
		queue_free()

func destroy(animation):
	print("DELETEARROW")
	if get_parent().has_method("state_shoot"):
		get_parent().state = "default"
	queue_free()