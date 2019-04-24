extends Node2D

var TYPE = null
var DAMAGE = 15
var HEALTH = 1
var ArrowMoveDir = Vector2(1,0)
var maxamount = 1


func _ready():
	TYPE = get_parent().TYPE
	$anim.connect("animation_finished", self, "destroy")
	$anim.play(str("shoot",get_parent().spritedir))
	if get_parent().has_method("state_shoot"):
		get_parent().state = "shoot"
	get_parent().state = "default"
	
	#queue_free()

func destroy(animation):
	print("DELETEARROW")
	if get_parent().has_method("state_shoot"):
		get_parent().state = "default"
	queue_free()