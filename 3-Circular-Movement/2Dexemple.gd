extends Node2D

var rotation_speed = PI

func _process(delta):
	$Sprite/Pivot.rotation += rotation_speed * delta
