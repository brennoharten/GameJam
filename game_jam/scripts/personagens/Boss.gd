extends KinematicBody2D

export var gravity = 10
var movement = Vector2(0, 0)
export var life = 1
var time = 0 
const FIREBALL = preload("res://scenes/ataques/fireball.tscn")
var fall = false
var is_dead = false
signal kill_the_boss()


func _physics_process(delta):
	time += 1
	if is_dead:
		if time < 30:
			emit_signal("kill_the_boss")
			$AnimatedSprite.play("dead")
		else:
			queue_free()
	
	if !is_on_floor() && fall && !is_dead:
		movement.y += gravity
		$AnimatedSprite.play("falling")
	else:
		movement.y = 0
	
	time += 1
	if is_on_floor() && !is_dead:
		if time > 20:
			$AnimatedSprite.play("idle")
		if time > 150:
			time = 0 
			var fireball = FIREBALL.instance()
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position
			$AnimatedSprite.play("firing")
	
	move_and_slide(movement, Vector2.UP)
	
	if is_on_ceiling():
		movement.y = 0
	
	


func _on_Control_Boss():
	fall = true 


func _on_Area2D_body_entered(body):
	time = 0 
	life -= 1 
	if life == 0:
		is_dead = true
