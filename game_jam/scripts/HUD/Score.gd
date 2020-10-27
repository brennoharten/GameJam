extends Control

signal sair
signal nova_partida

func _ready():
	pass

func _on_Nova_partida_pressed():
	emit_signal("nova_partida")


func _on_Sair_pressed():
	emit_signal("sair")
