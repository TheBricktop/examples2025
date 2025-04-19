extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@export var SPEED : float = 2.0
@export var Rotation_SPEED : float = .1
@export var radius : float = 50
@onready var model: Node3D = $Model
@onready var animation_player: AnimationPlayer = $Model/Barbarian/AnimationPlayer
@onready var random_roam_timer: Timer = $RandomRoamTimer
@onready var startpos = self.global_position
@onready var lastpos = self.global_position
var destination : Vector3
var direction : Vector3

func _physics_process(delta: float) -> void:
	if navigation_agent_3d.is_navigation_finished():
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		animation_player.play("Idle")
		if random_roam_timer.is_stopped(): random_roam_timer.start(randi_range(3,5))
	else:
		animation_player.play("Walking_A")
		destination = navigation_agent_3d.get_next_path_position()
		var local_destination = destination - global_position
		direction = local_destination.normalized()
		
		velocity = direction * SPEED
		
		var newTransform = model.transform.looking_at(-velocity,Vector3.UP)
		model.transform = model.transform.interpolate_with(newTransform,Rotation_SPEED)
		model.global_rotation = Vector3(0,model.global_rotation.y,0)
	move_and_slide()
 
func _on_random_roam_timer_timeout() -> void:
	navigation_agent_3d.target_position = startpos + Vector3(randf_range(-radius,radius),0,randf_range(-radius,radius))
	pass # Replace with function body.
