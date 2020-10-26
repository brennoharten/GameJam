extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tempo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	tempo += 1
	$Control/CanvasLayer/Tempo.set_text(str(tempo))
	if tempo == 12:
		$Player.gravity *= -1
