@tool
extends RigidBody3D
@export var size : Vector3 = Vector3(1,1,1) :
	set(value):
		update_mesh(value)
		size = value
		
@onready var mesh_instance: MeshInstance3D = $MeshInstance3D
@onready var collision_shape: CollisionShape3D = $CollisionShape3D


@export var mat_override : StandardMaterial3D:
	set(value):
		mat_override = value
		
@export var is_dynamic : bool :
	set(value):
		is_dynamic = value
		freeze = !is_dynamic
		sleeping = !is_dynamic
		

func update_mesh(value: Vector3):
	if collision_shape:
		collision_shape.shape.size = value
	if mesh_instance:
		mesh_instance.mesh.size = value
