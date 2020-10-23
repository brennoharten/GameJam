extends Control

var coins = 0
var life = 3

func _ready():
	pass
signal Boss()

func _on_Coins_get_a_coin():
	coins += 1
	$coins.text = str(coins)
	if coins == 6:
		emit_signal("Boss")


func _on_Player_game_over():
	$Label.text = "GAME OVER"


func _on_Player_damage():
	life -= 1
	$life.text = str(life)


func _on_Boss_kill_the_boss():
	$Label.text = "YES YOU DID'IT"
