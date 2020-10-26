extends KinematicBody2D

var time = 0
var death = false
export var walk_speed = 1.5
var movement = Vector2((walk_speed), 0)

signal dano()

func _physics_process(delta):
	time += 1
	var collision = move_and_collide(-movement, walk_speed)
	$AnimatedSprite.play("walk")
	if collision:
		if !collision.collider.is_in_group("Player"):
			movement.x *= -1
			$AnimatedSprite.scale.x *= -1
		elif collision.collider.is_in_group("Player") && !death:
			print("dano")
			emit_signal("dano")
			movement.x *= -1
			$AnimatedSprite.scale.x *= -1
	if death:
		if time < 1:
			$AnimatedSprite.scale.x += 1
			$AnimatedSprite.scale.y += 1
			$AnimatedSprite.position.y += 100
		if time < 20:
			$AnimatedSprite.play("dead")
		else:
			queue_free()
	
	
	
func _on_up_body_entered(body): 
	time = 0
	death = true
	
