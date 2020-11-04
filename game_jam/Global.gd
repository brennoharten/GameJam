extends Node


var coins = 0
var vida = 3
var tempo = 0

func _ready():
	pass # Replace with function body.


func add_coins(valor):
	coins += valor


func reset_coins():
	coins = 0

func perder_vida():
	vida -= 1

func reset_vida():
	vida = 3

func reset_tempo():
	tempo = 0
