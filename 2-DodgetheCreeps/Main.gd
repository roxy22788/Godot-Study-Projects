extends Node

export(PackedScene) var mob_scene
var score

func _ready():
	randomize()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	$HUD.update_score(0)
	$HUD.show_message("Get ready")
	
	get_tree().call_group("mobs", "queue_free")
	
	$Music.play()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
	$HUD.show_game_over()
	
	$SoundDeath.play()
	$Music.stop()
	
func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	var mob_spawn_location = get_node("CaminhoTurba/LocalGeracaoTurba")
	mob_spawn_location.offset = randi()
	
	var mob = mob_scene.instance()
	add_child(mob)
	
	var direction = mob_spawn_location.rotation + PI / 2
	
	mob.position = mob_spawn_location.position
	
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction 
	
	var velocity = Vector2(rand_range(150.0, 250.0), 0)
	mob.linear_velocity = velocity.rotated(direction)





