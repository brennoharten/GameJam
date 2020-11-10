extends StaticBody2D

export var life = 2

signal get_a_Star()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if life > 1:
			Global.add_coins(5)
			$coinsAnimated.play("up")
			emit_signal("get_a_Star")
		life -= 1
		if life <= 0:
			queue_free()
		
		
	
