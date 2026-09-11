class_name Player
extends CharacterBody2D

@export var speed : float = 400

# References your AnimatedSprite2D node
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("left", "right", "up", "down")
	velocity = input_vector * speed
	
	# --- ANIMATION LOGIC ---
	if input_vector != Vector2.ZERO:
		# Check horizontal movement first
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				animated_sprite.play("walk_right")
			else:
				animated_sprite.play("walk_left")
		# Check vertical movement
		else:
			if input_vector.y > 0:
				animated_sprite.play("walk_down")
			else:
				animated_sprite.play("walk_up")
	else:
		# Stops the animation frames from cycling when you stand still
		animated_sprite.stop()
		# Optional: You can set a specific frame like frame 0 if you want them to look idle
		# animated_sprite.frame = 0
	# -----------------------

	move_and_slide()
