extends KinematicBody2D

var speed = 200

func _process(delta):
	var current_animation = "idle"
	
	var mouse = get_local_mouse_position()
	var a = stepify(mouse.angle(), PI/4) / (PI/4)
	a = wrapi(int(a), 0, 8)
	
	if Input.is_action_pressed("left_mouse") and mouse.length() > 10:
		current_animation = "walk"
		move_and_slide(mouse.normalized() * speed)
		
	$AnimatedSprite.animation = current_animation + str(a)
		
