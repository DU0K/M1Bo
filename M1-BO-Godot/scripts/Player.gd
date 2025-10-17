extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var speed = 400
var jumpspeed = -450

func _physics_process(delta):
	
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jumpspeed
		$AnimatedSprite2D.play("Jump")
		$AudioStreamPlayer2D.play()
	elif Input.is_action_pressed("ui_right") and is_on_floor():
		$AnimatedSprite2D.play("Walk")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_left") and is_on_floor():
		$AnimatedSprite2D.play("Walk")
		$AnimatedSprite2D.flip_h = true
	elif is_on_floor() and not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("Idle")
	
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
	
