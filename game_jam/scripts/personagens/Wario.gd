extends KinematicBody2D

var time = 0
export var walk_speed = 1.5
var movement = Vector2((walk_speed), 0)
var direcao = 1
var tempoLado = 0
var damage = 0
signal dano()
signal morte()


func _physics_process(delta):
	time += delta
	tempoLado += delta
	
	if tempoLado > 3.5:
		movement *= - 1
		tempoLado = 0
		update_animations()
	
	var collision = move_and_collide(-movement, walk_speed)
	
	if collision:
		if collision.collider.is_in_group("Player") and damage == 1 and  time > 0.4:
			$AnimatedSprite.play("attack")
			emit_signal("dano")
			time = 0
			damage = 0
	else:	
		$AnimatedSprite.play("walk")	
	

func update_animations():
	if movement.x > 0:
		$AnimatedSprite.scale.x = 0.7
	elif movement.x < 0:
		$AnimatedSprite.scale.x = -0.7
	
	

func _on_Morte_body_entered(body):
	queue_free()


func _on_Maozada_body_entered(body):
	if body.is_in_group("Player"):
		damage = 1
