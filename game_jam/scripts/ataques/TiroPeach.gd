extends Area2D

const speed = 400
var velocity = Vector2()
var time = 0
signal matarMario()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = -speed * delta 
	translate(velocity)
	time += delta
	
	if time > 3:
		queue_free()
	
	


func _on_TiroPeach_body_entered(body):
	if body.is_in_group("Player"):
		body.on_hit()
		queue_free()
