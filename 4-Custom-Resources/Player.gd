extends Node2D


export (Resource) var health


func _input(event):
	if event.is_action_pressed("ui_right"):
		health.take_damage(1)
