extends Node2D


# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/CanvasLayer/life.set_text(str(Global.vida))
	$Control/CanvasLayer/coins.set_text(str(Global.coins))
	$Control/CanvasLayer/Tempo.set_text(str(Global.tempo))
	$SomJogo.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Luigi_dano():
	Global.perder_vida()
	$Control/CanvasLayer/life.set_text(str(Global.vida))
	if Global.vida <= 0:
		$Control/CanvasLayer/HBoxContainer.show()
		$Player.queue_free()
	

func _on_MorteQueda_body_entered(body):
	Global.perder_vida()
	$Control/CanvasLayer/life.set_text(str(Global.vida))
	if Global.vida > 0:
		reset_player()
	else:
		$Control/CanvasLayer/HBoxContainer.show()


func _on_MorteQueda2_body_entered(body):
	Global.perder_vida()
	$Control/CanvasLayer/life.set_text(str(Global.vida))
	if Global.vida > 0:
		reset_player()
	else:
		$Control/CanvasLayer/HBoxContainer.show()

func reset_player():
	$Player.position.x = 200
	$Player.position.y = 400
	$Player.gravity = 30


func _on_Control_nova_partida():
	$Control/CanvasLayer/HBoxContainer.hide()
	Global.reset_vida()
	Global.reset_coins()
	Global.reset_tempo()
	get_tree().change_scene("res://scenes/Fase.tscn")

	

func _on_Control_sair():
	get_tree().quit()


func _on_Coins__get_a_coin():
	$Control/CanvasLayer/coins.set_text(str(Global.coins))


func _on_Wario_dano():
	Global.perder_vida()
	$Control/CanvasLayer/life.set_text(str(Global.vida))
	if Global.vida <= 0:
		$Control/CanvasLayer/HBoxContainer.show()
		$Player.queue_free()


func _on_Player_hit():
	Global.perder_vida()
	$Control/CanvasLayer/life.set_text(str(Global.vida))
	if Global.vida <= 0:
		$Control/CanvasLayer/HBoxContainer.show()
		$Player.queue_free()


func _on_Timer_timeout():
	Global.tempo += 1
	$Control/CanvasLayer/Tempo.set_text(str(Global.tempo))
