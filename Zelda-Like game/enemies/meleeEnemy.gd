extends "res://engine/entity.gd"

const SPEED = 600
const DAMAGE = 10

var velocity = Vector2(0,0)
var timer = 0
var current_dir
onready var player = get_node("../player")
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
	damage_loop()
	
	velocity = move_and_slide(velocity * delta)