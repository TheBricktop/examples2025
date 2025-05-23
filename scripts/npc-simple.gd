extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@export var SPEED : float = 2.0

var destination : Vector3
var direction : Vector3

func _physics_process(delta: float) -> void:
	if navigation_agent_3d.is_navigation_finished():
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	else:
		destination = navigation_agent_3d.get_next_path_position()
		var local_destination = destination - global_position
		direction = local_destination.normalized()
		velocity = direction * SPEED

	move_and_slide()
