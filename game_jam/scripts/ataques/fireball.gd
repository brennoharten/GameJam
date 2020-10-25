extends Area2D

const speed = 400
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = -speed * delta 
	translate(velocity)
	$AnimatedSprite.play("shoot")
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	




func _on_fireball_body_entered(body):
	if "Player" in body.name:
		body._on_Enimies_dano()
