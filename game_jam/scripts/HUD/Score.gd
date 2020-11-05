extends Control

signal sair
signal nova_partida


func _ready():
	pass

func _on_Nova_partida_pressed():
	Global.reset_vida()
	Global.reset_coins()
	Global.reset_tempo()
	GlobalControl.get_node("CanvasLayer/HBoxContainer").hide()
	get_tree().change_scene("res://scenes/Fase.tscn")

func _on_Sair_pressed():
	get_tree().quit()
