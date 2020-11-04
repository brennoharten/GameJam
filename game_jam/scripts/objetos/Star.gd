extends StaticBody2D


signal get_a_Star()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):	
		$coinsAnimated.play("up")
		emit_signal("get_a_Star")
		queue_free()
		
