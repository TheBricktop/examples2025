@tool
extends RigidBody3D
class_name Box3d_rigidbody
@export var size : Vector3 = Vector3(1,1,1) :
	set(value):
		update_mesh(value)
		size = value

var collision : CollisionShape3D
var collision_shape : Shape3D
var mesh_instance : MeshInstance3D
@export var is_dynamic : bool :
	set(value):
		is_dynamic = value
		freeze = !is_dynamic
		sleeping = !is_dynamic
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = BoxMesh.new()
	add_child(mesh_instance)
	collision = CollisionShape3D.new()
	collision_shape = BoxShape3D.new()
	collision.shape = collision_shape
	collision_shape.size = size
	add_child(collision)
	mesh_instance.mesh.size = size
	pass # Replace with function body.

func update_mesh(value: Vector3):
	if collision_shape:
		print(collision, "is collision")
		collision_shape.size = value
	mesh_instance.mesh.size = value
