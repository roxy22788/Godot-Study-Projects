extends Resource
class_name PlayerHealth

signal health_changed

export (int) var max_value

var current_value = 0

func get_health():
	return current_value
	
func reset():
	current_value = max_value
	
func take_damage(amount):
	current_value = max(0, current_value - amount)
	print("take damage: ", amount, " heal atual: ", current_value)
	emit_signal("health_changed", current_value)
	
func heal(amount):
	current_value = min(max_value, current_value + amount)
	emit_signal("health_changed", amount)
