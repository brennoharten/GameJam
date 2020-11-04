extends Node2D


# Declare member variables here. Examples:
var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$SomJogo.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Luigi_dano():
	$Player.life -= 1
	$Control/CanvasLayer/life.set_text(str($Player.life))
	if $Player.life <= 0:
		$Control/CanvasLayer/HBoxContainer.show()
		$Player.queue_free()
	

func _on_MorteQueda_body_entered(body):
	$Player.life -= 1
	$Control/CanvasLayer/life.set_text(str($Player.life))
	if $Player.life > 0:
		reset_player()
	else:
		$Control/CanvasLayer/HBoxContainer.show()


func _on_MorteQueda2_body_entered(body):
	$Player.life -= 1
	$Control/CanvasLayer/life.set_text(str($Player.life))
	if $Player.life > 0:
		reset_player()
	else:
		$Control/CanvasLayer/HBoxContainer.show()

func reset_player():
	$Player.position.x = 200
	$Player.position.y = 400
	$Player.gravity = 30

func reset_game():
	$Player.position.x = 250
	$Player.position.y = 400
	$Player.gravity = 30
	$Player.life = 3
	$Control/CanvasLayer/life.set_text(str($Player.life))


func _on_Control_nova_partida():
	$Control/CanvasLayer/HBoxContainer.hide()
	get_tree().change_scene("res://scenes/Fase.tscn")

	

func _on_Control_sair():
	get_tree().quit()


func _on_Coins__get_a_coin():
	coins += 1
	$Control/CanvasLayer/coins.set_text(str(coins))


func _on_Wario_dano():
	$Player.life -= 1
	$Control/CanvasLayer/life.set_text(str($Player.life))
	if $Player.life <= 0:
		$Control/CanvasLayer/HBoxContainer.show()
		$Player.queue_free()


func _on_Player_hit():
	$Player.life -= 1
	$Control/CanvasLayer/life.set_text(str($Player.life))
	if $Player.life <= 0:
		$Control/CanvasLayer/HBoxContainer.show()
		$Player.queue_free()
