extends KinematicBody2D

var time = 0
export var walk_speed = 1.5
var movement = Vector2((walk_speed), 0)
var direcao = 1
var tempoLado = 0

signal dano()

func _physics_process(delta):
	time += delta
	tempoLado += delta
	
	if tempoLado > 3.5:
		movement *= - 1
		tempoLado = 0
		update_animations()
	
	var collision = move_and_collide(-movement, walk_speed)
	
	if collision:
		if collision.collider.is_in_group("Player") and time > 0.7:
			$AnimatedSprite.play("attack")
			emit_signal("dano")
			time = 0
	else:	
		$AnimatedSprite.play("walk")	
	

func update_animations():
	if movement.x > 0:
		$AnimatedSprite.scale.x = 1
	elif movement.x < 0:
		$AnimatedSprite.scale.x = -1
	
	
	
