extends StaticBody2D


export var life = 3 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		life -= 1
		if life <= 0:
			queue_free()
		
		$blockAnimated.play("hit")
	
