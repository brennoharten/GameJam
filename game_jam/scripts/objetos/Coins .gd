extends Area2D

var pegou = 0
signal get_a_coin()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

		
func _on_Coins__body_entered(body):
	if body.is_in_group("Player"):
		$som.play()
		emit_signal("get_a_coin")
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
