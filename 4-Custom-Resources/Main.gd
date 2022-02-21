extends Node

export (Resource) var player_health

func _ready():
	if player_health:
		player_health.connect("health_changed", self, "health_changed")
	$Player.health.reset()
	$HealthLabel.text = str(player_health.get_health())


func health_changed(value):
	$HealthLabel.text = str(value)
	
