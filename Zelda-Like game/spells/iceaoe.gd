extends Node2D

var TYPE = "SLOWSPELL"

var target
var maxamount = 1


func _ready():
	#TYPE = get_parent().TYPE
	target = get_global_mouse_position()
	$anim.connect("animation_finished", self, "destroy")
	$anim.play("iceDuration")
	#$anim.play(str("swing",get_parent().spritedir))
	


func destroy(animation):
	queue_free()

