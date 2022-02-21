extends Node2D

export (Resource) var player_health

func _input(event):
	if event.is_action_pressed("ui_left"):
		player_health.take_damage(2)
