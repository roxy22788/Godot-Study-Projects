extends Sprite

var speed = 100

func _ready():
	randomize()
	$Path2D/PathFollow2D.offset += 300
	position = $Path2D/PathFollow2D.position
	rotation = $Path2D/PathFollow2D.rotation + PI / 2
	rotation += rand_range(-PI / 4, PI / 4)




