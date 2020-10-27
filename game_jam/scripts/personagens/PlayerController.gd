extends KinematicBody2D

export var gravity = 30
export var walk_speed = 250
export var jump_speed = 600
var movement = Vector2(0, 0)
export var life = 3
var time = 0 
signal game_over()
signal damage()

var can_double_jump = true

func _physics_process(delta):
	time += 1
	if life == 0:
		if time < 30:
			$AnimatedSprite.play("dead")
			emit_signal("game_over")
		else:
			queue_free()
	
	if !is_on_floor():
		movement.y += gravity
	else:
		if gravity > 0:
			movement.y = 1
		else:
			movement.y = -1
		can_double_jump = true
	
	var horinzontal_axis = Input.get_action_strength("right") - Input.get_action_strength("left")
	movement.x = horinzontal_axis * walk_speed
	
	
		

	if Input.is_action_just_pressed("jump") and is_on_floor():
		if $AnimatedSprite.flip_v == false:
			movement.y = -jump_speed
		else:
			movement.y = jump_speed
	elif Input.is_action_just_pressed("jump") and can_double_jump:
		if $AnimatedSprite.flip_v == false:
			movement.y = -jump_speed
		else:
			movement.y = jump_speed
		can_double_jump = false
	if gravity < 0:
		
		$AnimatedSprite.flip_v = 1
		move_and_slide(movement, Vector2.DOWN)
	else:
		$AnimatedSprite.flip_v = 0
		move_and_slide(movement, Vector2.UP)
	
	if is_on_ceiling():
		movement.y = 0
	
	update_animations()
	
	
func update_animations():
	if movement.x > 0:
		$AnimatedSprite.scale.x = 2
	elif movement.x < 0:
		$AnimatedSprite.scale.x = -2
	
	if is_on_floor() && life > 0:
		if abs(movement.x) > 0:
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("idle")
	else:
		$AnimatedSprite.play("jump")
	


	
#Acho q nem vai precisar
#func invert_gravity():
#	gravity *= -1
