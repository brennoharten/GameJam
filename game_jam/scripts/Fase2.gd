extends Node2D


# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
	GlobalControl.get_node("CanvasLayer/coins").set_text(str(Global.coins))
	GlobalControl.get_node("CanvasLayer/Tempo").set_text(str(Global.tempo))
	#$Control/CanvasLayer/life.set_text(str(Global.vida))
	#$Control/CanvasLayer/coins.set_text(str(Global.coins))
	#$Control/CanvasLayer/Tempo.set_text(str(Global.tempo))
	$SomJogo.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Luigi_dano():
	Global.perder_vida()
	GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
	#$Control/CanvasLayer/life.set_text(str(Global.vida))
	if Global.vida <= 0:
		GlobalControl.get_node("CanvasLayer/HBoxContainer").show()
		$Player.queue_free()
		

func _on_MorteQueda_body_entered(body):
	if body.is_in_group("Player"):
		Global.perder_vida()
		GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
		if Global.vida > 0:
			reset_player()
		else:
		#$Control/CanvasLayer/HBoxContainer.show()
			GlobalControl.get_node("CanvasLayer/HBoxContainer").show()

func _on_MorteQueda2_body_entered(body):
	if body.is_in_group("Player"):	
		Global.perder_vida()
		GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
		if Global.vida > 0:
			reset_player()
		else:
			#$Control/CanvasLayer/HBoxContainer.show()
			GlobalControl.get_node("CanvasLayer/HBoxContainer").show()

func reset_player():
	$Player.position.x = 41
	$Player.position.y = 420
	$Player.gravity = 30


func _on_Coins__get_a_coin():
	#$Control/CanvasLayer/coins.set_text(str(Global.coins))
	GlobalControl.get_node("CanvasLayer/coins").set_text(str(Global.coins))


func _on_Wario_dano():
	Global.perder_vida()
	#$Control/CanvasLayer/life.set_text(str(Global.vida))
	GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
	if Global.vida <= 0:
		#$Control/CanvasLayer/HBoxContainer.show()
		GlobalControl.get_node("CanvasLayer/HBoxContainer").show()
		$Player.queue_free()


func _on_Player_hit():
	Global.perder_vida()
	#$Control/CanvasLayer/life.set_text(str(Global.vida))
	GlobalControl.get_node("CanvasLayer/life").set_text(str(Global.vida))
	if Global.vida <= 0:
		#$Control/CanvasLayer/HBoxContainer.show()
		GlobalControl.get_node("CanvasLayer/HBoxContainer").show()
		$Player.queue_free()


func _on_Timer_timeout():
	Global.tempo += 1
	#$Control/CanvasLayer/Tempo.set_text(str(Global.tempo))
	GlobalControl.get_node("CanvasLayer/Tempo").set_text(str(Global.tempo))
	if Global.tempo % 10 == 0:
		$Player.gravity *= -1

func _on_Boss_kill_the_boss():
	$Portao.hide()
	$Portao/CollisionShape2D.set_deferred("disabled", true)


func _on_Star_get_a_Star():
	#$Control/CanvasLayer/coins.set_text(str(Global.coins))
	GlobalControl.get_node("CanvasLayer/coins").set_text(str(Global.coins))
