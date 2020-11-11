extends KinematicBody2D



var time = 0
export var walk_speed = 1.5
var movement = Vector2((walk_speed), 0)
var direcao = -1
var tempoLado = 0
var damage = 0
const tiro1 = preload("res://scenes/ataques/TiroPeach.tscn")
var atirar = 0
var vida = 3

signal vitoria

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	time += delta
	tempoLado += delta
	
	#if tempoLado > 3.5:
	#	movement *= - 1
	#	tempoLado = 0
	#	direcao *= -1
	#	update_animations()
	
	var collision = move_and_collide(-movement, walk_speed)
	
	if collision:
		if !collision.collider.is_in_group("Player"):
			movement.x *= -1
			direcao *= -1
			update_animations()
	
	if atirar == 1 and time > 0.5 and direcao == -1:
		var tiro = tiro1.instance()
		get_parent().add_child(tiro)
		tiro.position = $AnimatedSprite/Position2D.global_position
	#elif atirar == 1 and time > 1 and direcao == 1:
		var tiro2 = tiro1.instance()
		tiro2.speed *= -1
		get_parent().add_child(tiro2)
		tiro2.position = $AnimatedSprite/Position2D2.global_position
		$AnimatedSprite.play("attack")
		time = 0
	
	atirar = 0
	$AnimatedSprite.play("Walk")
	
func update_animations():
	if movement.x > 0:
		$AnimatedSprite.scale.x = 1
	elif movement.x < 0:
		$AnimatedSprite.scale.x = -1
	
	

func _on_AtiradorDeMarios_body_entered(body):
	if body.is_in_group("Player"):
		atirar = 1
	
		


func _on_Morte_body_entered(body):
	vida -= 1
	walk_speed += 3
	movement = Vector2((walk_speed), 0)
	if vida <= 0:
		GlobalControl.get_node("CanvasLayer/HBoxContainer2").show()
		queue_free()
