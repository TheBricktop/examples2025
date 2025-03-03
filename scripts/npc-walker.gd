extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D

@export var SPEED := 2.0
@export var SPRINT := 2.0
@export var JUMP_VELOCITY := 4.5
@export var model_rotation_speed:float = 4

@onready var model_root: Node3D = $model_root

@export var push_force := 2
var input_enabled := true

@export var animation_player: AnimationPlayer 
var sprint : float = 0
var destination : Vector3
var direction : Vector3
var step : bool = false

func _physics_process(delta: float) -> void:
	if navigation_agent_3d.is_navigation_finished():
		animation_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	else:
		destination = navigation_agent_3d.get_next_path_position()
		var local_destination = destination - global_position
		direction = local_destination.normalized()

		#if sprint: animation_player.play("sprint")
		#else:
		animation_player.play("walk")
			
		var new_transform = model_root.transform.looking_at(-direction, Vector3.UP)
		model_root.transform = model_root.transform.interpolate_with(new_transform, delta * model_rotation_speed)
		model_root.rotation = Vector3(0,model_root.rotation.y,0)

		for i in get_slide_collision_count():
			var c := get_slide_collision(i)
			if c.get_collider() is RigidBody3D:
				c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
		
		velocity = direction * SPEED
		
	if !is_on_floor() and not step:
		velocity.y += get_gravity().y
	
	if step and not is_on_floor():
		velocity.y -= get_gravity().y * delta
			
	move_and_slide()


func _on_step_on_body_entered(body: Node3D) -> void:
	step = true
	pass # Replace with function body.


func _on_step_on_body_exited(body: Node3D) -> void:
	step = false
	pass # Replace with function body.
