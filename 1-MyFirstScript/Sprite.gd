extends Sprite

signal health_depleted

var health = 20

var speed = 400
var angular_speed = PI

func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timerout")
	
func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_Button_pressed():
	set_process(not is_processing())
	take_damage(10)

func _on_Timer_timerout():
	visible = not visible

func take_damage(amount):
	health -= amount
	if health <= 0:
		emit_signal("health_depleted")
