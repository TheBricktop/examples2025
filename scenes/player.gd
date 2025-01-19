extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
enum state {idle,walking,jump}
var currentState : state = state.idle 
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var jump_timer: Timer = $JumpTimer
var jumping  : bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		currentState = state.jump
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if not jumping:
			currentState = state.walking
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not jumping:
			currentState = state.idle
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jumping = true
		jump_timer.start()
		velocity.y = JUMP_VELOCITY
		
	move_and_slide()
	
	if jumping:
		animation_player.play("jump")
	
	match currentState:
		state.walking:
			animation_player.play("walk")
			pass
		state.idle:
			animation_player.play("idle")
			pass
			


func _on_jump_timer_timeout() -> void:
	jumping = false
	pass # Replace with function body.
