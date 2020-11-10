extends StaticBody2D

var chave = false
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	time += 1
	if chave:
		$AnimationPlayer.play("Down")
		
	
	if time > 500 && chave == true:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		time = 0
		chave = true
