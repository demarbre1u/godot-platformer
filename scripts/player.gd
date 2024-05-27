extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var game_manager = %GameManager

const SPEED = 300.0
const JUMP_VELOCITY = -550.0
const WALL_JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canMove = false;

func _ready():
	canMove = false
	sprite_2d.flip_h = true

func _physics_process(delta):
	if game_manager.is_paused:
		return
	
	if not canMove: 
		return
	
	if velocity.x > 1 || velocity.x < -1:
		sprite_2d.play("running")
	else:
		sprite_2d.play("default")
				
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.play("jumping")
		
	if is_on_wall_only():
		if Input.is_action_pressed("left"):
			sprite_2d.play("walljump")
			sprite_2d.set_flip_h(true)			
		if Input.is_action_pressed("right"):
			sprite_2d.play("walljump")
			sprite_2d.set_flip_h(false)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED / 5)
		sprite_2d.set_flip_h(direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED / 5)

	move_and_slide()

	# Handle jump.
	if Input.is_action_just_pressed("up"): 
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		if is_on_wall_only():
			velocity.y = JUMP_VELOCITY
			if Input.is_action_pressed("left"):
				velocity.x = -WALL_JUMP_VELOCITY
			if Input.is_action_pressed("right"):
				velocity.x = WALL_JUMP_VELOCITY

func _on_sprite_2d_animation_changed():
	if sprite_2d && sprite_2d.animation == "disappearing":
		canMove = false
	
func _on_sprite_2d_animation_finished():
	if sprite_2d.animation == "appearing":
		sprite_2d.play("default")
		sprite_2d.flip_h = false
		canMove = true

	if sprite_2d.animation == "disappearing":
		game_manager.game_over()
