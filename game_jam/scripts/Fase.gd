extends Node2D

var tempoHistoria = 0

func _ready():
	$musicaFase1.play()
	$Player.walk_speed = 0
	GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
	GlobalControl.get_node("CanvasLayer/coins").set_text(str(Global.coins))
	GlobalControl.get_node("CanvasLayer/Tempo").set_text(str(Global.tempo))
	GlobalControl.get_node("CanvasLayer/Historia").show()
	#$Control/CanvasLayer/life.set_text(str(Global.vida))
	#$Control/CanvasLayer/coins.set_text(str(Global.coins))
	#$Control/CanvasLayer/Tempo.set_text(str(Global.tempo))
	#$Control/CanvasLayer/Historia.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	Global.tempo += 1
	#$Control/CanvasLayer/Tempo.set_text(str(Global.tempo))
	GlobalControl.get_node("CanvasLayer/Tempo").set_text(str(Global.tempo))
	if Global.tempo % 15 == 0:
		$Player.gravity *= -1

func _on_MorteQueda2_body_entered(body):
	if body.is_in_group("Player"):
		Global.perder_vida()
		#$Control/CanvasLayer/life.set_text(str(Global.vida))
		GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
		if Global.vida > 0: 
			GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
			reset_player()
		else:
			#$Control/CanvasLayer/HBoxContainer.show()
			GlobalControl.get_node("CanvasLayer/HBoxContainer").show()

func _on_MorteQueda_body_entered(body):
	if body.is_in_group("Player"):
		Global.perder_vida()
		#$Control/CanvasLayer/life.set_text(str(Global.vida))
		GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
		if Global.vida > 0:
			reset_player()
		else:
			#$Control/CanvasLayer/HBoxContainer.show()
			GlobalControl.get_node("CanvasLayer/HBoxContainer").show()

func reset_player():
	$Player.gravity = 30
	$Player.position.x = 150
	$Player.position.y = 400


#func _on_Control_nova_partida():
#	Global.reset_vida()
#	Global.reset_coins()
#	Global.reset_tempo()
#	get_tree().reload_current_scene()


#func _on_Control_sair():
#	get_tree().quit()


func _on_Coins__get_a_coin():
	#$Control/CanvasLayer/coins.set_text(str(Global.coins))
	GlobalControl.get_node("CanvasLayer/coins").set_text(str(Global.coins))

func _on_BuracoNegro_body_entered(body):
	get_tree().change_scene("res://scenes/Fase2.tscn")

func _on_Enimies_dano():
	Global.perder_vida()
	GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
	if Global.vida > 0:
		reset_player()
	else:
		#$Control/CanvasLayer/HBoxContainer.show()
		GlobalControl.get_node("CanvasLayer/HBoxContainer").show()

func _on_Star_get_a_Star():
	Global.add_coins(5)
	GlobalControl.get_node("CanvasLayer/coins").set_text(str(Global.coins))



func _on_TimerHistoria_timeout():
	#$Control/CanvasLayer/Historia.hide()
	GlobalControl.get_node("CanvasLayer/Historia").hide()
	$Player.walk_speed = 250
	Global.tempo = 0
	
	
