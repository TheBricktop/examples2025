extends Node3D
class_name Push_module
@export var body : CharacterBody3D
@export var mass : float = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent = get_parent_node_3d()
	if parent is CharacterBody3D:
		body = parent
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
# rigidbody interaction
	for i in body.get_slide_collision_count():
		var c := body.get_slide_collision(i)
		var col = c.get_collider()
		if col is RigidBody3D:
			col.apply_central_impulse(-c.get_normal() * mass * body.velocity)
	pass
