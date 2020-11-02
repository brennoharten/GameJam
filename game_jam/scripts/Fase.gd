extends Node2D


# Declare member variables here. Examples:
# var a = 2
var vida = 3
var tempo = 0
var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	tempo += 1
	$Control/CanvasLayer/Tempo.set_text(str(tempo))
	if tempo == 15:
		$Player.gravity *= -1
		tempo = 0

func _on_MorteQueda2_body_entered(body):  
	vida -= 1
	$Control/CanvasLayer/life.set_text(str(vida))
	if vida > 0:
		reset_player()
	else:
		$Control/CanvasLayer/HBoxContainer.show()

func _on_MorteQueda_body_entered(body):
	vida -= 1
	$Control/CanvasLayer/life.set_text(str(vida))
	if vida > 0:
		reset_player()
	else:
		$Control/CanvasLayer/HBoxContainer.show()
	

func reset_player():
	$Player.position.x = 250
	$Player.position.y = 400
	tempo = 0
	$Player.gravity = 30

func reset_game():
	$Player.position.x = 250
	$Player.position.y = 400
	tempo = 0
	$Player.gravity = 30
	vida = 3
	$Control/CanvasLayer/life.set_text(str(vida))


func _on_Control_nova_partida():
	$Control/CanvasLayer/HBoxContainer.hide()
	reset_game()


func _on_Control_sair():
	get_tree().quit()


func _on_Coins__get_a_coin():
	coins += 1
	$Control/CanvasLayer/coins.set_text(str(coins))


func _on_BuracoNegro_body_entered(body):
	get_tree().change_scene("res://scenes/Fase2.tscn")


func _on_Star_get_a_Star():
	coins += 5
	$Control/CanvasLayer/coins.set_text(str(coins))


func _on_Enimies_dano():
	vida -= 1
	$Control/CanvasLayer/life.set_text(str(vida))
	if vida > 0:
		reset_player()
	else:
		$Control/CanvasLayer/HBoxContainer.show()
