extends MarginContainer

#onready var number_label = $Bars/LifeBar/Count/Background/Number
onready var bar = $Bars/LifeBar/HealthBar

#func _ready():
	#var player_max_health = $"..player/player".health
	#bar.max_value = player_max_health
	
	

func _on_player_onPlayerHit(playerHP):
	update_health(playerHP)


func update_health(new_value):
    bar.value = new_value
	